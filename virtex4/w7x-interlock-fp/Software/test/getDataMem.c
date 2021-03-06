/**
 *
 * @file getDataMem.c
 * @author Bernardo Carvalho
 * @date 2014-02-10
 * @brief program module to aquire data from ATCA IOC board (Version IPP)
 *
 *
 * Change History:
 *
 * Revision 1.0 2015-05-29
 * 	Initial adaptation from getDataRT.c
 *
 * SVN keywords
 * $Author: bernardo $
 * $Date: 2015-09-01 16:21:37 +0100 (Tue, 01 Sep 2015) $
 * $Revision: 7609 $
 * $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_INTLCK_FP/Software/test/getDataMem.c $
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

#include "test_common.h"

//#define DMA_SIZE DMA_MAX_BYTES // 4096 * 32    Linux page size
// 1 s = 2000000 samp = 31250 * 64 = 6250
//#define DMA_ACQ_SIZE (4096 * 100)

//#define RT_PROG

#define RESOURCE_NAME_DAQ "/dev/atca_ioc_ilck"
/* Chopping freq = SAMPL_FREQ / CHOP_MAX_CNT  */
#define CHOP_MAX_CNT 2000 //  1 kHz

#define ADC_CHAN 1 //  ADC chan to save
#define DAC_CHAN 10   
#define DSP_CHAN 13  
#define INT_CHAN (ADC_N_CHAN + ADC_CHAN) //  INT chan to save

int fd_adc = 0; /*global, to be used on sig_handler*/
FILE * fd_data, * fd_chop, * fd_int, * fd_dac;
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

void save_mem_to_disk(){
  int i,k; //, ival, chop;
  int32_t * padcDataWr;
 
  padcDataWr=pAdcData;
  
  for(i=0; i< N_DMA_PER_FILE; i++){
    for(k=0; k< N_SAMP_P_DMA; k++){
      fwrite(padcDataWr, sizeof(int32_t), ADC_N_CHAN, fd_data);
      fwrite(&padcDataWr[ADC_N_CHAN], sizeof(float), ADC_N_CHAN, fd_int);
      fwrite(&padcDataWr[CHAN_CHOP], sizeof(int32_t), 1, fd_chop);
      fwrite(&padcDataWr[DAC_CHAN], sizeof(int16_t), 1, fd_dac);
      padcDataWr +=  DMA_N_CHAN;// * sizeof(int32_t); // goto next packet
    }
  }
}

