/**
 *
 * @file ioctl.c
 * @author Bernardo Carvalho
 * @date 2014-06-27
 * @brief Contains the functions handling the different ioctl calls.
 *
 * SVN keywords
 * $Author: bernardo $
 * $Date: 2014-06-26 19:06:08 +0100 (Thu, 26 Jun 2014) $
 * $Revision: 6538 $
 * $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_INTLCK_FP/Software/driver/ioctl.c $
 *

 */

/* Configuration for the driver (what should be compiled in, module name, etc...) */
#include "config.h"

/* Internal definitions for all parts (includes, prototypes, data, macros) */
#include "common.h"

#include "../include/atca-ioc-int-ioctl.h"


/**
 * _unlocked_ioctl
 */
long _unlocked_ioctl(struct file *filp,  unsigned int cmd, unsigned long arg){

  int err = 0, retval = 0;
  unsigned long  flags  = 0;
  u32 tmp;
  COMMAND_REG    cReg;
  PCIE_DEV *pciDev; /* for device information */
  STATUS_REG sReg;

  /* retrieve the device information  */
  pciDev = (PCIE_DEV *)filp->private_data;

  sReg.reg32 = ioread32( (void*) &pciDev->pHregs->status);
  if(sReg.reg32 == 0xFFFFFFFF)
    PDEBUG("ioctl status Reg:0x%X, cmd: 0x%X, 0x%08X\n", sReg.reg32, cmd, PCIE_ATCA_IOCT_ACQ_DISABLE);

  /**
   * extract the type and number bitfields, and don't decode
   * wrong cmds: return ENOTTY (inappropriate ioctl) before access_ok()
   */
  if (_IOC_TYPE(cmd) != PCIE_ATCA_IOC_MAGIC) return -ENOTTY;
  if (_IOC_NR(cmd) > PCIE_ATCA_IOC_MAXNR) return -ENOTTY;

  /*
   * the direction is a bitmask, and VERIFY_WRITE catches R/W
   * transfers. `Type' is user-oriented, while
   * access_ok is kernel-oriented, so the concept of "read" and
   * "write" is reversed
   */
  if (_IOC_DIR(cmd) & _IOC_READ)
    err = !access_ok(VERIFY_WRITE, (void __user *)arg, _IOC_SIZE(cmd));
  else if (_IOC_DIR(cmd) & _IOC_WRITE)
    err =  !access_ok(VERIFY_READ, (void __user *)arg, _IOC_SIZE(cmd));
  if (err) return -EFAULT;
  switch(cmd) {

  case PCIE_ATCA_IOCG_STATUS:
    spin_lock_irqsave(&pciDev->irq_lock, flags);
    //  ----- ----- ----- ----- ----- DEVICE SPECIFIC CODE ----- ----- ----- ----- ----- -----
    tmp = PCIE_READ32((void*) &pciDev->pHregs->status);
    //  ----- ----- ----- ----- ----- DEVICE SPECIFIC CODE ----- ----- ----- ----- ----- -----
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);

    if(copy_to_user((void __user *)arg, &tmp, sizeof(u32)))
      return -EFAULT;
    break;

  case PCIE_ATCA_IOCT_INT_ENABLE:
    spin_lock_irqsave(&pciDev->irq_lock, flags);
    // ----- ----- ----- ----- ----- ----- DEVICE SPECIFIC CODE ----- ----- ----- ----- ----- -----
    cReg.reg32=PCIE_READ32((void*) &pciDev->pHregs->command);
    cReg.cmdFlds.ACQiE=1;
    cReg.cmdFlds.DMAiE=1;
    PCIE_WRITE32(cReg.reg32, (void*) &pciDev->pHregs->command);
    // ----- ----- ----- ----- ----- ----- DEVICE SPECIFIC CODE ----- ----- ----- ----- ----- -----
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);
    break;

  case PCIE_ATCA_IOCT_INT_DISABLE:
    spin_lock_irqsave(&pciDev->irq_lock, flags);
    // ----- ----- ----- ----- ----- ----- DEVICE SPECIFIC CODE ----- ----- ----- ----- ----- -----
    cReg.reg32=PCIE_READ32((void*) &pciDev->pHregs->command);
    cReg.cmdFlds.ACQiE=0;
    cReg.cmdFlds.DMAiE=0;
    PCIE_WRITE32(cReg.reg32, (void*) &pciDev->pHregs->command);
    // ----- ----- ----- ----- ----- ----- DEVICE SPECIFIC CODE ----- ----- ----- ----- ----- -----
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);
    break;

  case PCIE_ATCA_IOCT_ACQ_ENABLE:
    spin_lock_irqsave(&pciDev->irq_lock, flags);
    cReg.reg32=PCIE_READ32((void*) &pciDev->pHregs->command);
    pciDev->mismatches=0;
    pciDev->curr_buf=0;
    pciDev->max_buffer_count=0;
    atomic_set(&pciDev->rd_condition, 0);
    cReg.cmdFlds.ACQE=1;
    PCIE_WRITE32(cReg.reg32, (void*) &pciDev->pHregs->command);
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);
    break;
  case PCIE_ATCA_IOCT_ACQ_DISABLE :
    retval = pciDev->max_buffer_count;
    spin_lock_irqsave(&pciDev->irq_lock, flags);
    // ----- ----- ----- ----- ----- ----- DEVICE SPECIFIC CODE ----- ----- ----- ----- ----- -----
    cReg.reg32=PCIE_READ32((void*) &pciDev->pHregs->command);
    cReg.cmdFlds.ACQE=0;
    cReg.cmdFlds.STRG=0;
    PCIE_WRITE32(cReg.reg32, (void*) &pciDev->pHregs->command);
    // ----- ----- ----- ----- ----- ----- DEVICE SPECIFIC CODE ----- ----- ----- ----- ----- -----
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);
    break;

  case PCIE_ATCA_IOCT_BIG_ENDIAN:
    spin_lock_irqsave(&pciDev->irq_lock, flags);
    cReg.reg32=PCIE_READ32((void*) &pciDev->pHregs->command);
    cReg.cmdFlds.BIG_ENDN = 1;
    PCIE_WRITE32(cReg.reg32, (void*) &pciDev->pHregs->command);
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);
    break;
  case PCIE_ATCA_IOCT_LITTLE_ENDIAN:
    spin_lock_irqsave(&pciDev->irq_lock, flags);
    cReg.reg32=PCIE_READ32((void*) &pciDev->pHregs->command);
    cReg.cmdFlds.BIG_ENDN = 0;
    PCIE_WRITE32(cReg.reg32, (void*) &pciDev->pHregs->command);
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);
    break;

  case PCIE_ATCA_IOCT_DMA_ENABLE:
    spin_lock_irqsave(&pciDev->irq_lock, flags);
    // ----- ----- ----- ----- ----- ----- DEVICE SPECIFIC CODE ----- ----- ----- ----- ----- -----
    cReg.reg32=PCIE_READ32((void*) &pciDev->pHregs->command);
    cReg.cmdFlds.DMAE=1;
    PCIE_WRITE32(cReg.reg32, (void*) &pciDev->pHregs->command);
    // ----- ----- ----- ----- ----- ----- DEVICE SPECIFIC CODE ----- ----- ----- ----- ----- -----
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);

    break;
  case PCIE_ATCA_IOCT_DMA_DISABLE :
    spin_lock_irqsave(&pciDev->irq_lock, flags);
    // ----- ----- ----- ----- ----- ----- DEVICE SPECIFIC CODE ----- ----- ----- ----- ----- -----
    cReg.reg32=PCIE_READ32((void*) &pciDev->pHregs->command);
    cReg.cmdFlds.DMAE=0;
    PCIE_WRITE32(cReg.reg32, (void*) &pciDev->pHregs->command);
    // ----- ----- ----- ----- ----- ----- DEVICE SPECIFIC CODE ----- ----- ----- ----- ----- -----
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);

    break;

  case PCIE_ATCA_IOCG_COUNTER:
    spin_lock_irqsave(&pciDev->irq_lock, flags);
    tmp = PCIE_READ32((void*) &pciDev->pHregs->hwcounter);
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);
    if(copy_to_user((void __user *)arg, &tmp, sizeof(u32)))
      return -EFAULT;
    break;

  case  PCIE_ATCA_IOCS_RDTMOUT:
    retval = __get_user(tmp, (int __user *)arg);
    if (!retval)
      pciDev->wt_tmout = tmp * HZ;
    break;

  case PCIE_ATCA_IOCT_SOFT_TRIG:
    spin_lock_irqsave(&pciDev->irq_lock, flags);
    // ----- ----- ----- ----- ----- ----- DEVICE SPECIFIC CODE ----- ----- ----- ----- ----- -----
    cReg.reg32=PCIE_READ32((void*) &pciDev->pHregs->command);
    cReg.cmdFlds.STRG=1;
    PCIE_WRITE32(cReg.reg32, (void*) &pciDev->pHregs->command);
    // ----- ----- ----- ----- ----- ----- DEVICE SPECIFIC CODE ----- ----- ----- ----- ----- -----
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);
    break;

    /**
     ** Not used yet in this Board
  case PCIE_ATCA_IOCT_CLOCKS_SHARED:
    spin_lock_irqsave(&pciDev->irq_lock, flags);
    // ----- ----- ----- ----- ----- ----- DEVICE SPECIFIC CODE ----- ----- ----- ----- ----- -----
    cReg.reg32=PCIE_READ32((void*) &pciDev->pHregs->command);
    cReg.cmdFlds.ACQS=0;
    PCIE_WRITE32(cReg.reg32, (void*) &pciDev->pHregs->command);
    // ----- ----- ----- ----- ----- ----- DEVICE SPECIFIC CODE ----- ----- ----- ----- ----- -----
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);
    break;
  case PCIE_ATCA_IOCT_CLOCKS_LOCAL:
    spin_lock_irqsave(&pciDev->irq_lock, flags);
    // ----- ----- ----- ----- ----- ----- DEVICE SPECIFIC CODE ----- ----- ----- ----- ----- -----
    cReg.reg32=PCIE_READ32((void*) &pciDev->pHregs->command);
    cReg.cmdFlds.ACQS=1;
    PCIE_WRITE32(cReg.reg32, (void*) &pciDev->pHregs->command);
    PDEBUG(KERN_DEBUG "ioctl local clock  Status:0x%08x, Command 0x%08x\n",
	   PCIE_READ32((void*) &pciDev->pHregs->status),
	   PCIE_READ32((void*) &pciDev->pHregs->command));
    // ----- ----- ----- ----- ----- ----- DEVICE SPECIFIC CODE ----- ----- ----- ----- ----- -----
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);
    break;

  case PCIE_ATCA_IOCT_TRIG_SHARED:
    spin_lock_irqsave(&pciDev->irq_lock, flags);
    // ----- ----- ----- ----- ----- ----- DEVICE SPECIFIC CODE ----- ----- ----- ----- ----- -----
    cReg.reg32=PCIE_READ32((void*) &pciDev->pHregs->command);
    cReg.cmdFlds.TRGS=0;
    PCIE_WRITE32(cReg.reg32, (void*) &pciDev->pHregs->command);
    // ----- ----- ----- ----- ----- ----- DEVICE SPECIFIC CODE ----- ----- ----- ----- ----- -----
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);
    break;
  case PCIE_ATCA_IOCT_TRIG_LOCAL:
    spin_lock_irqsave(&pciDev->irq_lock, flags);
    // ----- ----- ----- ----- ----- ----- DEVICE SPECIFIC CODE ----- ----- ----- ----- ----- -----
    cReg.reg32=PCIE_READ32((void*) &pciDev->pHregs->command);
    cReg.cmdFlds.TRGS=1;
    PCIE_WRITE32(cReg.reg32, (void*) &pciDev->pHregs->command);
    // ----- ----- ----- ----- ----- ----- DEVICE SPECIFIC CODE ----- ----- ----- ----- ----- -----
    PDEBUG(KERN_DEBUG "ioctl trig local  Status:0x%08x, Command 0x%08x\n",
	   PCIE_READ32((void*) &pciDev->pHregs->status),
	   PCIE_READ32((void*) &pciDev->pHregs->command));

    spin_unlock_irqrestore(&pciDev->irq_lock, flags);
    break;
    */
  case  PCIE_ATCA_IOCS_DMA_SIZE:
    retval = __get_user(tmp, (int __user *)arg);
    if (!retval){
      spin_lock_irqsave(&pciDev->irq_lock, flags);
      iowrite32(tmp, (void*) &pciDev->pHregs->dmaNbytes);  // write the buffer size to the FPGA
      spin_unlock_irqrestore(&pciDev->irq_lock, flags);
    }
    break;

  case PCIE_ATCA_IOCG_DMA_SIZE:
    spin_lock_irqsave(&pciDev->irq_lock, flags);
      tmp = ioread32((void*) &pciDev->pHregs->dmaNbytes);  // write the buffer size to the FPGA
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);
    if(copy_to_user((void __user *)arg, &tmp, sizeof(u32)))
      return -EFAULT;
    break;

