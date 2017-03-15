#!/usr/bin/env gnuplot
#
#
# W7X_INTLCK_FP Project
# SVN keywords
#  $Author: bernardo $
#  $Date: 2017-03-01 17:21:32 +0100 (Wed, 01 Mar 2017) $
#  $Revision: 9944 $
#  $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_INTLCK_FP/Software/apps/acqDataProc.gp $
#
clear

#set xlabel 'Time (s)'
set xlabel 'Samp'
#set xlabel 'mSec'
#set ylabel 'Amp (V)'
#set ylabel 'Int (LSB * s)'
set ylabel 'Int (LSB * sample)'
set y2label 'Chop Phase'
#set ytics 1e-3 nomirror tc lt 1
set y2tics 10 nomirror tc lt 2
set y2range [-1:20]

set title 'W7X INTLCK FP INTEG ADC Datai 02/03/2017'

dfile='intFdata.bin'
cfile='chopdata.bin'
#
sampl_freq = 2000000.0
sampl_per = 0.0000005 
#scaleY= sampl_per
scaleY= 1.0
#scaleY= 0.0001729
plot_dec =413

firstl = 1
endl = 2e7

set term unknown
#plot 'datafile' u 1:2  #collect information on our data
plot dfile binary format='%6float32' every ::firstl:0:endl  using ($0):(($1)*scaleY) 
FACTOR =1.2
set yrange [FACTOR*GPVAL_Y_MIN : FACTOR*GPVAL_Y_MAX]

#set yrange [-1e-3 : 1e-3]
# set term png
set term png enhanced font '/usr/share/fonts/liberation/LiberationSans-Regular.ttf' 12
set output 'acqDataInt.png'

plot dfile binary format='%6float32' every plot_dec::firstl:0:endl  using ($0*1):(($1)*scaleY) with lines lt 1 lw 1  title 'Ch0', \
     dfile binary format='%6float32' every plot_dec::firstl:0:endl  using ($0*1):(($2)*scaleY) with lines lt 2 lw 1  title 'Ch1', \
     dfile binary format='%6float32' every plot_dec::firstl:0:endl  using ($0*1):(($3)*scaleY) with lines lt 3 lw 1 title 'Ch2', \
     dfile binary format='%6float32' every plot_dec::firstl:0:endl  using ($0*1):(($4)*scaleY) with lines lt 4 lw 1 title 'Ch3', \
     cfile binary format='%2int16' every plot_dec::firstl:0:endl  using ($0):($1) with lines lt 10 lw 3 title 'Ph' axes x1y2

     #dfile binary format='%6float32' every plot_dec::firstl:0:endl  using ($0*1):(($5)*scaleY) with lines lt 5 lw 1 title 'Ch4', \
     #dfile binary format='%6float32' every plot_dec::firstl:0:endl  using ($0*1):(($6)*scaleY) with lines lt 6 lw 2 title 'Ch5', \
#plot datafile binary format='%int' every plot_dec::firstl:0:endl  using ($0):($1) with lines lt 1 title 'data'

set term x11
#set term wxt
replot
pause -1 "Hit return to continue"
