#!/usr/bin/env gnuplot
#
#
clear
# set term png
set term png enhanced font '/usr/share/fonts/liberation/LiberationSans-Regular.ttf' 12
set output 'dac16Data.png'

#set xlabel 'Time (s)'
#set xlabel 'Samp'
set xlabel 'Time / mSec'

set title 'DAC 16 bit out Data'

dfile='dac16Data.bin'
cfile='chop.bin'
#
sampl_freq = 2000000.0
sampl_per = 0.0000005
scaleY= 1.0
#scaleY= 0.0001729 * sampl_per *1e3
set ylabel 'Data / LSB'
plot_dec =100
# 200
firstl = 1
endl = 20000

#IPP 15/06/2015

plot dfile binary format='%int16' every plot_dec::firstl:0:endl  using ($0/2e3):($1*scaleY) with lines lt 1  title 'DAC Ch 0'

#, \
#     cfile binary format='%2int16' every plot_dec::firstl:0:endl  using ($0/2e3):($1*500) with lines lt 2 title 'Phase'

#set term x11

set term wxt
replot
pause -1 "Hit return to continue"
