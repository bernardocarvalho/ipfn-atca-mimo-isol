#!/bin/sh
# SVN keywords
# $Author: bernardo $
# $Date: 2014-12-30 17:31:23 +0000 (Tue, 30 Dec 2014) $
# $Revision: 6946 $
# $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_INTLCK_FP/Software/test/de_pack_gp.sh $
#
export GDFONTPATH="/usr/share/fonts/liberation/"
#echo '$1 = ' $1
#Place here the gnuplot executable. Must be version >= 4.4
#Place here the gnuplot executable. Must be version >= 4.4
#/opt/gnuplot4.6/bin/gnuplot << EOF # 
gnuplot << EOF # 
### taken from example
#http://softsolder.com/2009/06/02/displaing-variables-in-gnuplot/
#
# Only runs on gnuplot version >= 4.4
#http://www.linuxquestions.org/questions/linux-software-2/gnuplot-arial-font-replace-with-what-817479/
set title "$1"
#
datafile='intData.bin' 
#datafile2='channel_chp.bin' 
sampl_freq = 2000000.0
sampl_per = 1.0/sampl_freq # 0.0000005 
save_dec = 10 # WRITE_DEC_FACTOR same as in writer
plot_sampl_per = (save_dec * sampl_per)

set term png enhanced font 'LiberationSans-Regular.ttf' 12
set output 'dspInt4.png'
set xlabel 'Time (s)'

#set title  'Chanel Data EO corrected re-inverted'
#set ylabel 'Drift /LSB*s'
set grid xtics ytics 

start_time = 0 #1.44208 #0008 #  in seconds
end_time = 1.0  # in seconds
plot_dec = int ((end_time - start_time) * sampl_freq / save_dec / 2048.0)
print "plot_dec ", plot_dec
Vs_scale = 1 # ( 0.0001729 * sampl_per )
set ylabel 'Data / (a.u)'
set y2label 'Data / (LSB)'
#FACTOR=0.2248
#set y2range [FACTOR*GPVAL_Y_MIN : FACTOR*GPVAL_Y_MAX]
#set y2range [ -32768 : 32768] # DAC 16 bit signed range
set y2tics nomirror
set ytics nomirror
#set yrange [-5000:-1000]
#set y2range [-2:2]

#firstl = 0
firstl = (sampl_freq /save_dec * start_time) 
endl = (sampl_freq /save_dec * end_time) 
#endl = 100000
#sampl_per = (0.0000005  * save_dec) 

#plot   datafile binary format="%int%float%float%float" every plot_dec::firstl:0:endl  \
#     using  (\$0 * plot_sampl_per):(\$2  ) with lines lt 2 axes x1y2 title '(Float  data_fp32[0])'

#plot datafile binary format="%int" every plot_dec::firstl:0:endl:0  \
#

#set label 1 sprintf("wo = %2.4f lsb", wo_pre) at wo_time,0
#plot datafile binary format='%int32%int32%int32%int32%int32%int32%int32%int32%int32%int32%int32' every plot_dec::firstl:0:endl  using ($0*scaleX):($1) with li
#plot datafile binary format='%2int16%3float' every plot_dec::firstl:0:endl  \
#     using  (\$0 * plot_sampl_per):(\$2  ) with lines lt 1 title '(Int dac_2compl_i  Chan 1)', \
#    datafile binary format="%2int16%3float" every plot_dec::firstl:0:endl  \
#     using  (\$0 * plot_sampl_per):(\$4 *1.1 ) with lines lt 2    title '(Float  data_fp32[0])', \
#    datafile binary format="%2int16%3float" every plot_dec::firstl:0:endl  \
#     using  (\$0 * plot_sampl_per):(\$1  ) with lines lt 3 axes x1y2 title '(Int 16 DAC out)', \

#plot datafile binary format='%2int16%3float' every plot_dec::firstl:0:endl  \
#3     using  (\$0 * plot_sampl_per):(\$2 ) with lines lt 1 title '(Int16 data_fp32  Chan 0)'

plot    datafile binary format="%2int16%3float" every plot_dec::firstl:0:endl  \
     using  (\$0 * plot_sampl_per):(\$3 *1.1 ) with lines lt 2   title '(Float  data_fp32[0])', \
    datafile binary format="%2int16%3float" every plot_dec::firstl:0:endl  \
     u  (\$0 * plot_sampl_per):(\$4 *1.2 ) w l lt 3  t '(Float  dspMult_res[0])', \
    datafile binary format="%2int16%3float" every plot_dec::firstl:0:endl  \
     u  (\$0 * plot_sampl_per):(\$5 * 1.0  ) with lines lt 4 axes x1y1  title '(Float  dataDspAdd[5] )'

#    datafile binary format="%int%2int16%3float" every plot_dec::firstl:0:endl  \
#     using  (\$0 * plot_sampl_per):(\$5  ) with lines lt 3 axes x1y2 title '(Float  dspMult_res[0] )', \
#, \
#    datafile binary format="%int%float%float%float" every plot_dec::firstl:0:endl  \
#     using  (\$0 * plot_sampl_per):(\$3  ) with lines lt 3 axes x1y2 title '(Float  dspMult_res[0] )', \
#    datafile binary format="%int%float%float%float" every plot_dec::firstl:0:endl  \
#     using  (\$0 * plot_sampl_per):(\$4  ) with lines lt 4 axes x1y2 title '(Float  dataDspAdd[5] )'
     
set term x11 persist

replot
pause -1 "Hit return to continue"
EOF
