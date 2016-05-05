/***********************************
 *Project: ATCA-IO-CONTROL ADC_INTEGRATORS Software;
 *2 MSPS Integrators modules streaming 16 channel 32 bit ;
 * IPFN
 * Descripton. This program acquires raw signal from 32 channel and saves all data offline
 * SVN keywords :
  $Author: bernardo $
  $Id: testACQsav.c 6946 2014-12-30 17:31:23Z bernardo $
  $Date: 2014-12-30 17:31:23 +0000 (Tue, 30 Dec 2014) $
  SVN $Revision: 6946 $
  $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_INTLCK_FP/Software/test/testACQsav.c $
***********************************/
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/ioctl.h>
#include <fcntl.h>
//#include <linux/types.h>
#include <math.h>
//#include <signal.h>
#include <string.h>
//#include <sys/time.h>

#include "atca-ioc-int.h"
#include "atca-ioc-int-ioctl.h"

#define DMA_SIZE DMA_MAX_BYTES // 4096 * 32    Linux page size
#define NCHANNELS 32

//#define NUM_CHAN_SMP 16// nr of 32bit data channels per sample. 

#define SAMP_PER_PACKET (DMA_SIZE/NCHANNELS/sizeof(int16_t)) // 2048

#define NPACKETS 10

#define NSAMPLES (SAMP_PER_PACKET*NPACKETS)

#define FILE_WRITE "data16Sav.bin"

char DEVNAME[] = "/dev/atca_ioc_int5";


int init_device(int fd); // device initialization
void stop_device_l(int fd);

//Function init_device is used to start the aquisition by sending a few flag to the FPGA
//using the IOCTL function

int main(int argc, char **argv)
{

  int i, ii, rc, fd;
  char * devn;
  int flags = 0;
  FILE * fd_wrt;
  int16_t matData[DMA_SIZE / sizeof(int16_t) ]; // user space buffer for data
  double meanCh[NCHANNELS];

  //  int16_t saveData[SAMP_PER_PACKET*NPACKETS]; 
  int16_t saveData[NSAMPLES][NCHANNELS]; 
  //  unsigned int Npackets=1;
  //  unsigned int chanNumb=0;

  if(argc > 1)
    devn = argv[1];
  else
    devn = DEVNAME;

  /* if(argc > 1){ */
  /*   //    chanNumb = atoi(argv[1]); */
  /*   //  } */
  /*   //if(argc > 1){ */
  /*   //Npackets = atoi(argv[1]); */
  /* } */
  /* else{ */
  /*   printf("%s Chan_num dev_name\n", argv[0]); */
  /*   return -1; */
  /* } */

  // Opening the device

  flags |= O_RDONLY;
  printf("open device\n");
  extern int errno;
  fd=open(devn,flags);

  if (fd < 0)    { 
    fprintf (stderr,"Error: cannot open device %s \n", devn);
    fprintf (stderr," errno = %i\n",errno);
    printf ("open error : %s\n", strerror(errno));
    exit(1);
  }
  printf("device open: %s \n", devn);  

  fd_wrt=fopen(FILE_WRITE, "wb");  

  if (fd_wrt == NULL)    { 
    fprintf (stderr,"Error: cannot open file %s \n", FILE_WRITE);
    fprintf (stderr," errno = %i\n",errno);
    printf ("open error : %s\n", strerror(errno));
    close(fd);
    exit(1);
  }
  
  init_device(fd);

/*Flush data*/
  for (i=0; i < 50; i++) {
    rc = read(fd, matData, DMA_SIZE); // loop read.
  }
/*Acquire data and store on mem*/

  for (i=0; i < NPACKETS; i++) {
    rc = read(fd, matData, DMA_SIZE); // loop read.
    memcpy(saveData[SAMP_PER_PACKET*i], matData, DMA_SIZE);
  }

  stop_device_l(fd);

  for (ii=0; ii < NCHANNELS; ii++) 
    meanCh[ii]=0.0;

  for (i=0; i < NSAMPLES; i++) 
    for (ii=0; ii < NCHANNELS; ii++) 
      meanCh[ii] +=saveData[i][ii];

  for (i=0; i < NPACKETS; i++) {
    fwrite(saveData[i*SAMP_PER_PACKET],
	   sizeof(int16_t), DMA_SIZE/sizeof(int16_t), fd_wrt);
  }

  printf("Means: Ch   Avg\n"); 
  for (ii=0; ii < NCHANNELS; ii++) 
    printf("    ch:%d, %lf\n", ii,    meanCh[ii]/(NSAMPLES/4) ); 
  
  //  printf("\n"); 
 

  /**
  for (i=0; i < NPACKETS; i++) {
    fwrite(&saveData[i*SAMP_PER_PACKET], sizeof(int16_t), SAMP_PER_PACKET, fd_wrt);
  }
  */
  fclose(fd_wrt);
  printf("Saved %d packets, %ld samples\n", NPACKETS, NSAMPLES ); 
  return 0;
}

