/**
 *
 * @file calcInt.c
 * @author Bernardo Carvalho
 * @date 2015-06-30
 * @brief program module to calc Integral   data from ATCA IOC board (Version IPP) saved Data
  *
 *
 * Change History:
 *
 * Revision 1.0 2015-06-30
 * 	Initial adaptation form adcReadRT.c 
 *
 * SVN keywords
 * $Author: bernardo $
 * $Date: 2015-04-09 17:55:21 +0100 (Thu, 09 Apr 2015) $
 * $Revision: 7300 $
 * $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_INTLCK_FP/Software/test/getOffsets.c $
 */

//#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
//#include <signal.h>
#include <unistd.h>
#include <fcntl.h>
//#include <sys/ioctl.h>
#include <errno.h>
#include <time.h>
#include <math.h>
#include <libconfig.h>


int64_t timespecDiff(struct timespec *timeA_p, struct timespec *timeB_p){
  return ((timeA_p->tv_sec * 1000000000UL) + timeA_p->tv_nsec) -
    ((timeB_p->tv_sec * 1000000000UL) + timeB_p->tv_nsec);
}

int main (int argc, char** argv){
  //int retval = 0;
  //char str[64];//, write_file_name[64];
  config_t cfg, *cf;
  
  config_setting_t *setting;
  const char *file_name = NULL;

  cf = &cfg;
  config_init(&cfg);
  //int32_t * dmaBuff; //user space buffer for data
  FILE * fd_data, * fd_chop, * fd_int;  
  int  data, i, k, m, chop_val;;
  int   dataCfg;
  int adc_n_chans=1;
  unsigned long int skipNSamples = 0;
  unsigned long int readNSamples = 1;

  int * adcData;//[ADC_N_CHAN];
  int * eo_offset;//[ADC_N_CHAN];
  float  *  wo_offset; //[ADC_N_CHAN];
  //unsigned int tmp;
  //uint8_t selectedCard = 3;

  float * adcInt;
  long int * adcEOSum;
  long int * adcRawSum;
  float fval;

// [ADC_N_CHAN] ;
  //  long int * intCalcOff ;
  //double offSets[ADC_N_CHAN];

  /*
  if(argc > 3){
    chop_prd = atoi(argv[3]); // CHOP_MAX_CNT
  }

  if(argc > 2){
    readNSamples = atoi(argv[2]);
  }

  if(argc > 1){
    skipNSamples = atoi(argv[1]);
  }
  */
  //  else{
  if(argc != 2){
    printf("%s configFile\n", argv[0]);  
    return -1;
  }

  if (!config_read_file(&cfg,argv[1])) {
    fprintf(stderr, "%s:%d - %s\n", argv[1],
	    //          config_error_file(cf),
            config_error_line(cf),
            config_error_text(cf));
    config_destroy(cf);
    return(EXIT_FAILURE);
  }
 
  if (config_lookup_string(&cfg, "raw_filename", &file_name))
    printf("file: %s\n", file_name);
  else {
    printf("No raw_filename param: %s\n", file_name);
    return(EXIT_FAILURE);
  }

  //  fd_data =  fopen("isttokV1.bin","rb");  
  fd_data =  fopen(file_name,"rb");  
  if(fd_data==NULL){
    printf("Error  %d, OPEN %s\n", errno, file_name);
    exit(1);
  }
 
  if (config_lookup_string(&cfg, "chop_filename", &file_name))
    printf("chop_filename : %s\n", file_name);
  else {
    printf("No chop_filename param: %s\n", file_name);
    return(EXIT_FAILURE);
  }

  fd_chop =  fopen(file_name,"rb");  
  if(fd_chop==NULL){
    printf("Error  %d, OPEN %s\n", errno, file_name);
    exit(1);
  }

  if (config_lookup_string(&cfg, "integral_filename", &file_name))
    printf("file: %s\n", file_name);
  else {
    printf("No integral_filename param: \n");
    return(EXIT_FAILURE);
  }
  
  fd_int =  fopen(file_name,"wb");  
  if(fd_int==NULL){
    printf("Error  %d, OPEN %s\n", errno, file_name);
    exit(1);
  }

  //  fd_int =  fopen("isttokInt.bin","wb");  

  //  fseek(fd_data, skipNSamples * sizeof(int) * adc_n_chans, SEEK_SET);
  //fseek(fd_chop, skipNSamples * sizeof(int), SEEK_SET);
  
  if (config_lookup_int(&cfg, "adc_num_channels", &dataCfg)){
   adc_n_chans=dataCfg;
    printf("adc_num_channels= %d\n", adc_n_chans);
  }
 else {
    printf("adc_num_channels is not defined\n");
    return(EXIT_FAILURE);
  }

  if (config_lookup_int(&cfg, "skip_N_namples", &dataCfg)){
    skipNSamples=dataCfg;
    //    printf("dataCfg = %ld\n", skipNSamples);
  }
  else {
    printf("skip_N_namples is not defined\n");
    return(EXIT_FAILURE);
  }
  
  if (config_lookup_int(&cfg, "read_N_samples", &dataCfg)){
    readNSamples=dataCfg;
    //    printf("dataCfg = %ld\n", readNSamples);
  }
  else {
    printf("read_N_samples is not defined\n");
    return(EXIT_FAILURE);
  }
  
  fseek(fd_data, skipNSamples * sizeof(int) * adc_n_chans, SEEK_SET);
  fseek(fd_chop, skipNSamples * sizeof(int), SEEK_SET);
  
  eo_offset= (int *) calloc (adc_n_chans, sizeof(int));
  wo_offset= (float *)calloc (adc_n_chans, sizeof(float));

  setting = config_lookup(&cfg, "adc_modules.eo_offsets");
  data = config_setting_length(setting);
  //  printf("data %d \n", data);

  if (data!=adc_n_chans) {
    printf("adc_n_chans is not the same as number of eo offset params\n");
    return(EXIT_FAILURE);
  }

  printf("Config EO coefs: ");
  for (i = 0; i < adc_n_chans; i++) {
    eo_offset[i] =   config_setting_get_int_elem(setting, i);   
    //    printf("\t#%d. %d\n",i, eo_offset[i]);
   printf(" %d, ", eo_offset[i]);
  }    
  printf("\n");

  setting = config_lookup(&cfg, "adc_modules.wo_offsets");
  data = config_setting_length(setting);

  if (data!=adc_n_chans) {
    printf("adc_n_chans is not the same as number of wo offset params\n");
    return(EXIT_FAILURE);
  }

  printf("Config WO coef: ");
  for (i = 0; i < adc_n_chans; i++) {
    wo_offset[i] =   config_setting_get_float_elem(setting, i);   
    printf(" %f, ", wo_offset[i]);
  }    
  printf("\n");

  adcInt  = (float *)calloc (adc_n_chans, sizeof(float));
  adcEOSum  = (long int *)calloc (adc_n_chans, sizeof(long int));
  adcRawSum  = (long int *)calloc (adc_n_chans, sizeof(long int));
  

  adcData= (int *) malloc(adc_n_chans * sizeof (int));

  for(k=0; k < readNSamples; k++) {
    fread(adcData, sizeof(int), adc_n_chans, fd_data);
    fread(&chop_val, sizeof(int), 1, fd_chop);
    for (m=0; m < adc_n_chans; m++){
      data = adcData[m]; 
      adcRawSum[m] += (long int)data;

      data -= eo_offset[m]; // Correct EO offset;
      if((chop_val & 0x1))
	adcEOSum[m] += data;
      else
	adcEOSum[m] -= data;

      adcInt[m] = (float)adcEOSum[m];
      adcInt[m] -=  wo_offset[m]*k;
    }
    fwrite(adcInt, sizeof(float), adc_n_chans, fd_int);
  }
  printf("k=%d\n",k);

  printf("\n");

  printf("Last Int: ");
  for (m=0; m < adc_n_chans; m++){
    printf("%f, ", adcInt[m]);
  }  

  printf("\nCALC EO offsets: ");
  for (m=0; m < adc_n_chans; m++){
    fval=((float) adcRawSum[m])/readNSamples;
    printf("%ld, ", lroundf(fval));

  }  
  // printf("\n");

  printf("\nCALC WO offsets: ");
  for (m=0; m < adc_n_chans; m++){
    //    offSets[m] = 1.0 * ((double)adcSum[m]);
    //intCalcOff[m] = dmaBuff[(SAMP_PER_DMA-1) * N_CHAN + ADC_N_CHAN + m];
    printf("%f, ",   (float)adcEOSum[m]/readNSamples);//, offSets[m],  offSets[m] / readNSamples);
    //    printf("chan %d: %f, %f, %lf, %lf \n", m, adcCalcOff[m], adcCalcOff[m]/readNSamples, offSets[m],  offSets[m] / readNSamples);
  }
  printf("\n");

  fclose(fd_data);   fclose(fd_chop);   fclose(fd_int); 
  free(eo_offset); free(wo_offset); free(adcData); free(adcInt);  free(adcRawSum);  free(adcEOSum);
  config_destroy(&cfg);
  return(EXIT_SUCCESS);
}
  
