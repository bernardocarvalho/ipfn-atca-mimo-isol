#!/usr/bin/env gnuplot
#
#
# W7X_INTLCK_FP Project
# SVN keywords
#  $Author: bernardo $
#  $Date: 2017-03-02 13:05:18 +0000 (Thu, 02 Mar 2017) $
#  $Revision: 9960 $
#  $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_INTLCK_FP/Software/apps/acqDataProc.gp $
#
clear
# set term png
set term png enhanced font '/usr/share/fonts/liberation/LiberationSans-Regular.ttf' 12
set output 'acqDataProc.png'

#set xlabel 'Time (s)'
#set xlabel 'Samp'
set xlabel 'mSec'
#set ylabel 'Amp (V)'
set ylabel 'Amp (LSB)'
set title 'W7X_INTLCK_FP Raw ADC Data'

dfile='rawdata.bin'
cfile='chopdata.bin'
#
sampl_freq = 2000000.0
sampl_per = 0.0000005 
scaleY= 1.0
#scaleY= 0.0001729
plot_dec =113
# 200 
firstl = 1
endl = 10000

plot dfile binary format='%6int32' every plot_dec::firstl:0:endl  using ($0*1):(($1)*scaleY) with lines lt 1 lw 1  title 'Ch0', \
     dfile binary format='%6int32' every plot_dec::firstl:0:endl  using ($0*1):(($2)*scaleY) with lines lt 2 lw 1  title 'Ch1', \
     dfile binary format='%6int32' every plot_dec::firstl:0:endl  using ($0*1):(($3)*scaleY) with lines lt 3 lw 1 title 'Ch2', \
     dfile binary format='%6int32' every plot_dec::firstl:0:endl  using ($0*1):(($4)*scaleY) with lines lt 4 lw 1 title 'Ch3', \
     dfile binary format='%6int32' every plot_dec::firstl:0:endl  using ($0*1):(($5)*scaleY) with lines lt 5 lw 1 title 'Ch4', \
     dfile binary format='%6int32' every plot_dec::firstl:0:endl  using ($0*1):(($6)*scaleY) with lines lt 6 lw 2 title 'Ch5', \
     cfile binary format='%2int16' every plot_dec::firstl:0:endl  using ($0*1):($1*5) with lines lt 10 title 'Ph'

#plot datafile binary format='%int' every plot_dec::firstl:0:endl  using ($0):($1) with lines lt 1 title 'data'


set term x11
#set term wxt
replot
pause -1 "Hit return to continue"
