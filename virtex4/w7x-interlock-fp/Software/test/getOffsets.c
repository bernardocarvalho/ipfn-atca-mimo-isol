/**
 *
 * @file getOffsets.c
 * @author Bernardo Carvalho
 * @date 2014-02-10
 * @brief program module to calc offset  data from ATCA IOC board (Version IPP)
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
 * $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_INTLCK_FP/Software/test/getOffsets.c $
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


#define RESOURCE_NAME_DAQ "/dev/atca_ioc_ilck"

/* Chopping freq = SAMPL_FREQ / CHOP_MAX_CNT  */
#define CHOP_MAX_CNT 2000 //  1 kHz

int fd_adc = 0; /*global, to be used on sig_handler*/
//FILE * fd_data;

int64_t timespecDiff(struct timespec *timeA_p, struct timespec *timeB_p){
  return ((timeA_p->tv_sec * 1000000000UL) + timeA_p->tv_nsec) -
    ((timeB_p->tv_sec * 1000000000UL) + timeB_p->tv_nsec);
}


int main (int argc, char** argv){
  int retval = 0;
  char str[64];//, write_file_name[64];
  int32_t * dmaBuff; //user space buffer for data
  
  int rc, data, i, j,  k, m;

  long int nsamp =0;

  struct timespec start, stcpy, end; //, dif;
  uint64_t timeElapsed ;

  int * adc_offset_vec,  * int_offset_vec;
  //unsigned int tmp;
  uint8_t selectedCard = 14;
  unsigned int ncycles = 1;//1 N_CYCLES;

  long int * adcCalcOff ;
  long int * intCalcOff ;
  double offS;

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
    return -1;
  }
  //  printf("ncycles:%d, channel:%d\n", ncycles, ADC_CHAN);
  //printf(" sizeof(struct data_save_str):%ld\n",  sizeof(struct data_save_str));

  /* Open ATCA device */
  sprintf(str,"%s%d", RESOURCE_NAME_DAQ, selectedCard);
  fd_adc = open(str, O_RDWR );
  if (fd_adc < 0){
    printf("can open %s\n", str);
    return -1;
  }
 
  adc_offset_vec = (int *) calloc(ADC_N_CHAN, sizeof (int));
  int_offset_vec = (int *) calloc(ADC_N_CHAN, sizeof (int));

  adcCalcOff = (long int *) calloc(ADC_N_CHAN, sizeof (uint64_t));
  intCalcOff = (long int *) calloc(ADC_N_CHAN, sizeof (uint64_t));

  stop_device(fd_adc);

  acq_init_device(fd_adc, ADC_N_CHAN, DMA_ACQ_SIZE, CHOP_MAX_CNT, 
		  adc_offset_vec, int_offset_vec);
  free(adc_offset_vec); free(int_offset_vec);

  dmaBuff = (int32_t *) malloc(DMA_ACQ_SIZE); // user space buffer for data

  soft_trigger(fd_adc);

  for(i=0; i< 8; i++)  //flush Fifo
    rc = read(fd_adc, dmaBuff, DMA_ACQ_SIZE);  
  clock_gettime(CLOCK_MONOTONIC, &start);

  stcpy.tv_sec = start.tv_sec; stcpy.tv_nsec = start.tv_nsec;
  printf("stcpy %ld, n%ld\n", stcpy.tv_sec,  stcpy.tv_nsec );

  for(k=0; k < ncycles; k++) {
    rc = read(fd_adc, dmaBuff, DMA_ACQ_SIZE);
    for (m=0; m < ADC_N_CHAN; m++){
      for (j=0; j < N_SAMP_P_DMA; j++){
	data = dmaBuff[j * DMA_N_CHAN + m];
	//	data = data >> 1;
	adcCalcOff[m] +=data;
      }
      
      intCalcOff[m] = dmaBuff[(N_SAMP_P_DMA - 1) * DMA_N_CHAN + ADC_N_CHAN + m];

      //	}
    }
    nsamp += N_SAMP_P_DMA;
  }

  stop_device(fd_adc);
  close(fd_adc);
  //  close_atca();
  clock_gettime(CLOCK_MONOTONIC, &end);
  
  timeElapsed = timespecDiff(&end, &stcpy);
  printf("\n");
  printf("start  s%ld, n%ld\n", start.tv_sec,  start.tv_nsec ); 
  //  printf("stcpy  s%ld, n%ld\n", stcpy.tv_sec,  stcpy.tv_nsec ); 

  printf("end s%ld, n%ld\n", end.tv_sec,  end.tv_nsec );

  printf("%ld samples, ACQ time: %ld ms\n", nsamp,  timeElapsed/1000000);

  for (m=0; m < ADC_N_CHAN; m++){
    offS = 1.0 * ((double)adcCalcOff[m]);
    
    //intCalcOff[m] = dmaBuff[(SAMP_PER_DMA-1) * N_CHAN + ADC_N_CHAN + m];
    printf("chan %d: %ld, %ld, %f, %f \n", m, adcCalcOff[m],adcCalcOff[m]/nsamp, offS,  offS / nsamp);
  }

  //close(fd_adc);
  return retval;
}
