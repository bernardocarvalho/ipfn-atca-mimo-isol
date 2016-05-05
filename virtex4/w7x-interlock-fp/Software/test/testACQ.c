/***********************************
 *Project: ATCA-IO-CONTROL ADC_INTEGRATORS Software;
 *2 MSPS Integrators modules streaming 16 channel 32 bit ;
 * IPFN
 * SVN keywords :
  $Author: bernardo $
  $Id: testACQ.c 7267 2015-03-26 17:07:05Z bernardo $
  $Date: 2015-03-26 17:07:05 +0000 (Thu, 26 Mar 2015) $
  SVN $Revision: 7267 $
  $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_INTLCK_FP/Software/test/testACQ.c $
***********************************/
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include <errno.h>
//#include <sys/types.h>
//#include <sys/stat.h>
//#include <sys/ioctl.h>
#include <fcntl.h>
//#include <linux/types.h>
#include <math.h>
//#include <signal.h>
#include <string.h>

//#include "atca-ioc-int.h"

//#include "atca-ioc-int-lib.h"
#include "test_common.h"

//#define DMA_SIZE DMA_MAX_BYTES // 4096 * 32    Linux page size
//#define NCHANNELS 32

//#define NUM_CHAN_SMP 16// nr of 32bit data channels per sample. 

//#define DMA_ACQ_SIZE (DMA_MAX_BYTES/4) // 4096 * 32    Linux page size

#define SAMP_PER_PACKET (DMA_ACQ_SIZE/32/2) // 2048
#define CHOP_MAX_CNT 2000 //  1 kHz

//#define NPACKETS 5000
//#define CHN_NUM 0 
//#define FILE_WRITE "/mnt/SSDisk/tmp/DAQSTREAM/data.bin"
#define FILE_WRITE "data.bin"

//#define FILE_WRITE "./data.bin"

char DEVNAME[] = "/dev/atca_ioc_int13";

//Function init_device is used to start the aquisition by sending a few flag to the FPGA
//using the IOCTL function

int main(int argc, char **argv)
{

  int i, ii, rc, fd;
  char * devn;
  int flags = 0;
  FILE * fd_wrt;
  int16_t * dataBuff; //[DMA_ACQ_SIZE / sizeof(int16_t) ]; // user space buffer for data

  //  int16_t saveData[SAMP_PER_PACKET*NPACKETS]; 
  int16_t saveData[SAMP_PER_PACKET]; 
  unsigned int Npackets=1;
  unsigned int chanNumb=0;
  int strigger=0;
  int * adc_offset_vec,  * int_offset_vec;

  if(argc > 3)
    devn = argv[3];
  else
    devn = DEVNAME;

  if(argc > 2){
    strigger = atoi(argv[2]);
  }
  if(argc > 1){
    Npackets = atoi(argv[1]);
  }
  else{
    printf("%s Npackets [Strigger dev_name]\n", argv[0]);
    return -1;
  }

  // Opening the device

  flags |= O_RDONLY;
  printf("opening device\t");
  extern int errno;
  fd=open(devn,flags);

  if (fd < 0)    { 
    fprintf (stderr,"Error: cannot open device %s \n", devn);
    fprintf (stderr," errno = %i\n",errno);
    printf ("open error : %s\n", strerror(errno));
    exit(1);
  }
  printf("device opened: \n");  // /Opening the device

  fd_wrt=fopen(FILE_WRITE, "wb");  
  if (fd_wrt == NULL)    { 
    fprintf (stderr,"Error: cannot open file %s \n", FILE_WRITE);
    fprintf (stderr," errno = %i\n",errno);
    printf ("open error : %s\n", strerror(errno));
    close(fd);
    exit(1);
  }
  
  adc_offset_vec = (int *) calloc(ADC_N_CHAN, sizeof (int));
  adc_offset_vec[0] = -380; //-6;
  adc_offset_vec[1] = -346; 
  adc_offset_vec[2] = -782; 
  adc_offset_vec[2] = -379; 

  int_offset_vec = (int *) calloc(ADC_N_CHAN, sizeof (int));
  int_offset_vec[0] = -10535; // -mean(wo)_lsb * 2^16  
  int_offset_vec[1] = -10000; 
  int_offset_vec[2] = -12000; 
  int_offset_vec[3] = -14000; 

  stop_device(fd);

  acq_init_device(fd, ADC_N_CHAN, DMA_ACQ_SIZE, CHOP_MAX_CNT, 
		  adc_offset_vec, int_offset_vec);
  free(adc_offset_vec); free(int_offset_vec);

  dataBuff = (int16_t *) malloc(DMA_ACQ_SIZE); // user space buffer for data
  if(strigger)
    soft_trigger(fd);
  /*Flush data */
  for (i=0; i < 2; i++) {
    rc = read(fd, dataBuff, DMA_ACQ_SIZE); // loop read.
  }

  //  soft_trigger(fd);
  //#if 0
  for (i=0; i < Npackets; i++) {
    rc = read(fd, dataBuff, DMA_ACQ_SIZE); // loop read.
    for (ii=0; ii < SAMP_PER_PACKET; ii++) {
      saveData[ii]=  dataBuff[ii * N_CHAN + chanNumb];
      //      saveData[i*SAMP_PER_PACKET + ii]=  dataBuff[ii*NCHANNELS + CHN_NUM];
    }
    fwrite(saveData, sizeof(int16_t), SAMP_PER_PACKET, fd_wrt);
  }
  //#endif
  stop_device(fd);
  close(fd);

  free( dataBuff);

  /**
  for (i=0; i < NPACKETS; i++) {
    fwrite(&saveData[i*SAMP_PER_PACKET], sizeof(int16_t), SAMP_PER_PACKET, fd_wrt);
  }
  */
  fclose(fd_wrt);
  printf("Acquired %d packets, %d samples, chanNumb: %d\n", Npackets, SAMP_PER_PACKET * Npackets, chanNumb ); 
  return 0;
}
