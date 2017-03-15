/**
 *
 * @file acqDataProc.c
 * @author Bernardo Carvalho
 * @date 2015-09-2
 * @brief program module to aquire data from ATCA IOC board (Version IPP)
 *
 *
 * Change History:
 *
 * Revision 1.0 2015-09-2
 * 	Initial adaptation from getDataMem.c
 *
 * SVN keywords
 * $Author: bernardo $
 * $Date: 2017-03-03 08:37:11 +0000 (Fri, 03 Mar 2017) $
 * $Revision: 9981 $
 * $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_INTLCK_FP/Software/apps/acqDataProc.c $
 */

#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <errno.h>
#include <time.h>
#include <math.h>
#include <libconfig.h>

#include "atca-ioc-int-lib.h"


//#define N_DMA_PER_FILE 305// 10 s 3125
#define N_DMA_PER_SECOND 31// 10 s 3125

//#define RT_PROG

#define CHOP_MAX_CNT 2000 //  1 kHz

//#define DAC_CHAN 10   
#define DSP_CHAN 13  

int fd_adc = 0; /*global, to be used on sig_handler*/
FILE * fd_data, * fd_chop, * fd_int, * fd_dsp;
int32_t * dmaBuff; //user space buffer for data

size_t saveSize;
int32_t * pAdcData;

int64_t timespecDiff(struct timespec *timeA_p, struct timespec *timeB_p){
  return ((timeA_p->tv_sec * 1000000000UL) + timeA_p->tv_nsec) -
    ((timeB_p->tv_sec * 1000000000UL) + timeB_p->tv_nsec);
}

void close_atca(){
  stop_device(fd_adc);
  close(fd_adc);
}

/*
  http://stackoverflow.com/questions/1641182/how-can-i-catch-a-ctrl-c-event-c
  SIGNAL HANDLER for Ctrl-C, mainly
*/
void sig_handler(int s){

  printf(", Caught signal %d. Closing ADC board\n",s);
  close_atca();
  free( dmaBuff);
  exit(1); 
}

void save_mem_to_disk(int n_dmas){
  int i,k; //, ival, chop;
  int32_t * padcDataWr;
 
  padcDataWr=pAdcData;
  
  for(i=0; i< n_dmas; i++){
    for(k=0; k< N_SAMP_P_DMA; k++){
      fwrite(padcDataWr, sizeof(int32_t), ADC_N_CHAN, fd_data);
      fwrite(&padcDataWr[ADC_N_CHAN], sizeof(float), ADC_N_CHAN, fd_int);
      fwrite(&padcDataWr[CHAN_CHOP], sizeof(int32_t), 1, fd_chop);
      fwrite(&padcDataWr[DSP_CHAN], sizeof(float), 1, fd_dsp);
      padcDataWr +=  DMA_N_CHAN;// * sizeof(int32_t); // goto next packet
    }
  }
}