void stop_device_l(int fd){

  int tmp, rc, max_buf_count;

  // this IOCTL returns the nr of times the driver IRQ handler was called while there was still 1 or more buffers waiting to be read
  max_buf_count = ioctl(fd, PCIE_ATCA_IOCT_ACQ_DISABLE);// Stop streaming and un-arm the FPGA.
  
  rc = ioctl(fd, PCIE_ATCA_IOCT_STREAM_DISABLE);
  usleep(100);

  rc = ioctl(fd, PCIE_ATCA_IOCG_STATUS, &tmp);
  printf("ACQ Stopped, FPGA  Status: 0x%.8X, max buff_count: %d \n", tmp, max_buf_count);
  close(fd);

}

//int init_device(int argc, char **argv)
int init_device(int fd)
{
  int  tmp, rc, i;
  //OFFSET_REGS off_s;
  
  usleep(100);
  rc = ioctl(fd, PCIE_ATCA_IOCG_STATUS, &tmp);// Get FPGA STATUS to check if properly initialized (optional)
  printf("FPGA Status: 0x%.8X\n", tmp);

  rc = ioctl(fd, PCIE_ATCA_IOCG_COUNTER, &tmp);
  printf("FPGA Counter: 0x%.8X, %d", tmp, tmp);
  usleep(100000);
  // sleep(1);
  rc = ioctl(fd, PCIE_ATCA_IOCG_COUNTER, &tmp);
  printf(" +1s Counter: %d\n", tmp);
  //  rc = ioctl(fd, PCIE_ATCA_IOCT_CHOP_ON); //Set the Chop on
  rc = ioctl(fd, PCIE_ATCA_IOCT_CHOP_OFF); //Set the Chop off
  rc = ioctl(fd, PCIE_ATCA_IOCT_CHOP_DEFAULT_0); // TODO: Change ioctl name
  rc = ioctl(fd, PCIE_ATCA_IOCT_CHOP_RECONSTRUCT_OFF); //The signal is not to be reconstruted inside the FPGA but outside of the FPGA
  rc = ioctl(fd, PCIE_ATCA_IOCT_INTEGRAL_CALC_OFF); 

  tmp = DMA_SIZE;
  rc  =  ioctl(fd, PCIE_ATCA_IOCS_DMA_SIZE, &tmp);

  tmp = 0x40000; // Half Buff
  rc  =  ioctl(fd, PCIE_ATCA_IOCS_DMA_THRES, &tmp);
  tmp = 0;
  rc = ioctl(fd, PCIE_ATCA_IOCG_DMA_THRES, &tmp);
  printf("FPGA DMA_THRES: 0x%.8X, %d\n", tmp, tmp);

  //Set the Chop's period, in this case is 2000 times the period of the acquisition period.
  //(2000) The Chop's frequency will be 1kHz

  tmp = 2000;
  rc  =  ioctl(fd, PCIE_ATCA_IOCS_CHOP_MAX_COUNT, &tmp);
  tmp = 1000;
  rc = ioctl(fd, PCIE_ATCA_IOCS_CHOP_CHANGE_COUNT, &tmp);

  /* Reset ADC offsets*/ 
  for (i=0; i < NCHANNELS; i++) {
    tmp = i;
    rc  =  ioctl(fd, PCIE_ATCA_IOCS_REG_OFF, &tmp);
    tmp = 0;
    rc = ioctl(fd, PCIE_ATCA_IOCS_REG_DATA, &tmp);
  }

  //  memset(&off_s, 0, sizeof(off_s));
  //rc = ioctl(fd, PCIE_ATCA_IOCS_ATCA_OFF, &off_s);

  rc = ioctl(fd, PCIE_ATCA_IOCT_ACQ_ENABLE);  // Arm the FPGA to wait for external trigger
  usleep(10);
  rc = ioctl(fd, PCIE_ATCA_IOCG_STATUS, &tmp);
  printf("FPGA ACQ Status: 0x%.8X\n", tmp);
  tmp = 0;

  rc = ioctl(fd, PCIE_ATCA_IOCT_STREAM_ENABLE);
  rc = ioctl(fd, PCIE_ATCA_IOCG_STATUS, &tmp);
  printf("FPGA STRE Status: 0x%.8X\n", tmp);
  rc = ioctl(fd, PCIE_ATCA_IOCT_SOFT_TRIG);
  usleep(10);
  tmp = 0;
  rc = ioctl(fd, PCIE_ATCA_IOCG_STATUS, &tmp);
  printf("FPGA TRG Status: 0x%.8X\n", tmp);

  return rc;
}

