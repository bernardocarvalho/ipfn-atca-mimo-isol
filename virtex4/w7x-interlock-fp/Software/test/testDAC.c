/***********************************
 *Project: ATCA-IO-CONTROL ADC_INTEGRATORS Software;
 *2 MSPS Integrators modules streaming 16 channel 32 bit ;
 * IPFN
 * SVN keywords :
  $Author: bernardo $
  $Id: testDAC.c 7442 2015-06-18 12:39:35Z bernardo $
  $Date: 2015-06-18 13:39:35 +0100 (Thu, 18 Jun 2015) $
  SVN $Revision: 7442 $
  $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_INTLCK_FP/Software/test/testDAC.c $
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
#include "atca-ioc-int-lib.h"
//#define NPACKETS 5000
#define CHN_NUM 0 


char DEVNAME[] = "/dev/atca_ioc_ilck14";

int init_device(int fd); // device initialization
//void stop_device(int fd);


//Function init_device is used to start the aquisition by sending a few flag to the FPGA
//using the IOCTL function


int main(int argc, char **argv)
{

  int i, rc, fd, data;
  char * devn;
  int Nsamples=100;
  int flags = 0;

  if(argc > 2)
    devn = argv[2];
  else
    devn = DEVNAME;

  if(argc > 1){
    Nsamples = atoi(argv[1]);
  }
  else{
  printf("%s Nsamples [devname]\n", argv[0]);
   return -1;
  }

  // Opening the device

  flags |= O_RDONLY;
  printf("%s open device\n", argv[0]);
  extern int errno;
  fd=open(devn,flags);

  if (fd < 0)    { 
    fprintf (stderr,"Error: cannot open device %s \n", devn);
    fprintf (stderr," errno = %i\n",errno);
    //printf ("open error : %s\n", strerror(errno));
    exit(1);
  }
  printf("device opened, Nsamples %d \n", Nsamples);  // /Opening the device
  
  init_device(fd);
  
  data = -8000;
  rc = ioctl(fd, PCIE_ATCA_IOCS_DAC_5_DATA, &data);
  data += 4000;
  rc = ioctl(fd, PCIE_ATCA_IOCS_DAC_6_DATA, &data);
  data += 4000;
  rc = ioctl(fd, PCIE_ATCA_IOCS_DAC_7_DATA, &data);
  data += 4000;
  rc = ioctl(fd, PCIE_ATCA_IOCS_DAC_8_DATA, &data);


  for (i=0; i < Nsamples; i++) {

    data += 1000;
    rc = ioctl(fd, PCIE_ATCA_IOCS_DAC_1_DATA, &data);
    rc = ioctl(fd, PCIE_ATCA_IOCS_DAC_2_DATA, &data);
    rc = ioctl(fd, PCIE_ATCA_IOCS_DAC_3_DATA, &data);
    rc = ioctl(fd, PCIE_ATCA_IOCS_DAC_4_DATA, &data);
    if(rc)
      printf ("write dac error : %d\n", rc);
    usleep(10000); // wait 10 milsec
    
  } 
  rc = ioctl(fd, PCIE_ATCA_IOCG_STATUS, &data);
  printf("DAC Stopped, FPGA  Status: 0x%.8X\n", data);
  close(fd);
  //  stop_device(fd);
  //fclose(fd_wrt);
  //printf("Acquired %d packets, %d samples\n", Npackets, SAMP_PER_PACKET *Npackets ); 
  return 0;
}

//int init_device(int argc, char **argv)
int init_device(int fd)
{
  int  tmp, tmpf, rc;
  //OFFSET_REGS off_s;
  
  usleep(100);
  rc = ioctl(fd, PCIE_ATCA_IOCG_STATUS, &tmp);// Get FPGA STATUS to check if properly initialized (optional)
  printf("FPGA Status: 0x%.8X\n", tmp);

  rc = ioctl(fd, PCIE_ATCA_IOCG_COUNTER, &tmp);
  printf("FPGA Counter: 0x%.8X, %d", tmp, tmp);
  usleep(100000);
  // sleep(1);
  rc = ioctl(fd, PCIE_ATCA_IOCG_COUNTER, &tmpf);
  printf(" +.1s delta Counter: %d\n", tmpf - tmp);
  rc = ioctl(fd, PCIE_ATCA_IOCG_STATUS, &tmp);
  printf("FPGA TRG Status: 0x%.8X\n", tmp);

  return rc;
}

