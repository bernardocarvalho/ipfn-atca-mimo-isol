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
set ylabel 'DSP values'
#set y2label 'Chop Phase'
#set ytics 1e-3 nomirror tc lt 1
#set y2tics 10 nomirror tc lt 2
#set y2range [-1:20]

set title 'W7X INTLCK FP DSP Data 22/06/2017'

dfile='dspData.bin'
#cfile='chopdata.bin'
#
sampl_freq = 2000000.0
sampl_per = 0.0000005
#scaleY= sampl_per
scaleY= 1.0
#scaleY= 0.0001729
plot_dec =413

firstl = 1
endl = 2e5

set term unknown
#plot 'datafile' u 1:2  #collect information on our data
plot dfile binary format='%float32' every ::firstl:0:endl  using ($0):(($1)*scaleY)
FACTOR =1.2
set yrange [FACTOR*GPVAL_Y_MIN : FACTOR*GPVAL_Y_MAX]

#set yrange [-1e-3 : 1e-3]
# set term png
set term png enhanced font '/usr/share/fonts/liberation/LiberationSans-Regular.ttf' 12
set output 'acqDataDsp.png'

plot dfile binary format='%float32' every plot_dec::firstl:0:endl  using ($0*1):(($1)*scaleY) with lines lt 1 lw 1  title 'DSP val'

set term x11
#set term wxt
replot
pause -1 "Hit return to continue"