int main (int argc, char** argv){
  int retval = 0;
  char str[64], write_file_name[64];
  //  struct atca_iop_int_packet adcData[SAMP_PER_DMA];

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

  int * adc_offset_vec,  * int_offset_vec;
  //unsigned int tmp;
  uint8_t selectedCard = 14;
  unsigned int ncycles = 1;//1 N_CYCLES;
  //unsigned int channel = 0;
  //long atime64, lastime64=0, dtime64;
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
  if(argc > 1){
    ncycles = atoi(argv[1]);
  }
  else{
    printf("%s ncycles  ]\n", argv[0]);  
    //    printf("%s ncycles [ channum(0:1) chop_period(0-no chop) ]\n", argv[0]);  
    return -1;
  }

  //#define DMA_ACQ_SIZE (4096*1024) // 4194304B,  4Mb //(4096 * 100)
//#define N_SAMP_P_DMA (DMA_SIZE/NUM_CHAN_SMP/4)  // nr samples per buffer (IRQ)
//#define N_CHAN 16 // nr of signal transferred (32 bit)
//#define ADC_N_CHAN 8 // nr of adc raw channel transferred (32 bit)
//#define N_SAMP_P_DMA  (DMA_ACQ_SIZE/N_CHAN/4) 
//#define N_DMA_PER_FILE 305// 10 s 3125

  saveSize= DMA_ACQ_SIZE * N_DMA_PER_FILE; //8192 * 100000; // 10 s
  //  printf("Page size on your system = %i bytes, %li \n",  getpagesize(), 
  //	 saveSize);
  //printf("ncycles:%d, channel:%d\n", ncycles, ADC_CHAN);

  pAdcData = (int32_t *) malloc(saveSize);
  
  if(pAdcData==NULL){
    printf("Malloc NOK = %i bytes \n", (int) saveSize);
    return -1;
  }

#ifdef RT_PROG
  run_RT();
#endif /* RT_PROG */

  /* Open ATCA device */
  sprintf(str,"%s%d", RESOURCE_NAME_DAQ, selectedCard);
  fd_adc = open(str, O_RDWR );
  if (fd_adc < 0){
    printf("can open %s\n", str);
    return -1;
  }
  //sprintf(write_file_name,"%s-%d.bin", FILE_NAME_WRITE, 0);
  fd_data =  fopen("rawdata.bin","wb"); 
  //  fd_data =  fopen(write_file_name,"wb");            /*Test if can open files to write */ 
  fclose(fd_data); 

  adc_offset_vec = (int *) calloc(ADC_N_CHAN, sizeof (int));
  /*IPP Greifswald 15/06/2015 */
 
  adc_offset_vec[0] = -243;
  adc_offset_vec[1] = -103; 
  adc_offset_vec[2] = -77; 
  adc_offset_vec[3] = -186; 
  adc_offset_vec[4] = -463; 
  adc_offset_vec[5] = 108; 
  //  adc_offset_vec[6] = -604; 
  //adc_offset_vec[7] = -464; 

  int_offset_vec = (int *) calloc(ADC_N_CHAN, sizeof (int));
  int_offset_vec[0] = 13464; 
  int_offset_vec[1] = 14918; // Ok
  int_offset_vec[2] = 88169; // Ok
  int_offset_vec[3] = 0; // Ok
  int_offset_vec[4] = 0;//12103; // Ok
  int_offset_vec[5] = -1000000;//7245; // Ok
  // int_offset_vec[6] = 6004; // Ok

  /*
  int_offset_vec[0] = -10535; // -mean(wo)_lsb * 2^16  
  int_offset_vec[1] = -10000; 
  int_offset_vec[2] = -12000; 
  int_offset_vec[3] = -14000; 
*/

  stop_device(fd_adc);

  acq_init_device(fd_adc, ADC_N_CHAN, DMA_ACQ_SIZE, CHOP_MAX_CNT, 
		  adc_offset_vec, int_offset_vec);
  free(adc_offset_vec); free(int_offset_vec);
  
  //i=0x3f800000; // 1.0 float
  //    char  str[20];
  //dsp_coeff.f=7.0e-5;
  //  i=0x38d1b717; // 1.0e-4 float
  //int write_coeff_reg(int fd, int chan, int val);
  //  write_coeff_reg(fd_adc, 0, dsp_coeff.i);
  // i=0xbf000000; // -0.5 float
  //i=0;
  //  i=0x3f800000; // 1.0 float
  for(i=0; i< 6; i++) {
    dsp_coeff.f=0.0;
    write_coeff_reg(fd_adc, i, dsp_coeff.i);
  }
  dsp_coeff.f=7.0e-5; // To get DAC out with Vinput 100Hz 10V
  //dsp_coeff.f=1.0;
  write_coeff_reg(fd_adc, 5, dsp_coeff.i);

  dmaBuff = (int32_t *) malloc(DMA_ACQ_SIZE); // user space buffer for DMA data

  //  if(strigger)
  soft_trigger(fd_adc);
  for(i=0; i< 8; i++)  //flush Fifo
    rc = read(fd_adc, dmaBuff, DMA_ACQ_SIZE);  
  for(i=0; i< 8; i++)  
    printf("%X ", dmaBuff[i * DMA_N_CHAN + ADC_CHAN]);
  printf("\n");

  clock_gettime(CLOCK_MONOTONIC, &start);

  stcpy.tv_sec = start.tv_sec; stcpy.tv_nsec = start.tv_nsec;
  printf("stcpy %ld, n%ld\n", stcpy.tv_sec,  stcpy.tv_nsec );

  
  pAdcDataWrt = pAdcData;

  /* Open Write Files */ 
  //  sprintf(write_file_name,"%s-%d.bin", FILE_NAME_WRITE, 8);
  //  fd_data =  fopen(write_file_name,"wb"); 
  fd_data =  fopen("rawdata.bin","wb"); 
  fd_chop =  fopen("chop.bin","wb");                                        //  sprintf(write_file_name,"%s.bin", INT_NAME_WRITE);
  sprintf(write_file_name,"intFdata.bin");
  fd_int =  fopen(write_file_name,"wb"); 

  sprintf(write_file_name,"dac16Data.bin");
  fd_dac =  fopen(write_file_name,"wb"); 
               
  for(i=0; i< N_DMA_PER_FILE; i++){
    rc = read(fd_adc, dmaBuff, DMA_ACQ_SIZE);
      memcpy(pAdcDataWrt, dmaBuff, DMA_ACQ_SIZE);
      pAdcDataWrt += DMA_ACQ_SIZE/sizeof(int32_t);
    }
  fflush(stdout);

  clock_gettime(CLOCK_MONOTONIC, &end);
  close_atca();

  nsamp= N_SAMP_P_DMA;
  nsamp *=  N_DMA_PER_FILE * ncycles; 

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

  save_mem_to_disk();

  fclose(fd_data); fclose(fd_chop); 
  fclose(fd_int);   fclose(fd_dac); 
  free(pAdcData);
  printf("Saved file: %s\n", write_file_name);

  timeElapsed = timespecDiff(&end, &stcpy);
  printf("start  s%ld, n%ld\n", start.tv_sec,  start.tv_nsec ); 
  //  printf("stcpy  s%ld, n%ld\n", stcpy.tv_sec,  stcpy.tv_nsec ); 

  printf("end s%ld, n%ld\n", end.tv_sec,  end.tv_nsec );

  printf("%d ndma, ACQ time: %lu ms\n", N_DMA_PER_FILE, (long int) timeElapsed/1000000);

  //close(fd_adc);
  return retval;
}
