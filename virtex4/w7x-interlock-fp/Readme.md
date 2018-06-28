# W7-X Diamagnetic Interlock Firmware
### See Manual in `/Docs` Folder

## 28/06/2018
### Updated Version B4 compiled in Garching Windows PC and runing OK at IPP-HGW
id24_vB4.ace file stored in \implement\W7X\id24_vB4\  
Changes are  
A) HOLD_SAMPLES = 3 (spike removal)  
B) HOLDING signal was advanced one sample  
C) Matthias correction for overflow status bits is done. Matthias Schneider   
D) Changed the trigger code for testing . Trigger signal are use locally on the board.  
  THIS BOARD WILL NOT WORK AS A SLAVE BOARD IN MULTI-BOARD ATCA CRATES

## 19/03/2018
### Updated Version AE compiled in Garching Windows PC and runing OK at IPP-HGW
id24_vAE.ace file stored in \implement\W7X\id24_vAE\  
Compiled in IPFN Linux PC not OK (PCIe seems OK but DMA data is all zeros)  



