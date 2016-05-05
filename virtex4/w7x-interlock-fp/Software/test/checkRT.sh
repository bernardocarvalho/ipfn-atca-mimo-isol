#!/bin/bash
# 
# SVN keywords
# $Author: bernardo $
# $Date: 2014-12-30 17:31:23 +0000 (Tue, 30 Dec 2014) $
# $Revision: 6946 $
# $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_INTLCK_FP/Software/test/checkRT.sh $
#
#
#SAVE_FOLDER="/mnt/f4eHDDsata/tmp/adcData"  # 
# Save Folder. Must be the same as in runAdcReadRT.sh and adcReadRT.
SAVE_FOLDER="/mnt/SSDisk/tmp//DAQSTREAM"
#
if [ ! -d "$SAVE_FOLDER" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
 echo "Directory $SAVE_FOLDER does not exist. Is the HD mounted?".
   exit 3 
fi
#
#clear printk buffer
dmesg -c  > /dev/null
#enable dmesg for regular users
echo 0 > /proc/sys/kernel/dmesg_restrict
#
CPU_INT_MSK=4 ## irq directed to  CPU core 2,  application will run on CPU 3
#

ATCA_IRQ=96 
#SMP="/proc/irq/${ATCA_IRQ}/smp_affinity" 
#echo $SMP
#Remove spaces
#SMP1="${SMP#"${SMP%%[![:space:]]*}"}"
#SMP2="$SMP | tr -d ' '"
#echo -n $SMP1
#echo -n $SMP2
#echo $CPU_INT_MSK > "${SMP1}| tr -d ' '"
echo $CPU_INT_MSK > "/proc/irq/${ATCA_IRQ}/smp_affinity"
ATCA_IRQ_SYS="$(awk -F ':' '/atca_iop_int/ {irq=$1} END {print irq}' /proc/interrupts)"
echo "Check now if ATCA-IOP IRQ number is $ATCA_IRQ_SYS, Otherwise change this script"
#
cat /proc/interrupts | grep atca_ioc
echo "Using MASK:${CPU_INT_MSK} on IRQ:${ATCA_IRQ}"  

#wait
