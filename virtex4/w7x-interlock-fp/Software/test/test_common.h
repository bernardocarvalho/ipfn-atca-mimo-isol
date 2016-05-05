#include "atca-ioc-int-lib.h"

//#define DATA_PACKING
#define EO_CYCLES  1   // Calc time, in 10 seconds blocks

#define CHOP_BIT_MASK 0x00000001
#define CHOP_POS_VALUE 1
#define CHOP_NEG_VALUE 0 

#define READ_FOLDER  "/mnt/SSDisk/tmp/DAQSTREAM" 

#define READ_FILE_NAME  "write" 

#define SAMPL_FREQ 2000000UL

//#define FILE_NAME_WRITE  "/mnt/f4eHDDsata/tmp/adcData/write" // f42HDDsata ext4
#define FILE_NAME_WRITE  "./write" // f42HDDsata ext4 no journa//#define FILE_NAME_WRITE  "/mnt/SSDisk/tmp/DAQSTREAM/write" // f42HDDsata ext4 no journaling
#define INT_NAME_WRITE  "./intData" // f42HDDsata ext4 no journ//#define INT_NAME_WRITE  "/mnt/SSDisk/tmp/DAQSTREAM/intData" // f42HDDsata ext4 no journaling
//#define SAMPL_FREQ 2000000UL

// 1 s = 2000000 samp = 31250 * 64 = 6250
#define DMA_ACQ_SIZE (4096*1024) // 4194304B,  4Mb //(4096 * 100)

//#define N_SAMP_P_DMA (DMA_SIZE/NUM_CHAN_SMP/4)  // nr samples per buffer (IRQ)
#define DMA_N_CHAN 16 // nr of signal transferred on DMA packet(32 bit) 
#define ADC_N_CHAN 6 // nr of adc raw channel transferred (32 bit)
#define N_SAMP_P_DMA  (DMA_ACQ_SIZE/DMA_N_CHAN/4) 
#define N_DMA_PER_FILE 305// 10 s 3125

#define INT_DECIMATE 10

//#define DMA_PER_SEC (SAMPL_FREQ/SAMP_PER_DMA)  //~10  
//#define ACQ_SECS 10 // sec per cycles

#define CHAN_CHOP  14
#define CHOP_BIT_MASK 0x00000001

struct data_save_str {
    int adcData;
  //    int intData;
};

struct atca_data_str {
    int adcData[ADC_N_CHAN];
  //    long int intData[4];
     int intData[8];
};



