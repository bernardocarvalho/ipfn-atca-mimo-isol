/* sin example */
#include <stdio.h>      /* printf */
#include <math.h>       /* sin, pow, floor, etc */

#define PI 3.14159265
#define N_POINTS 90

int main ()
{
  int i, vali;
  FILE * fd_data;
  double param, signal, result;

  fd_data =  fopen("sinus32bHex.txt","w");            /*Test if can open files t*/
  //  printf ("Size of float %ld int %ld \n", sizeof(float), sizeof(int));
  for(i=0; i < N_POINTS; i++){
    param = i*4;
    /*Signal range -1.0 to + 1.0*/
    signal = sin(param*PI/180) ;
    /*Signal scaled to ADC range (sign bit + 17 bit) */
    result = signal * pow(2.0,17.0);
    /*Signed Integer scaled to ADC range */
    vali=floor(result + 0.5);
    //    printf ("The sine of %f degrees is %f, %f %d 0x%8.8X \n", param, result, signal,  vali, vali );
    /*Signal saved in  32 bithexadecimal format */
    fprintf(fd_data,"%8.8X\n", vali);
  }
  fclose(fd_data);
  return 0;
}

