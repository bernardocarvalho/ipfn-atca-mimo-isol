/**
 * ATCA IO CONTROL Integrator
 * Project Name:   W7-X ATCA DAQ
 * 
 *  Company: IPFN-IST
 * Engineer: B. Carvalho
 *  
 * Create Date:    2014-03-07 11:57:29 +0000 (Fri, 07 Mar 2014)
 *  Design Name: 
 * Program Name: de_pack.c
 *
 * SVN keywords
 * $Date: 2015-05-04 16:39:15 +0100 (Mon, 04 May 2015) $
 * $Revision: 7326 $
 * $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_INTLCK_FP/Software/test/de_pack.c $
 *
 * Copyright 2014 - 2015 IPFN-Instituto Superior Tecnico, Portugal
 * Creation Date  2014-02-10
 * 
 * Licensed under the EUPL, Version 1.1 or - as soon they
 * will be approved by the European Commission - subsequent
 * versions of the EUPL (the "Licence");
 * You may not use this work except in compliance with the
 * Licence.
 * You may obtain a copy of the Licence at:
 *
 * http://ec.europa.eu/idabc/eupl
 *
 * Unless required by applicable law or agreed to in
 * writing, software distributed under the Licence is
 * distributed on an "AS IS" basis,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied.
 * See the Licence for the specific language governing
 * permissions and limitations under the Licence.
 *
 */

#include <stdio.h>
#include <sys/stat.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

#include "test_common.h"

#define WRITE_FILE_NAME   "./channel_rec.bin"  
#define WRITE_FILE_CHOP_NAME   "./channel_chp.bin"  
//#define WRITE_FILE_INT_NAME   "./channel_int.bin"  

//#define N_SAMP_P_DMA  65536 // must be same as in device driver

//#define DMA_PER_SEC (SAMPL_FREQ/N_SAMP_P_DMA)  //~10
//#define ACQ_SECS 10 // per file 

//#define N_DMAS  (DMA_PER_SEC * ACQ_SECS)
#define SAMP_HOLD 3 // Hold samples in recontruct

FILE * fd_in, * fd_out, *fd_chp;

/*Struct definition for raw data coding*/ 
struct data_save_str raw_data[N_SAMP_P_DMA];

int  chan_rec[N_SAMP_P_DMA];
int  chan_chp[N_SAMP_P_DMA];
//int  chan_int[N_SAMP_P_DMA];


long int reconstruct(int eo, int chop_on){
  int i, j;
  int data, rdata;
  int chp =0;
  int last_rdata =0;
  int last_chp  =CHOP_POS_VALUE;
  int chp_count =0;
  long int partInt=0;

  for (i=0; i< N_DMA_PER_FILE; i++ ){
    fread(raw_data,  sizeof(struct data_save_str),  N_SAMP_P_DMA, fd_in);
    //fread(chop_data, SIZE_CHOP,    samprd, fd_chop);
    //    for (j=0; j < 5; j++ )
    // printf("%X ",  raw_data[j].channel);

    for (j=0; j < N_SAMP_P_DMA; j++ ){

      /*Reconstructed signal*/
      data = raw_data[j].adcData;
      //#ifdef DATA_PACKING
      chp  = data &  CHOP_BIT_MASK; 
      data = data >> 1 ; // always keep sign on 'int'
      data -=  eo;
      /*Detect Chop transition*/ 
      if(chp != last_chp)
	chp_count = - SAMP_HOLD;
      else
	chp_count++;
      
      last_chp = chp;
      
      if(chp_count < 0)
	rdata = last_rdata;
      else {
	rdata = (chp == CHOP_POS_VALUE)? data : -data;
	last_rdata = rdata;
      }
      
      chan_chp[j] = chp; 
      //    chan_int[j] =raw_data[j].intData;
      
      if(chop_on)
	chan_rec[j] = rdata; 
      else
	chan_rec[j] =  data ;

      partInt += chan_rec[j];

    } 

    fwrite(chan_rec, sizeof(int), N_SAMP_P_DMA, fd_out);
    fwrite(chan_chp, sizeof(int), N_SAMP_P_DMA, fd_chp);
    //  fwrite(chan_int, sizeof(int), N_SAMP_P_DMA, fd_int);
  }
  
  return partInt;
}

int main(int argc, char **argv){

  int i;
  char folder_name[128], file_name[128];
  //  long int lastsum;
 //  double wo;
  unsigned int start_cycle=0; 
  struct stat st;
  int  eo = 0; 
  int  chop_on = 0; 
  long int dataInt = ;

  if(argc > 4){
    chop_on = atoi(argv[4]);
  }
  if(argc > 3){
    eo = atoi(argv[3]);
  }
  if(argc > 2){
    strcpy(folder_name, argv[2]);
  }
  else{
    sprintf(folder_name,"%s", READ_FOLDER);
  }
  if(argc > 1){
    start_cycle = atoi(argv[1]);
  }
  else{
    printf("%s start_cycle read_folder [ eo chop_on]\n", argv[0]);  
    return -1;
  }

  printf("cycle:%d, chop_on:%d, EO =%d\n", start_cycle, chop_on, eo) ;

  fd_out =  fopen(WRITE_FILE_NAME,"wb");
  if(!fd_out) {
      printf("File %s not opened, Exiting\n", WRITE_FILE_NAME);
      return -1;
    }
  fd_chp =  fopen(WRITE_FILE_CHOP_NAME,"wb");
  if(!fd_chp) {
      printf("File %s not opened, Exiting\n", WRITE_FILE_CHOP_NAME);
      return -1;
    }

  //fd_int =  fopen(WRITE_FILE_INT_NAME,"wb");
 
  i = start_cycle;
  //  for(i=0; i < cycles; i++){
    /*Open read Files*/
    sprintf(file_name,"%s/%s-%d.bin", folder_name, READ_FILE_NAME, i); 
    fd_in =  fopen(file_name,"rb");
    if(!fd_in) {
      printf("File %s not opened, Exiting\n", file_name);
      return -1;
    }

    stat(file_name, &st);
    printf("Size =%ld %s-%d.bin ", st.st_size,  READ_FILE_NAME, i ) ;

    dataInt +=  reconstruct(eo, chop_on);

    /*Close read Files*/
    fclose(fd_in);
    //}

  /* Close Write file */
  fclose(fd_out);
  fclose(fd_chp);
  //fclose(fd_int);

  printf("EXIT:  EO =%d, Integral: %ld\n", eo, dataInt) ;

  return 0;
}

