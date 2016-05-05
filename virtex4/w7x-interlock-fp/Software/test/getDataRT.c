/**
 *
 * @file getDataRT.c
 * @author Bernardo Carvalho
 * @date 2014-02-10
 * @brief program module to aquire data from ATCA IOC board (Version IPP)
 *
 *
 * Change History:
 *
 * Revision 1.0 2014-12-30
 * 	Initial adaptation form adcReadRT.c 
 *
 * SVN keywords
 * $Author: bernardo $
 * $Date: 2015-06-18 13:39:35 +0100 (Thu, 18 Jun 2015) $
 * $Revision: 7442 $
 * $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_INTLCK_FP/Software/test/getDataRT.c $
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

#ifdef RT_PROG
/* Real-Time */
#define CPU_RUN 3 
#include <features.h>
#define _GNU_SOURCE
#define __USE_GNU
#include <sched.h>

#endif /* RT_PROG */

#define RESOURCE_NAME_DAQ "/dev/atca_ioc_ilck"
/* Chopping freq = SAMPL_FREQ / CHOP_MAX_CNT  */
#define CHOP_MAX_CNT 2000 //  1 kHz

#define ADC_CHAN 0 //  ADC chan to save
#define DSP_CHAN 11 // 8  
#define INT_CHAN (ADC_N_CHAN + ADC_CHAN) //  INT chan to save

int fd_adc = 0; /*global, to be used on sig_handler*/
FILE * fd_data, * fd_int;
int32_t * dmaBuff; //user space buffer for data

int64_t timespecDiff(struct timespec *timeA_p, struct timespec *timeB_p){
  return ((timeA_p->tv_sec * 1000000000UL) + timeA_p->tv_nsec) -
    ((timeB_p->tv_sec * 1000000000UL) + timeB_p->tv_nsec);
}

#ifdef RT_PROG
void run_RT(void){
  /*** Real-Time */
  cpu_set_t mask;
  struct sched_param param;

  param.sched_priority = 90;
  printf("RT File Writer: using realtime, priority: %d\n",param.sched_priority);
  /* enable realtime fifo scheduling */
  if(sched_setscheduler(0, SCHED_FIFO, &param)==-1){
    perror("RT File Writer: sched_setscheduler failed");
    exit(-1);
  }
  CPU_ZERO(&mask);
  CPU_SET(CPU_RUN,&mask);
  printf("RT File Writer: cpu settings: 0:%x  1:%x 2:%x 3:%x \n",
	 CPU_ISSET(0,&mask), CPU_ISSET(1,&mask),
	 CPU_ISSET(2,&mask), CPU_ISSET(3,&mask));
  if(sched_setaffinity(0, sizeof(mask),  &mask)==-1){
    perror("RT File Writer: sched_setaffinity failed");
    exit(-1);
  }
}
#endif /* RT_PROG */

void close_atca(){
  stop_device(fd_adc);
  close(fd_adc);
  free( dmaBuff);
}

/*
  http://stackoverflow.com/questions/1641182/how-can-i-catch-a-ctrl-c-event-c
  SIGNAL HANDLER for Ctrl-C, mainly
*/
void sig_handler(int s){
  //int tmp;
  printf(", Caught signal %d. Closing ADC board\n",s);
  close_atca();
  exit(1); 
}

