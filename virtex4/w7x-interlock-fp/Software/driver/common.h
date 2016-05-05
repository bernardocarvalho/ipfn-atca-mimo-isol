/**
 * ATCA IO CONTROL Integrator
 * Linux Device Driver
 * Internal definitions for all parts (prototypes, data, macros) 
 *
 * SVN keywords
 * $Date: 2015-01-07 19:47:54 +0000 (Wed, 07 Jan 2015) $
 * $Revision: 6955 $
 * $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_INTLCK_FP/Software/driver/common.h $
 *
 */
#ifndef _DRIVER_COMMON_H
#define _DRIVER_COMMON_H

#include <linux/version.h>
#include <linux/types.h>
#include <linux/module.h>
#include <linux/pci.h>
#include <linux/kernel.h>
#include <linux/errno.h>
#include <linux/fs.h>
#include <linux/cdev.h>
#include <linux/stat.h>
#include <linux/interrupt.h>
//#include <linux/list.h>
#include <linux/spinlock.h>
#include <linux/sched.h>
#include <linux/wait.h>

#include <asm/atomic.h>
#include <asm/uaccess.h>
#include <asm/msr.h>

//#include <linux/dma-mapping.h>

//#include <linux/delay.h>

//#include <linux/proc_fs.h>

#include "../include/atca-ioc-int.h"

/*************************************************************************/
/* Private data types and structures */

typedef struct _BAR_STRUCT {
	unsigned long start;
	unsigned long end;
	unsigned long len;
	unsigned long flags;
	void* vaddr;
} BAR_STRUCT;

typedef struct _DMA_BUF {
	void* addr_v;
	dma_addr_t addr_hw;
} DMA_BUF;

typedef struct _DMA_STRUCT {
  unsigned int buf_size;
  unsigned int buf_actv;
  dma_addr_t hw_actv;
  u32 *  daddr_actv; // ptr to data on active buffer
  DMA_BUF buf[DMA_BUFFS];
} DMA_STRUCT;

typedef struct _READ_BUF {
	int count;
	int total;
	u32* buf;				// assume that ADC data is 32bit wide
} READ_BUF;

typedef struct _DMA_REG {
    union
    {
      u32 reg32;
      struct  {
	u32 Size:16, BuffsNumber:16;
      } dmaFlds;
    };
} DMA_REG;

typedef struct _PCIE_HREGS {
  volatile STATUS_REG       status;
  volatile COMMAND_REG      command;            /*Offset 0x04*/
  volatile u32              acqFreq;            /*Offset 0x08*/
  volatile DMA_REG          dmaReg;             /*Offset 0x0C*/
  volatile u32              dmaCurrBuff;        /*Offset 0x10*/
  volatile u32              hwcounter;          /*Offset 0x14*/
  volatile u32              triggerDelay;      /*Offset 0x18*/
  volatile u32              _reserved2;      /*Offset 0x1C*/
  volatile u32              HwDmaAddr[16];      /*Offset 0x20 - 0x5C*/
  volatile u32              dmaNbytes;          /*Offset 0x60*/
  volatile u32              dmaNThres;          /*Offset 0x64*/
  volatile u32              reserved3[4];       /*Offset 0x68-0x74 */
  volatile u32              dac_data[8];        /*Offset 0x78-0x94 (d30)*/
  volatile u32              reserved4[2];       /*Offset 0x98-0x9C */
  volatile u32              chop_max_count;      /*Offset 0xA0 (d40)*/
  volatile u32              chop_change_count;   /*Offset 0xA4 */
  volatile u32              reserved5[8];       /*Offset 0xA8-0xC4 */
  volatile u32              reg_offset;          /*Offset 0xC8 (d50)*/
  volatile u32              reg_data;            /*Offset 0xCC */

  //volatile u32              dmaOffSet;          /*Offset 0x64*/
  //volatile u32              _reserved3;         /*Offset 0x68*/
  //volatile u32              _reserved4;         /*Offset 0x6C*/
  //volatile u32              acqByteSize;        /*Offset 0x70 */

  /* volatile u32              ADC_data_pos_a;      /\*Offset 0xB0 *\/ */
  /* volatile u32              ADC_data_neg_a;      /\*Offset 0xB4 *\/ */
  /* volatile u32              ADC_data_offset_a;      /\*Offset 0xB8 *\/ */

  /* volatile u32              counter_offset_p_a;      /\*Offset 0xBC *\/ */
  /* volatile u32              counter_offset_n_a;      /\*Offset 0xC0 *\/ */
  /* volatile u32              counter_offset_i_a;      /\*Offset 0xC4 *\/ */

} PCIE_HREGS;

/*Structure for pcie access*/
typedef struct _PCIE_DEV {
  /* char device */
  struct cdev cdev;     /* linux char device structure   */
  struct pci_dev *pdev; /* pci device */
  dev_t devno;          /* char device number */
  struct device *dev;
  unsigned char irq;
  spinlock_t irq_lock; //static
  unsigned int counter;
  unsigned int counter_hw;
  unsigned int open_count;
  struct semaphore open_sem;    //mutual exclusion semaphore
  wait_queue_head_t rd_q;       //read  queues
  long wt_tmout;                //read timeout
  atomic_t rd_condition;
  unsigned int mismatches;
  unsigned int max_buffer_count;
  unsigned int curr_buf;

  BAR_STRUCT memIO[2];
  DMA_STRUCT dmaIO;
  //READ_BUF bufRD;               // buffer struct for read() ops
  PCIE_HREGS *pHregs;

} PCIE_DEV ;

/*I/O Macros*/

#define PCIE_READ32(addr)			ioread32(addr)
#define PCIE_WRITE32(value, addr)		iowrite32(value, addr)
#define PCIE_FLUSH32()				PCIE_READ32()

/*************************************************************************/
/* Some nice defines that make code more readable */
/* This is to print nice info in the log 

#ifdef DEBUG
#define mod_info( args... ) \
  do { printk( KERN_INFO "%s - %s : ", MODNAME , __FUNCTION__ );\
    printk( args ); } while(0)
#define mod_info_dbg( args... ) \
  do { printk( KERN_INFO "%s - %s : ", MODNAME , __FUNCTION__ );\
       printk( args ); } while(0)
#else
#define mod_info( args... ) \
  do { printk( KERN_INFO "%s: ", MODNAME );\
       printk( args ); } while(0)
#define mod_info_dbg( args... )
#endif

#define mod_crit( args... ) \
  do { printk( KERN_CRIT "%s: ", MODNAME );\
       printk( args ); } while(0)

#define MIN(a, b) ((a) < (b) ? (a) : (b))

**/

#endif  // _DRIVER_COMMON_H
