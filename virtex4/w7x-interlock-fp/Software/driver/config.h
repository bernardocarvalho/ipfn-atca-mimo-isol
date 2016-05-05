/*******************************/
/* Configuration of the driver */
/*******************************/

/* Enable/disable IRQ handling */ //#define ENABLE_IRQ

/* The name of the module */
//#define MODNAME "atca_ioc_int"

/* Major number is allocated dynamically */

/* Minor  number is ser equal to ATCA Slot Logical number  */
/**********************************************************************************
ATCA Slot Numbering on 14 slot Crates:
Physical | 1  | 2  | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 |
Logical  | 13 | 11 | 9 | 7 | 5 | 3 | 1 | 2 | 4 | 6  |  8 | 10 | 12 | 14 |
***********************************************************************************/

/* The number of available minor numbers */
#define MINOR_NUMBERS 14// 0xffff

/* Node name of the char device */
//#define NODENAME "atcaiopint-"
//#define NODENAMEFMT "atca_ioc_int%d"

//#define DRV_NAME "atca_ioc_int_stream"
#define NODENAMEFMT "atca_ioc_ilck%d"

#define DRV_NAME "atca_ioc_w7x_intrlck"

/* Maximum number of devices*/
#define MAXDEVICES 12

#define DMA_BUFFS   16    //Number of DMA Buffs

/* board PCI id */
#define PCI_DEVICE_ID_FPGA 0x0024 



