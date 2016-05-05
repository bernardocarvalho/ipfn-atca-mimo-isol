#!/usr/bin/env gnuplot
#
#
clear
# set term png
set term png enhanced font '/usr/share/fonts/liberation/LiberationSans-Regular.ttf' 12
set output 'data.png'

#set xlabel 'Time (s)'
set xlabel 'Sample'
set ylabel 'Amp (LSB)'
set title 'Raw Data'

#datafile='/mnt/SSDisk/tmp/DAQSTREAM/write-0.bin'
datafile='data.bin'
sampl_freq = 2000000.0
sampl_per = 0.0000005 
plot_dec = 200 
firstl = 1
endl = 100000

plot datafile binary format='%int' every plot_dec::firstl:0:endl  using ($0):($1) with lines lt 1 title 'data'
set term x11
#set term wxt
replot
pause -1 "Hit return to continue"