/*  case  PCIE_ATCA_IOCS_DMA_THRES:
    retval = __get_user(tmp, (int __user *)arg);
    if (!retval){
      spin_lock_irqsave(&pciDev->irq_lock, flags);
      iowrite32(tmp, (void*) &pciDev->pHregs->dmaNThres);
      spin_unlock_irqrestore(&pciDev->irq_lock, flags);
    }
    break;

  case PCIE_ATCA_IOCG_DMA_THRES:
    spin_lock_irqsave(&pciDev->irq_lock, flags);
    tmp = ioread32((void*) &pciDev->pHregs->dmaNThres);
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);
    if(copy_to_user((void __user *)arg, &tmp, sizeof(u32)))
      return -EFAULT;
    break;
*/
  case PCIE_ATCA_IOCT_STREAM_ENABLE:
    spin_lock_irqsave(&pciDev->irq_lock, flags);

    cReg.reg32=PCIE_READ32((void*) &pciDev->pHregs->command);
    cReg.cmdFlds.STREAME=1;
    PCIE_WRITE32(cReg.reg32, (void*) &pciDev->pHregs->command);

    spin_unlock_irqrestore(&pciDev->irq_lock, flags);
    break;

  case PCIE_ATCA_IOCT_STREAM_DISABLE :
    retval = pciDev->mismatches;
    spin_lock_irqsave(&pciDev->irq_lock, flags);
    // ----- ----- ----- ----- ----- ----- DEVICE SPECIFIC CODE ----- ----- ----- ----- ----- -----
    cReg.reg32=PCIE_READ32((void*) &pciDev->pHregs->command);
    cReg.cmdFlds.STREAME=0;
    PCIE_WRITE32(cReg.reg32, (void*) &pciDev->pHregs->command);
    // ----- ----- ----- ----- ----- ----- DEVICE SPECIFIC CODE ----- ----- ----- ----- ----- -----
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);

    break;
    /**
       case  PCIE_ATCA_IOCS_ATCA_OFF:
       if(copy_from_user(&off_s, (void __user *)arg, sizeof(OFFSET_REGS)))
       return -EFAULT;

       printk("PCIE_ATCA_IOCS_ATCA_OFF");
       for (i=0; i< 16; i++)
       printk("i:%d o:%d", i,  off_s.offset[i]);
       //, off_s.offset[1], off_s.offset[2] );
       spin_lock_irqsave(&pciDev->irq_lock, flags);
       //for (i=0; i< 16; i++)
       //PCIE_WRITE32(off_s.offset[i], (void*) &pciDev->pHregs->offset_adc[i]);

       //    memcpy_toio((void*) &pciDev->pHregs->offset_adc[0], &off_s, sizeof(OFFSET_REGS));

       //write ADC OffSet
       //      PCIE_WRITE32(tmp, (void*) &pciDev->pHregs->dmaOffSet);
       //   		printk(KERN_DEBUG "pcieAdc ioctl dmaOffSet 0x%08X\n",
       // 			PCIE_READ32((void*) &pciDev->pHregs->dmaOffSet));
       spin_unlock_irqrestore(&pciDev->irq_lock, flags);

       break;
    */
    /*
      case  PCIE_ATCA_IOCG_ATCA_OFF:
      spin_lock_irqsave(&pciDev->irq_lock, flags);
      for (i=0; i< 16; i++)
      off_s.offset[i]=PCIE_READ32( (void*) &pciDev->pHregs->offset_adc[i]);

      //    memcpy_fromio(&off_s, (void*) &pciDev->pHregs->offset_adc[0], sizeof(OFFSET_REGS));
      spin_unlock_irqrestore(&pciDev->irq_lock, flags);
      printk("PCIE_ATCA_IOCG_ATCA_OFF");
      for (i=0; i< 16; i++)
      printk("i:%d o:%d", i, off_s.offset[i]);
      //    printk("offs read: %d, %d, %d\n",
      //	   off_s.offset[0], off_s.offset[1], off_s.offset[2] );

      if(copy_to_user((void __user *)arg, &off_s, sizeof(OFFSET_REGS)))
      return -EFAULT;

      break;
      /////////////////////////////////////////////////////////////
      */
  case PCIE_ATCA_IOCT_CHOP_ON:
    spin_lock_irqsave(&pciDev->irq_lock, flags);

    cReg.reg32=PCIE_READ32((void*) &pciDev->pHregs->command);
    cReg.cmdFlds.CHOP_ON=1;
    PCIE_WRITE32(cReg.reg32, (void*) &pciDev->pHregs->command);

    spin_unlock_irqrestore(&pciDev->irq_lock, flags);

    break;

  case PCIE_ATCA_IOCT_CHOP_OFF:
    spin_lock_irqsave(&pciDev->irq_lock, flags);

    cReg.reg32=PCIE_READ32((void*) &pciDev->pHregs->command);
    cReg.cmdFlds.CHOP_ON=0;
    PCIE_WRITE32(cReg.reg32, (void*) &pciDev->pHregs->command);

    spin_unlock_irqrestore(&pciDev->irq_lock, flags);

    break;

  case PCIE_ATCA_IOCT_CHOP_DEFAULT_1:
    spin_lock_irqsave(&pciDev->irq_lock, flags);

    cReg.reg32=PCIE_READ32((void*) &pciDev->pHregs->command);
    cReg.cmdFlds.CHOP_DEFAULT=1;
    PCIE_WRITE32(cReg.reg32, (void*) &pciDev->pHregs->command);

    spin_unlock_irqrestore(&pciDev->irq_lock, flags);

    break;

  case PCIE_ATCA_IOCT_CHOP_DEFAULT_0:
    spin_lock_irqsave(&pciDev->irq_lock, flags);

    cReg.reg32=PCIE_READ32((void*) &pciDev->pHregs->command);
    cReg.cmdFlds.CHOP_DEFAULT=0;
    PCIE_WRITE32(cReg.reg32, (void*) &pciDev->pHregs->command);

    spin_unlock_irqrestore(&pciDev->irq_lock, flags);

    break;

  case  PCIE_ATCA_IOCS_CHOP_MAX_COUNT:
    if(copy_from_user(&tmp, (void __user *)arg, sizeof(tmp)))
      return -EFAULT;
    PDEBUG("PCIE_ATCA_IOCS_CHOP_MAX_COUNT,  Chop:%d", tmp);

    spin_lock_irqsave(&pciDev->irq_lock, flags);
    PCIE_WRITE32(tmp, (void*) &pciDev->pHregs->chop_max_count);
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);

    break;

  case  PCIE_ATCA_IOCG_CHOP_MAX_COUNT:
    spin_lock_irqsave(&pciDev->irq_lock, flags);
    tmp=PCIE_READ32( (void*) &pciDev->pHregs->chop_max_count);
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);
    PDEBUG("PCIE_ATCA_IOCG_CHOP_MAX_COUNT,  Chop:%d", tmp);

    if(copy_to_user((void __user *)arg, &tmp, sizeof(tmp)))
      return -EFAULT;

    break;

  case  PCIE_ATCA_IOCS_CHOP_CHANGE_COUNT:
    if(copy_from_user(&tmp, (void __user *)arg, sizeof(tmp)))
      return -EFAULT;
    PDEBUG("PCIE_ATCA_IOCS_CHANGE_COUNT,  Chop:%d", tmp);

    spin_lock_irqsave(&pciDev->irq_lock, flags);
    PCIE_WRITE32(tmp, (void*) &pciDev->pHregs->chop_change_count);
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);

    break;

    /////////////////////////////////////////////////////
  case PCIE_ATCA_IOCT_CHOP_RECONSTRUCT_ON:
    spin_lock_irqsave(&pciDev->irq_lock, flags);

    cReg.reg32=PCIE_READ32((void*) &pciDev->pHregs->command);
    cReg.cmdFlds.CHOP_RECONSTRUCT=1;
    PCIE_WRITE32(cReg.reg32, (void*) &pciDev->pHregs->command);

    spin_unlock_irqrestore(&pciDev->irq_lock, flags);

    break;

  case PCIE_ATCA_IOCT_CHOP_RECONSTRUCT_OFF:
    spin_lock_irqsave(&pciDev->irq_lock, flags);

    cReg.reg32=PCIE_READ32((void*) &pciDev->pHregs->command);
    cReg.cmdFlds.CHOP_RECONSTRUCT=0;
    PCIE_WRITE32(cReg.reg32, (void*) &pciDev->pHregs->command);

    spin_unlock_irqrestore(&pciDev->irq_lock, flags);

    break;
    ///////////////////////////////////////////////////
  /**
    case PCIE_ATCA_IOCT_OFFSET_CALC_ON:
    spin_lock_irqsave(&pciDev->irq_lock, flags);

    cReg.reg32=PCIE_READ32((void*) &pciDev->pHregs->command);
    cReg.cmdFlds.OFFSET_CALC=1;
    PCIE_WRITE32(cReg.reg32, (void*) &pciDev->pHregs->command);

    spin_unlock_irqrestore(&pciDev->irq_lock, flags);

    break;

  case PCIE_ATCA_IOCT_OFFSET_CALC_OFF:
    spin_lock_irqsave(&pciDev->irq_lock, flags);

    cReg.reg32=PCIE_READ32((void*) &pciDev->pHregs->command);
    cReg.cmdFlds.OFFSET_CALC=0;
    PCIE_WRITE32(cReg.reg32, (void*) &pciDev->pHregs->command);

    spin_unlock_irqrestore(&pciDev->irq_lock, flags);

    break;
*/
  case  PCIE_ATCA_IOCS_DAC_1_DATA:
    if(copy_from_user(&tmp, (void __user *)arg, sizeof(tmp)))
      return -EFAULT;

    PDEBUGG("PCIE_ATCA_IOCS_DAC_1_DATA, DAC:%d\n", tmp);

    spin_lock_irqsave(&pciDev->irq_lock, flags);
    PCIE_WRITE32(tmp, (void*) &pciDev->pHregs->dac_data[0]);
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);

    break;

  case  PCIE_ATCA_IOCS_DAC_2_DATA:
    if(copy_from_user(&tmp, (void __user *)arg, sizeof(tmp)))
      return -EFAULT;
    PDEBUGG("PCIE_ATCA_IOCS_DAC_2_DATA, DAC:%d\n", tmp);
    spin_lock_irqsave(&pciDev->irq_lock, flags);
    PCIE_WRITE32(tmp, (void*) &pciDev->pHregs->dac_data[1]);
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);

    break;

  case  PCIE_ATCA_IOCS_DAC_3_DATA:
    if(copy_from_user(&tmp, (void __user *)arg, sizeof(tmp)))
      return -EFAULT;
    spin_lock_irqsave(&pciDev->irq_lock, flags);
    PCIE_WRITE32(tmp, (void*) &pciDev->pHregs->dac_data[2]);
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);
    break;
  case  PCIE_ATCA_IOCS_DAC_4_DATA:
    if(copy_from_user(&tmp, (void __user *)arg, sizeof(tmp)))
      return -EFAULT;
    spin_lock_irqsave(&pciDev->irq_lock, flags);
    PCIE_WRITE32(tmp, (void*) &pciDev->pHregs->dac_data[3]);
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);
    break;
  case  PCIE_ATCA_IOCS_DAC_5_DATA:
    if(copy_from_user(&tmp, (void __user *)arg, sizeof(tmp)))
      return -EFAULT;
    spin_lock_irqsave(&pciDev->irq_lock, flags);
    PCIE_WRITE32(tmp, (void*) &pciDev->pHregs->dac_data[4]);
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);
    break;
  case  PCIE_ATCA_IOCS_DAC_6_DATA:
    if(copy_from_user(&tmp, (void __user *)arg, sizeof(tmp)))
      return -EFAULT;
    spin_lock_irqsave(&pciDev->irq_lock, flags);
    PCIE_WRITE32(tmp, (void*) &pciDev->pHregs->dac_data[5]);
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);
    break;
  case  PCIE_ATCA_IOCS_DAC_7_DATA:
    if(copy_from_user(&tmp, (void __user *)arg, sizeof(tmp)))
      return -EFAULT;
    spin_lock_irqsave(&pciDev->irq_lock, flags);
    PCIE_WRITE32(tmp, (void*) &pciDev->pHregs->dac_data[6]);
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);
    break;
  case  PCIE_ATCA_IOCS_DAC_8_DATA:
    if(copy_from_user(&tmp, (void __user *)arg, sizeof(tmp)))
      return -EFAULT;
    spin_lock_irqsave(&pciDev->irq_lock, flags);
    PCIE_WRITE32(tmp, (void*) &pciDev->pHregs->dac_data[7]);
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);
    break;

  case  PCIE_ATCA_IOCS_REG_OFF:
    if(copy_from_user(&tmp, (void __user *)arg, sizeof(tmp)))
      return -EFAULT;
    PDEBUG("PCIE_ATCA_IOCS_REG_OFF, :%d\n", tmp);
    spin_lock_irqsave(&pciDev->irq_lock, flags);
    PCIE_WRITE32(tmp, (void*) &pciDev->pHregs->reg_offset);
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);
    break;

 case  PCIE_ATCA_IOCS_REG_DATA:
    if(copy_from_user(&tmp, (void __user *)arg, sizeof(tmp)))
      return -EFAULT;
    PDEBUG("PCIE_ATCA_IOCS_REG_DATA, :%d\n", tmp);
    spin_lock_irqsave(&pciDev->irq_lock, flags);
    PCIE_WRITE32(tmp, (void*) &pciDev->pHregs->reg_data);
    spin_unlock_irqrestore(&pciDev->irq_lock, flags);
    break;

    /////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////

    /* case  PCIE_ATCA_IOCG_ATCA_POS_INF: */
    /*   spin_lock_irqsave(&pciDev->irq_lock, flags);     */
    /*     tmp=PCIE_READ32( (void*) &pciDev->pHregs->ADC_data_pos_a); */

    /*   spin_unlock_irqrestore(&pciDev->irq_lock, flags); */
    /*   printk("PCIE_ATCA_IOCG_ATCA_POS_INF"); */
    /*     printk("Counter pos value:%d ", tmp); */

    /*   if(copy_to_user((void __user *)arg, &tmp, sizeof(tmp))) */
    /*     return -EFAULT; */

    /*   break; */

    /* case  PCIE_ATCA_IOCG_ATCA_NEG_INF: */
    /*   spin_lock_irqsave(&pciDev->irq_lock, flags);     */
    /*     tmp=PCIE_READ32( (void*) &pciDev->pHregs->ADC_data_neg_a); */

    /*   spin_unlock_irqrestore(&pciDev->irq_lock, flags); */
    /*   printk("PCIE_ATCA_IOCG_ATCA_NEG_INF"); */
    /*     printk("Counter neg value:%d ", tmp); */

    /*   if(copy_to_user((void __user *)arg, &tmp, sizeof(tmp))) */
    /*     return -EFAULT; */

    /*   break; */

    /* case  PCIE_ATCA_IOCG_ATCA_OFFSET_INF: */
    /*   spin_lock_irqsave(&pciDev->irq_lock, flags);     */
    /*     tmp=PCIE_READ32( (void*) &pciDev->pHregs->ADC_data_offset_a); */

    /*   spin_unlock_irqrestore(&pciDev->irq_lock, flags); */
    /*   printk("PCIE_ATCA_IOCG_ATCA_OFFSET_INF"); */
    /*     printk("Calculated Offset Value:%d ", tmp); */

    /*   if(copy_to_user((void __user *)arg, &tmp, sizeof(tmp))) */
    /*     return -EFAULT; */

    /*   break; */
    //////////////////////////////////////////////////////

    /* case  PCIE_ATCA_IOCG_COUNTER_OFFSET_P: */
    /*   spin_lock_irqsave(&pciDev->irq_lock, flags);     */
    /*     tmp=PCIE_READ32( (void*) &pciDev->pHregs->counter_offset_p_a); */

    /*   spin_unlock_irqrestore(&pciDev->irq_lock, flags); */
    /*   printk("PCIE_ATCA_IOCG_COUNTER_OFFSET_P"); */
    /*     printk("PCIE_ATCA_IOCG_COUNTER_OFFSET_P Value:%d ", tmp); */

    /*   if(copy_to_user((void __user *)arg, &tmp, sizeof(tmp))) */
    /*     return -EFAULT; */

    /*   break; */

    /* case  PCIE_ATCA_IOCG_COUNTER_OFFSET_N: */
    /*   spin_lock_irqsave(&pciDev->irq_lock, flags);     */
    /*     tmp=PCIE_READ32( (void*) &pciDev->pHregs->counter_offset_n_a); */

    /*   spin_unlock_irqrestore(&pciDev->irq_lock, flags); */
    /*   printk("PCIE_ATCA_IOCG_COUNTER_OFFSET_N"); */
    /*     printk("PCIE_ATCA_IOCG_COUNTER_OFFSET_N Value:%d ", tmp); */

    /*   if(copy_to_user((void __user *)arg, &tmp, sizeof(tmp))) */
    /*     return -EFAULT; */

    /*   break; */

    /* case  PCIE_ATCA_IOCG_COUNTER_OFFSET_I: */
    /*   spin_lock_irqsave(&pciDev->irq_lock, flags);     */
    /*     tmp=PCIE_READ32( (void*) &pciDev->pHregs->counter_offset_i_a); */

    /*   spin_unlock_irqrestore(&pciDev->irq_lock, flags); */
    /*   printk("PCIE_ATCA_IOCG_COUNTER_OFFSET_I"); */
    /*     printk("PCIE_ATCA_IOCG_COUNTER_OFFSET_I Value:%d ", tmp); */

    /*   if(copy_to_user((void __user *)arg, &tmp, sizeof(tmp))) */
    /*     return -EFAULT; */

    /*   break; */