void save_to_disk(){
  int k; //, ival, chop;
  int intwrt =0;
  //int data_save[N_SAMP_P_DMA];

  //  struct data_save_str data_save[N_SAMP_P_DMA];
  int adcData[N_SAMP_P_DMA];
  int intData[N_SAMP_P_DMA];

  //  struct atca_data_str  * dma_data = ( struct atca_data_str *) dmaBuff;

  //  chop = matData[0 * NUM_CHAN_SMP + CHAN_CHOP] & CHOP_BIT_MASK;
  //printf("ch 0x%X ", chop);

  for (k=0; k < N_SAMP_P_DMA ; k++){
    //  ival = (dmaBuff[k * NUM_CHAN + ADC_CHAN_NUM]) << 1; // always inserts  '0' on lsb
    //chop = dmaBuff[k * NUM_CHAN ] & CHOP_BIT_MASK;
    //    data_save[k].data = (chop)? (ival | 0x1) : ival;

    //      (adcData[j].adc_data[CHAN_CHOP] & CHOP_BIT_MASK)? (ival | 0x1) : ival;
    // & CHOP_BIT_MASK
    //    data_save[k].data2 =adcData[k].adc_data[channel+1];
    // data_save[k].data2 =dmaBuff[k * NUM_CHAN_SMP + CHAN_NUM+1];
    adcData[k] = dmaBuff[k * DMA_N_CHAN  + ADC_CHAN];
    //    intData[k] = dmaBuff[k * N_CHAN  + DSP_CHAN];
    if ( (k % INT_DECIMATE) == 0){
      //      intData[intwrt++]= dmaBuff[k * N_CHAN  + 8];
      intData[intwrt++]= dmaBuff[k * DMA_N_CHAN  + 10]; // dac out 16 bit
      intData[intwrt++]= dmaBuff[k * DMA_N_CHAN  + 11];
      intData[intwrt++]= dmaBuff[k * DMA_N_CHAN  + 12];
      intData[intwrt++]= dmaBuff[k * DMA_N_CHAN  + 13];
    }  
      //    data_save[k].adcData = dmaBuff[k * N_CHAN + ADC_CHAN];
      //data_save[k].intData = dmaBuff[k * N_CHAN + INT_CHAN];
  }

  fwrite(adcData, sizeof(int), N_SAMP_P_DMA, fd_data);
  //  fwrite(intData, sizeof(int), N_SAMP_P_DMA, fd_int);
  fwrite(intData, sizeof(int), intwrt, fd_int);
  //  fwrite(data_save, sizeof(int), N_SAMP_P_DMA, str_data[1]);
}

