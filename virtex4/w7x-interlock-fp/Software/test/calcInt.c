/**
 *
 * @file getOffsets.c
 * @author Bernardo Carvalho
 * @date 2015-06-30
 * @brief program module to calc Integral   data from ATCA IOC board (Version IPP) saved Data
  *
 *
 * Change History:
 *
 * Revision 1.0 2015-06-30
 * 	Initial adaptation form adcReadRT.c 
 *
 * SVN keywords
 * $Author: bernardo $
 * $Date: 2015-09-01 16:21:37 +0100 (Tue, 01 Sep 2015) $
 * $Revision: 7609 $
 * $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_INTLCK_FP/Software/test/calcInt.c $
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



int64_t timespecDiff(struct timespec *timeA_p, struct timespec *timeB_p){
  return ((timeA_p->tv_sec * 1000000000UL) + timeA_p->tv_nsec) -
    ((timeB_p->tv_sec * 1000000000UL) + timeB_p->tv_nsec);
}

int main (int argc, char** argv){
  //int retval = 0;
  //char str[64];//, write_file_name[64];

  //int32_t * dmaBuff; //user space buffer for data
  FILE * fd_data, * fd_chop, * fd_int;  
  int  data,  k, m;

  //long int nsamp =0;

  //  struct timespec start, stcpy, end; //, dif;
  //uint64_t timeElapsed ;

  int adcData[ADC_N_CHAN];
  int chop_val;

  int eo_offset[ADC_N_CHAN];
  float  wo_offset[ADC_N_CHAN];
  //unsigned int tmp;
  //uint8_t selectedCard = 3;
  unsigned long int skipNSamples = 0;
  unsigned long int readNSamples = 1;

  float  adcCalcOff[ADC_N_CHAN] ;
  //  long int * intCalcOff ;
  double offSets[ADC_N_CHAN];

  /*
  if(argc > 3){
    chop_prd = atoi(argv[3]); // CHOP_MAX_CNT
  }
  */
  if(argc > 2){
    readNSamples = atoi(argv[2]);
  }

  if(argc > 1){
    skipNSamples = atoi(argv[1]);
  }
  else{
    printf("%s skipNSamples  readNSamples]\n", argv[0]);  
    return -1;
  }
 
  //  eo_offset= (int *) calloc(ADC_N_CHAN, sizeof (int));

  fd_data =  fopen("isttok.bin","rb");  
  if(fd_data==NULL){
    printf("Error  %d, OPEN %s\n", errno, "isttokx.bin");
    exit(1);
  }
  fd_chop =  fopen("chop.bin","rb");  
  if(fd_chop==NULL){
    printf("Error  %d, OPEN %s\n", errno, "chopx.bin");
    fclose(fd_data);
    exit(1);
  }
  fd_int =  fopen("isttokInt.bin","wb");  

  fseek(fd_data, skipNSamples * sizeof(int) * ADC_N_CHAN, SEEK_SET);
  fseek(fd_chop, skipNSamples * sizeof(int), SEEK_SET);

  eo_offset[0] = -374;
  eo_offset[1] = -352; 
  eo_offset[2] = -781; 
  eo_offset[3] = -372; 
  eo_offset[4] = -227; 
  eo_offset[5] = -665; 
  eo_offset[6] = -293; 
  eo_offset[7] = -143; 
  eo_offset[8] = -703; 
  eo_offset[9] = -612; 

  /* S-C values
  wo_offset[0] = -0.171985;
  wo_offset[1] = -0.130360;
  wo_offset[2] = -0.135463; 
  wo_offset[3] = -0.104414; 
  wo_offset[4] = -0.162706; 
  wo_offset[5] = -0.114945; 
  wo_offset[6] = -0.175632; 
  wo_offset[7] = -0.119223; 
  wo_offset[8] = -1.131900; 
  wo_offset[9] = -0.155179; 
 
  */
  for (m=0; m < ADC_N_CHAN; m++)
    wo_offset[m] = 0.0;


  /*Shot 2 post-shot 6s
  wo_offset[0] = -0.266481;
  wo_offset[1] = -0.130360;
  wo_offset[2] = -0.167837; 
  wo_offset[3] = -0.384042; 
  wo_offset[4] = -0.156705; 
  wo_offset[5] = -0.115360; 
  wo_offset[6] = -0.186135; 
  wo_offset[7] = -0.182126; 
  wo_offset[8] = -7.410659; 
  wo_offset[9] = -0.165778; 
*/

    /*Shot 4 post-shot 6.5s */
  wo_offset[0] = -0.205584;
  wo_offset[1] = -0.162388;
  wo_offset[2] = -0.171632; 
  wo_offset[3] = -0.148878; 
  wo_offset[4] = -0.164047; 
  wo_offset[5] = -0.104119; 
  wo_offset[6] = -0.234168; 
  wo_offset[7] = -0.127380; 
  wo_offset[8] = -1.186912; 
  wo_offset[9] = -0.157841; 


  for (m=0; m < ADC_N_CHAN; m++)
    adcCalcOff[m]=0;
  //  int_offset_vec = (int *) calloc(ADC_N_CHAN, sizeof (int));

  //  adcCalcOff = (long int *) calloc(ADC_N_CHAN, sizeof (uint64_t));
  //intCalcOff = (long int *) calloc(ADC_N_CHAN, sizeof (uint64_t));

  //clock_gettime(CLOCK_MONOTONIC, &start);

  //stcpy.tv_sec = start.tv_sec; stcpy.tv_nsec = start.tv_nsec;
  //printf("stcpy %ld, n%ld\n", stcpy.tv_sec,  stcpy.tv_nsec );

  for(k=0; k < readNSamples; k++) {
    fread(adcData, sizeof(int), ADC_N_CHAN, fd_data);
    fread(&chop_val, sizeof(int), 1, fd_chop);
    for (m=0; m < ADC_N_CHAN; m++){
      data = adcData[m] - eo_offset[m]; // Correct EO offset;
      if((chop_val & 0x1))
	adcCalcOff[m] += (float)data;
      else
	adcCalcOff[m] -=(float)data;
      adcCalcOff[m] -= wo_offset[m];
    }
    fwrite(adcCalcOff, sizeof(float), ADC_N_CHAN, fd_int);
  }

  //    nsamp += N_SAMP_P_DMA;
  //}

  //  free(eo_offset); free(int_offset_vec);

  //  close_atca();
  //clock_gettime(CLOCK_MONOTONIC, &end);
  
  //timeElapsed = timespecDiff(&end, &stcpy);
  printf("\n");
  fclose(fd_data);   fclose(fd_chop);   fclose(fd_int); 

  //printf("start  s%ld, n%ld\n", start.tv_sec,  start.tv_nsec ); 
  //  printf("stcpy  s%ld, n%ld\n", stcpy.tv_sec,  stcpy.tv_nsec ); 

  //printf("end s%ld, n%ld\n", end.tv_sec,  end.tv_nsec );

  //printf("%ld samples, ACQ time: %ld ms\n", nsamp,  timeElapsed/1000000);

  for (m=0; m < ADC_N_CHAN; m++){
    offSets[m] = 1.0 * ((double)adcCalcOff[m]);
    //intCalcOff[m] = dmaBuff[(SAMP_PER_DMA-1) * N_CHAN + ADC_N_CHAN + m];
    printf("chan %d: %f, %f, %lf, %lf \n", m, adcCalcOff[m], adcCalcOff[m]/readNSamples, offSets[m],  offSets[m] / readNSamples);
  }

  //close(fd_adc);
  return 0;
}