int main (int argc, char** argv){
  int retval = 0;
  char write_file_name[64];
  //  struct atca_iop_int_packet adcData[SAMP_PER_DMA];
  const char *dev_name = NULL;
  const char *fd_name = NULL;
  const char *fc_name = NULL;
  
  int rc, i;
  //int16_t sval;
  struct timespec start, stcpy, end; //, dif;
  uint64_t timeElapsed ;
  int32_t * pAdcDataWrt;

  long int nsamp;
  union Coeff
  {
    int i;
    float f;
  } dsp_coeff;  

  double intOffD[ADC_N_CHAN];

  int * adc_eo_offset,  * adc_wo_offset;
  //unsigned int tmp;
  //  uint8_t selectedCard = 14;
  int   dataCfg, strigger=0;
  double   dataCfgD;
  unsigned int adc_n_chans=1;
  unsigned int acq_seconds;
  unsigned int n_dmas;//1 N_CYCLES;
  //unsigned int channel = 0;
  //long atime64, lastime64=0, dtime64;
  config_t cfg;
  config_setting_t *setting;

  struct sigaction sigIntHandler;

  sigIntHandler.sa_handler = sig_handler;
  sigemptyset(&sigIntHandler.sa_mask);
  sigIntHandler.sa_flags = 0;

  sigaction(SIGINT, &sigIntHandler, NULL);
  /*
  if(argc > 3){
    chop_prd = atoi(argv[3]); // CHOP_MAX_CNT
  }
  if(argc > 2){
    //channel = atoi(argv[2]);
    //channel &= 0x1; //only chann 0 and 1
  }
  */
  if(argc < 2){
    printf("%s configFile\n", argv[0]);
    return -1;
  }

  config_init(&cfg);
  if (!config_read_file(&cfg, argv[1])) {
    fprintf(stderr, "%s:%d - %s\n",
	    argv[1],
            //          config_error_file(cf),
            config_error_line(&cfg),
            config_error_text(&cfg));
    config_destroy(&cfg);
    return(EXIT_FAILURE);
  }

  //#define DMA_ACQ_SIZE (4096*1024) // 4194304B,  4Mb //(4096 * 100)
//#define N_SAMP_P_DMA (DMA_SIZE/NUM_CHAN_SMP/4)  // nr samples per buffer (IRQ)
//#define N_CHAN 16 // nr of signal transferred (32 bit)
//#define ADC_N_CHAN 8 // nr of adc raw channel transferred (32 bit)
//#define N_SAMP_P_DMA  (DMA_ACQ_SIZE/N_CHAN/4) 
//#define N_DMA_PER_FILE 305// 10 s 3125

#ifdef RT_PROG
  run_RT();
#endif /* RT_PROG */


  /* Open ATCA device */
  if (config_lookup_string(&cfg, "atca_dev_name", &dev_name))
    printf("ATCA dev: %s\n", dev_name);
  else {
    printf("No atca_dev_name parameter: %s\n", dev_name);
    return(EXIT_FAILURE);
  }

  //  sprintf(str,"%s%d", RESOURCE_NAME_DAQ, selectedCard);
  fd_adc = open(dev_name, O_RDWR );
  if (fd_adc < 0){
    printf("can open %s\n", dev_name);
    return -1;
  }

  if (!config_lookup_string(&cfg, "raw_filename", &fd_name)) {
    printf("No raw_filename parameter: %s\n", fd_name);
    close(fd_adc);
    return(EXIT_FAILURE);
  }

  if (!config_lookup_string(&cfg, "chop_filename", &fc_name)) {
    printf("No chop_filename parameter: %s\n", fc_name);
    close(fd_adc);
    return(EXIT_FAILURE);
  }

  //sprintf(write_file_name,"%s-%d.bin", FILE_NAME_WRITE, 0);
  fd_data =  fopen(fd_name,"wb"); 
  //  fd_data =  fopen(write_file_name,"wb");            
/*Test if can open files to write */ 
  fclose(fd_data); 

  if (config_lookup_int(&cfg, "adc_num_channels", &dataCfg)){
    adc_n_chans=dataCfg;
    PDEBUG("adc_num_channels= %d\n", adc_n_chans);
  }
  else {
    printf("adc_num_channels is not defined\n");
    return(EXIT_FAILURE);
  }

  if (config_lookup_int(&cfg, "acq_seconds", &dataCfg)){
    acq_seconds=dataCfg;
    PDEBUG("acq_seconds= %d\n", dataCfg);
  }
  else {
    printf("acq_seconds is not defined\n");
    return(EXIT_FAILURE);
  }

  n_dmas= acq_seconds * N_DMA_PER_SECOND;
  saveSize= DMA_ACQ_SIZE * n_dmas;//N_DMA_PER_FILE; //8192 * 100000; // 10 s
  //  printf("Page size on your system = %i bytes, %li \n",  getpagesize(), 
  //	 saveSize);
  //printf("ncycles:%d, channel:%d\n", ncycles, ADC_CHAN);

  pAdcData = (int32_t *) malloc(saveSize);
  
  if(pAdcData==NULL){
    printf("Malloc NOK = %i bytes \n", (int) saveSize);
    return -1;
  }

  adc_eo_offset= (int *) calloc (adc_n_chans, sizeof(int));
  setting = config_lookup(&cfg, "adc_modules.eo_offsets");
  dataCfg = config_setting_length(setting);
  //  printf("data %d \n", data);

  if (dataCfg!=adc_n_chans) {
    printf("adc_n_chans is not the same as number of eo offset params\n");
    return(EXIT_FAILURE);
  }

  PDEBUG("EO coefs: ");
  for (i = 0; i < adc_n_chans; i++) {
    adc_eo_offset[i] =   config_setting_get_int_elem(setting, i);
    //    printf("\t#%d. %d\n",i, eo_offset[i]);
    PDEBUG(" %d, ", adc_eo_offset[i]);
  }
  PDEBUG("\n");

  adc_wo_offset = (int *) calloc(ADC_N_CHAN, sizeof (int));
  setting = config_lookup(&cfg, "adc_modules.wo_offsets");
  dataCfg = config_setting_length(setting);
  //  printf("data %d \n", data);

  if (dataCfg!=adc_n_chans) {
    printf("adc_n_chans is not the same as number of WO offset params\n");
    return(EXIT_FAILURE);
  }
  PDEBUG("WO coefs: ");
  for (i = 0; i < adc_n_chans; i++) {
    adc_wo_offset[i]= round( config_setting_get_float_elem(setting, i)*(1<<16));
    PDEBUG(", %d:%f,",  adc_wo_offset[i],  config_setting_get_float_elem(setting, i));
  }
  PDEBUG("\n");

  stop_device(fd_adc);

  acq_init_device(fd_adc, ADC_N_CHAN, DMA_ACQ_SIZE, CHOP_MAX_CNT, 
		  adc_eo_offset, adc_wo_offset);
  free(adc_eo_offset); free(adc_wo_offset);
  
  setting = config_lookup(&cfg, "dsp_processing.chann_coeff");
  dataCfg = config_setting_length(setting);
  //  printf("data %d \n", data);

  if (dataCfg!= 6) {
    printf("6  is not the  number of dsp_processing.chann_coeff params\n");
    return(EXIT_FAILURE);
  }
  PDEBUG("DSP coefs: ");
  PDEBUG(".chann_coeff: ");
  for (i = 0; i < 6; i++) {
    dsp_coeff.f= config_setting_get_float_elem(setting, i);
    write_coeff_reg(fd_adc, i, dsp_coeff.i);
    PDEBUG(", %f,",   dsp_coeff.f);
  }
  PDEBUG("\n");

  PDEBUG("ADDER coeff: ");
  if (config_lookup_float(&cfg, "dsp_processing.adder_coeff", &dataCfgD)){
    dsp_coeff.f=dataCfgD;
    PDEBUG("dsp_processing.adder_coeff= %f\n", dsp_coeff.f);
  }
  else {
    printf("dsp_processing.adder_coeff is not defined\n");
    return(EXIT_FAILURE);
  }
  write_coeff_reg(fd_adc, 6, dsp_coeff.i);

/*
  for(i=0; i< 6; i++) {
   // dsp_coeff.f=0.0;
    write_coeff_reg(fd_adc, i, dsp_coeff.i);
  }
  dsp_coeff.f=7.0e-5; // To get DAC out with Vinput 100Hz 10V
  //dsp_coeff.f=1.0;
  write_coeff_reg(fd_adc, 5, dsp_coeff.i);
  */

  dmaBuff = (int32_t *) malloc(DMA_ACQ_SIZE); // user space buffer for DMA data

  if (config_lookup_bool(&cfg, "soft_trigger", &dataCfg)){
    strigger = dataCfg;
    PDEBUG("soft_trigger = %d\n", dataCfg);
  }


  pAdcDataWrt = pAdcData;

  /* Open Write Files */ 
  //  sprintf(write_file_name,"%s-%d.bin", FILE_NAME_WRITE, 8);
  //  fd_data =  fopen(write_file_name,"wb"); 
  fd_data =  fopen(fd_name,"wb"); 
  //  fd_data =  fopen("rawdata.bin","wb"); 
  fd_chop =  fopen(fc_name,"wb");                                        //  sprintf(write_file_name,"%s.bin", INT_NAME_WRITE);
  sprintf(write_file_name,"intFdata.bin");
  fd_int =  fopen(write_file_name,"wb"); 

  sprintf(write_file_name,"dspData.bin");
  fd_dsp =  fopen(write_file_name,"wb"); 
  
  clock_gettime(CLOCK_MONOTONIC, &start);

  stcpy.tv_sec = start.tv_sec; stcpy.tv_nsec = start.tv_nsec;
  printf("stcpy %ld, n%ld\n", stcpy.tv_sec,  stcpy.tv_nsec );
 if(strigger)
    soft_trigger(fd_adc);
 // for(i=0; i< 8; i++)  //flush Fifo
  //  rc = read(fd_adc, dmaBuff, DMA_ACQ_SIZE);  
  //  for(i=0; i< 8; i++)  
  // printf("%X ", dmaBuff[i * DMA_N_CHAN + ADC_CHAN]);
  //printf("\n");
               
  for(i=0; i< n_dmas; i++){
    rc = read(fd_adc, dmaBuff, DMA_ACQ_SIZE);
      memcpy(pAdcDataWrt, dmaBuff, DMA_ACQ_SIZE);
      pAdcDataWrt += DMA_ACQ_SIZE/sizeof(int32_t);
    }
  fflush(stdout);

  clock_gettime(CLOCK_MONOTONIC, &end);
  close_atca();

  nsamp= N_SAMP_P_DMA *n_dmas;
  //  nsamp *=  N_DMA_PER_FILE * ncycles; 

  printf("\n Last integral, %ld samples \n", nsamp );
  /*print last integral*/
  for(i=6; i< 12; i++) {
    dsp_coeff.i= dmaBuff[(N_SAMP_P_DMA - 1) * DMA_N_CHAN  + i];

    intOffD[i] = dsp_coeff.f;
    intOffD[i] *= pow(2,16);
    intOffD[i] /= nsamp;

    printf("DMA chan:%d %d %.5f\n", i, dmaBuff[(N_SAMP_P_DMA - 1) * DMA_N_CHAN +  i], intOffD[i]);
  }
  free(dmaBuff);

  save_mem_to_disk(n_dmas);

  fclose(fd_data); fclose(fd_chop); 
  fclose(fd_int);   fclose(fd_dsp); 
  free(pAdcData);
  printf("Saved file: %s\n", write_file_name);

  timeElapsed = timespecDiff(&end, &stcpy);
  printf("start Time s%ld, n%ld\n", start.tv_sec,  start.tv_nsec ); 
  //  printf("stcpy  s%ld, n%ld\n", stcpy.tv_sec,  stcpy.tv_nsec ); 

  printf("end Time s%ld, n%ld\n", end.tv_sec,  end.tv_nsec );

  printf("%d ndma, ACQ time: %lu ms\n", n_dmas, (long int) timeElapsed/1000000);

  //close(fd_adc);
  return retval;
}
