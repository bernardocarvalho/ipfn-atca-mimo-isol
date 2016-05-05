/***********************************
 *Project: ATCA-IO-CONTROL ADC_INTEGRATORS Software;
 *2 MSPS Integrators modules streaming 16 channel 32 bit ;
 * IPFN
 * SVN keywords :
  $Author: bernardo $
  $Id: atca-ioc-int-lib.h 7291 2015-04-07 18:22:10Z bernardo $
  $Date: 2015-04-07 19:22:10 +0100 (Tue, 07 Apr 2015) $
  SVN $Revision: 7291 $
  $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_INTLCK_FP/Software/test/atca-ioc-int-lib.h $
***********************************/
#include "atca-ioc-int.h"
//#include "common.h"

//#define DMA_ACQ_SIZE DMA_MAX_BYTES // 4096 * 32    Linux page size
//#define DMA_INT_SIZE 128

void stop_device(int fd);
int acq_init_device(int fd, int nchannels, int dma_size,  int chop_period, 
		    int * adc_offset_vec, int * int_offset_vec);
//int int_init_device(int fd, int * adc_offset_vec, int * int_offset_vec,  int nchannels);
int write_coeff_reg(int fd, int chan, int val);

void soft_trigger(int fd);