/*
  case PCIE_ATCA_IOCT_INTEGRAL_CALC_ON:
    spin_lock_irqsave(&pciDev->irq_lock, flags);

    cReg.reg32=PCIE_READ32((void*) &pciDev->pHregs->command);
    cReg.cmdFlds.INTEGRAL_CALC=1;
    PCIE_WRITE32(cReg.reg32, (void*) &pciDev->pHregs->command);

    spin_unlock_irqrestore(&pciDev->irq_lock, flags);

    break;

  case PCIE_ATCA_IOCT_INTEGRAL_CALC_OFF:
    spin_lock_irqsave(&pciDev->irq_lock, flags);

    cReg.reg32=PCIE_READ32((void*) &pciDev->pHregs->command);
    cReg.cmdFlds.INTEGRAL_CALC=0;
    PCIE_WRITE32(cReg.reg32, (void*) &pciDev->pHregs->command);

    spin_unlock_irqrestore(&pciDev->irq_lock, flags);

    break;
*/
  default:  /* redundant, as cmd was checked against MAXNR */
    return -ENOTTY;
  }
  return retval;
}



    /**
       case  PCIE_ATCA_IOCS_COUNTER_INTEGRAL:
       if(copy_from_user(&tmp, (void __user *)arg, sizeof(tmp)))
       return -EFAULT;

       printk("PCIE_ATCA_IOCS_COUNTER_INTEGRAL");
       printk("Counter Integral:%d", tmp);
       spin_lock_irqsave(&pciDev->irq_lock, flags);

       PCIE_WRITE32(tmp, (void*) &pciDev->pHregs->COUNTER_INTEGRAL_a);

       spin_unlock_irqrestore(&pciDev->irq_lock, flags);

       break;

    */