int main (int argc, char** argv){
  int retval = 0;
  char str[64], write_file_name[64];
  //  struct atca_iop_int_packet adcData[SAMP_PER_DMA];

  /*  struct data_save_str {
    int16_t data;
    int16_t data2;
  } data_save[SAMP_PER_DMA];
  */
  int rc, i,  k;//, chop_prd=CHOP_MAX_CNT;
  //int16_t sval;
  struct timespec start, stcpy, end; //, dif;
  uint64_t timeElapsed ;

  size_t saveSize;
  int * pAdcData;

  long int nsamp;
  union Coeff
  {
    int i;
    float f;
  } dsp_coeff;  

  float intOffD[DMA_N_CHAN];

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

  saveSize= 8192 * 100000; // 10 s
  printf("Page size on your system = %i bytes, %li \n",  getpagesize(), 
	 saveSize);
  printf("ncycles:%d, channel:%d\n", ncycles, ADC_CHAN);

  pAdcData = (int *) malloc(saveSize);
  
  if(pAdcData!=NULL){
    printf("Malloc OK = %lu bytes \n",  saveSize);
    free(pAdcData);
  }
    
  //printf(" sizeof(struct data_save_str):%ld\n",  sizeof(struct data_save_str));

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
  sprintf(write_file_name,"%s-%d.bin", FILE_NAME_WRITE, 0);
  fd_data =  fopen(write_file_name,"wb");            /*Test if can open files to write */ 
  fclose(fd_data); 

  adc_offset_vec = (int *) calloc(ADC_N_CHAN, sizeof (int));
  /*Isttok 10 ch 12/06/2015*/
  adc_offset_vec[0] = -377;
  adc_offset_vec[1] = -351; 
  adc_offset_vec[2] = -785; 
  adc_offset_vec[3] = -378; 
  adc_offset_vec[4] = -233; 
  adc_offset_vec[5] = -663; 
  adc_offset_vec[6] = -292; 
  adc_offset_vec[7] = -149; 
  adc_offset_vec[8] = -694; 
  adc_offset_vec[9] = -614; 

  int_offset_vec = (int *) calloc(ADC_N_CHAN, sizeof (int));
  int_offset_vec[0] = 11707;// -4089982; // -mean(wo)_lsb * 2^16  
  int_offset_vec[1] =  8200; 
  int_offset_vec[2] = 12000; 
  int_offset_vec[3] = 14000; 


  stop_device(fd_adc);

  acq_init_device(fd_adc, ADC_N_CHAN, DMA_ACQ_SIZE, CHOP_MAX_CNT, 
		  adc_offset_vec, int_offset_vec);
  free(adc_offset_vec); free(int_offset_vec);
  
  //i=0x3f800000; // 1.0 float
  //    char  str[20];
  //  dsp_coeff.f=7.0e-5;
  dsp_coeff.f=0.0;
  for(i=0; i< ADC_N_CHAN; i++)  //Clear int coefs
    write_coeff_reg(fd_adc, i, dsp_coeff.i);
  dsp_coeff.f=1.0;
  //  i=0x38d1b717; // 1.0e-4 float
  //int write_coeff_reg(int fd, int chan, int val);
  write_coeff_reg(fd_adc, 1, dsp_coeff.i);
  // i=0xbf000000; // -0.5 float
  //  i=0x3f800000; // 1.0 float

  dmaBuff = (int32_t *) malloc(DMA_ACQ_SIZE); // user space buffer for data

  //  if(strigger)
  soft_trigger(fd_adc);
  for(i=0; i< 8; i++)  //flush Fifo
    rc = read(fd_adc, dmaBuff, DMA_ACQ_SIZE);  
  for(i=0; i< 8; i++)  
    printf("%X ", dmaBuff[i * DMA_N_CHAN + ADC_CHAN]);
  printf("\n");
  for(i=0; i< 10; i++)  
    printf("%X ", dmaBuff[i * DMA_N_CHAN + 1]);
  printf("\n");
  //  for(i=0; i< 10; i++)  
  //   printf("%X ", dmaBuff[i * DMA_N_CHAN + 15]);
  //printf("\n");

  clock_gettime(CLOCK_MONOTONIC, &start);

  stcpy.tv_sec = start.tv_sec; stcpy.tv_nsec = start.tv_nsec;
  printf("stcpy %ld, n%ld\n", stcpy.tv_sec,  stcpy.tv_nsec );

  sprintf(write_file_name,"%s.bin", INT_NAME_WRITE);
  fd_int =  fopen(write_file_name,"wb");                                                       for(k=0; k < ncycles; k++) {
    /* Open Write Files */ 
    sprintf(write_file_name,"%s-%d.bin", FILE_NAME_WRITE, k);
    fd_data =  fopen(write_file_name,"wb");                                                     
    for(i=0; i< N_DMA_PER_FILE; i++){
      rc = read(fd_adc, dmaBuff, DMA_ACQ_SIZE);
      save_to_disk();
    }
    fclose(fd_data); 
    printf("Saved file: %s\r", write_file_name);
    fflush(stdout); // Will now print everything in the stdout buffer
  }
  fclose(fd_int); 
  nsamp= N_SAMP_P_DMA;
  nsamp *=  N_DMA_PER_FILE * ncycles; 

  printf("\n Last integral, %ld samples \n", nsamp );
  /*print last integral*/
  for(i=11; i< 14; i++) {
    dsp_coeff.i= dmaBuff[(N_SAMP_P_DMA - 1) * DMA_N_CHAN  + i];

    intOffD[i] = dsp_coeff.f;
    intOffD[i] *= pow(2,16);
    intOffD[i] /= nsamp;

    printf("chan:%d %d %.4f\n", i, dmaBuff[(N_SAMP_P_DMA - 1) * DMA_N_CHAN +  i], intOffD[i]);
  }
  close_atca();
  clock_gettime(CLOCK_MONOTONIC, &end);
  
  timeElapsed = timespecDiff(&end, &stcpy);
  printf("\n");
  printf("start  s%ld, n%ld\n", start.tv_sec,  start.tv_nsec ); 
  //  printf("stcpy  s%ld, n%ld\n", stcpy.tv_sec,  stcpy.tv_nsec ); 

  printf("end s%ld, n%ld\n", end.tv_sec,  end.tv_nsec );

  printf("%d ndma, ACQ time: %ld ms\n", N_DMA_PER_FILE,  timeElapsed/1000000);

  //uv1 = uv1<<1; uv8=uv8>>1;
  //v1<<=1; v8>>=1;
  //printf("v1 0x%8X v8 0x%8X u1 0x%8X u8 0x%8X \n", v1, v8, uv1, uv8);
  //v1 0x       2 v8 0xC0000000 u1 0x       2 u8 0x40000000

  
  //  free( dmaBuff);
  //close(fd_adc);
  return retval;
}
