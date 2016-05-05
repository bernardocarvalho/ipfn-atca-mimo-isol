#!/usr/bin/env gnuplot
#
#
clear
# set term png
set term png enhanced font '/usr/share/fonts/liberation/LiberationSans-Regular.ttf' 12
set output 'intFdata.png'

#set xlabel 'Time (s)'
#set xlabel 'Samp'
set xlabel 'Time / mSec'

set title 'ADC integrated Data'

dfile='intFdata.bin'
cfile='chop.bin'
#
sampl_freq = 2000000.0
sampl_per = 0.0000005
scaleY= 1.0
#scaleY= 0.0001729 * sampl_per *1e3
#set ylabel 'Flux / mV.s'
set ylabel 'Sum / LSB'
plot_dec =1000
# 200
firstl = 1
endl = 2000000

#IPP 15/06/2015


plot dfile binary format='%6float32' every plot_dec::firstl:0:endl  using ($0*1/2e3):(($1)*scaleY) w l lt 1 lw 1 title 'Ch1:2 1-QXD31CE101', \
     dfile binary format='%6float32' every plot_dec::firstl:0:endl  using ($0/2e3):(($2)*scaleY) w l lt 2 lw 1  t 'Ch1:4 1-QXD31CE202', \
     dfile binary format='%6float32' every plot_dec::firstl:0:endl  using ($0/2e3):(($3)*scaleY) w l lt 3 lw 1 title 'Ch1:6 1-QXD31CE302', \
     dfile binary format='%6float32' every plot_dec::firstl:0:endl  using ($0/2e3):(($4)*scaleY) w l lt 4 lw 1 t 'Ch1:8 1-QXD31CE402'

#     cfile binary format='%2int16' every plot_dec::firstl:0:endl  u ($0/2e3):($1*1.0) axis x1y2  w lines lt 0 t 'Phase'

#, \
#     cfile binary format='%2int16' every plot_dec::firstl:0:endl  using ($0/2e3):($1*500) with lines lt 2 title 'Phase'

#set term x11

set term wxt
replot
pause -1 "Hit return to continue"