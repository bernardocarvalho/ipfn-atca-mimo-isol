/***********************************
 *Project: ATCA-IO-CONTROL ADC_INTEGRATORS Software;
 *2 MSPS Integrators modules streaming 16 channel 32 bit ;
 * IPFN
 * SVN keywords :
  $Author: bernardo $
  $Id: atca-ioc-int-lib.c 7291 2015-04-07 18:22:10Z bernardo $
  $Date: 2015-04-07 19:22:10 +0100 (Tue, 07 Apr 2015) $
  SVN $Revision: 7291 $
  $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_INTLCK_FP/Software/test/atca-ioc-int-lib.c $
***********************************/
#include <stdio.h>
#include <stdlib.h>
//#include <time.h>
#include <unistd.h>
//#include <errno.h>
//#include <sys/types.h>
//#include <sys/stat.h>
#include <sys/ioctl.h>
#include <fcntl.h>

#include "atca-ioc-int-lib.h"
#include "atca-ioc-int-ioctl.h"

int  write_reg(int fD, int reg, int val){
  int rc, tmp;
  /* Set ADC offsets*/
  tmp = reg;
  rc  =  ioctl(fD, PCIE_ATCA_IOCS_REG_OFF, &tmp);
  tmp = val;
  rc = ioctl(fD, PCIE_ATCA_IOCS_REG_DATA, &tmp);

  return rc;
}

int reset_offsets(int fd){
  int rc, i;
  /* Reset ADC offsets*/
  for (i=0; i < 64; i++) {
    rc = write_reg(fd, i, 0);
  }
  return rc;
}

int write_adc_offset(int fd, int chan, int val){
  int rc;
  /* Set ADC offsets*/
  rc = write_reg(fd, chan, val);
  return rc;
}

int write_int_offset(int fd, int chan, int val){
  int rc, reg;
  /* Set ADC offsets*/
  reg = chan + 32;
  rc = write_reg(fd, reg,  val);
  return rc;
}

int write_coeff_reg(int fd, int chan, int val){
  int rc, reg;
  /* Set ADC offsets*/
  reg = chan + 64;
  rc = write_reg(fd, reg,  val);
  return rc;
}

int  soft_trigger(int fd){
  int rc, tmp;
  rc = ioctl(fd, PCIE_ATCA_IOCT_SOFT_TRIG);
  usleep(10);
  tmp = 0;
  rc = ioctl(fd, PCIE_ATCA_IOCG_STATUS, &tmp);
  PDEBUG("FPGA TRG Status: 0x%.8X\n", tmp);
  return rc;
}

int stop_device(int fd){

  int tmp, rc, max_buf_count;

  // this IOCTL returns the nr of times the driver IRQ handler was called while there was still 1 or more buffers waiting to be read
  max_buf_count = ioctl(fd, PCIE_ATCA_IOCT_ACQ_DISABLE);// Stop streaming and un-arm the FPGA.

  rc = ioctl(fd, PCIE_ATCA_IOCT_STREAM_DISABLE);
  usleep(100);

  rc = ioctl(fd, PCIE_ATCA_IOCG_STATUS, &tmp);
  PDEBUG("ACQ Stopped, FPGA  Status: 0x%.8X, max buff_count: %d \n", tmp, max_buf_count);
  return rc;
//  close(fd);

}

//int init_device(int argc, char **argv)
int acq_init_device(int fd, int nchannels, int dma_size, int chop_period, int * adc_offset_vec, int * int_offset_vec){
  int  tmp, tmp1,rc, i;
  //OFFSET_REGS off_s;

  usleep(100);
  rc = ioctl(fd, PCIE_ATCA_IOCG_STATUS, &tmp);// Get FPGA STATUS to check if properly initialized (optional)
  PDEBUG("FPGA Status: 0x%.8X\n", tmp);

  rc = ioctl(fd, PCIE_ATCA_IOCG_COUNTER, &tmp1);
  PDEBUG("FPGA Counter: 0x%.8X, %d", tmp1, tmp1);
  usleep(1000);
  // sleep(1);
  rc = ioctl(fd, PCIE_ATCA_IOCG_COUNTER, &tmp);
  PDEBUG(" +1 ms Delta Counter: %d\n", tmp - tmp1);
  rc = ioctl(fd, PCIE_ATCA_IOCT_CHOP_ON); //Set the Chop on
  //rc = ioctl(fd, PCIE_ATCA_IOCT_CHOP_OFF); //Set the Chop off
  rc = ioctl(fd, PCIE_ATCA_IOCT_CHOP_DEFAULT_0); //
  rc = ioctl(fd, PCIE_ATCA_IOCT_CHOP_RECONSTRUCT_ON); //The signal is  to be reconstruted inside the FPGA before integration
  //rc = ioctl(fd, PCIE_ATCA_IOCT_CHOP_RECONSTRUCT_OFF); //The signal is not to be reconstruted inside the FPGA
//  rc = ioctl(fd, PCIE_ATCA_IOCT_INTEGRAL_CALC_OFF); // Not used in this FW

  tmp = dma_size;
  rc  =  ioctl(fd, PCIE_ATCA_IOCS_DMA_SIZE, &tmp);
  tmp = dma_size;//DMA_ACQ_SIZE;
  //  tmp = DMA_ACQ_SIZE; // 0x40000; // Half Buffer
  //  rc  =  ioctl(fd, PCIE_ATCA_IOCS_DMA_THRES, &tmp);

  //Set the Chop's period, in this case is 2000 times the period of the acquisition period.
  //(2000) The Chop's frequency will be 1kHz

  tmp = chop_period;
  rc  =  ioctl(fd, PCIE_ATCA_IOCS_CHOP_MAX_COUNT, &tmp);
  tmp = chop_period/2;
  rc = ioctl(fd, PCIE_ATCA_IOCS_CHOP_CHANGE_COUNT, &tmp);

  reset_offsets(fd);
  /* Set ADC offsets*/
  for (i=0; i < nchannels; i++)
    write_adc_offset(fd, i, adc_offset_vec[i]);

  /* Set INT offsets*/
  for (i=0; i < nchannels; i++)
    write_int_offset(fd, i, int_offset_vec[i]);

  rc = ioctl(fd, PCIE_ATCA_IOCT_ACQ_ENABLE);  // Arm the FPGA to wait for soft trigger (stream enable)
  usleep(10);
  rc = ioctl(fd, PCIE_ATCA_IOCG_STATUS, &tmp);
  PDEBUG("FPGA ACQ Status: 0x%.8X\n", tmp);
  tmp = 0;

  rc = ioctl(fd, PCIE_ATCA_IOCT_STREAM_ENABLE);
  rc = ioctl(fd, PCIE_ATCA_IOCG_STATUS, &tmp);
  PDEBUG("FPGA STRE Status: 0x%.8X\n", tmp);

  return rc;
}
