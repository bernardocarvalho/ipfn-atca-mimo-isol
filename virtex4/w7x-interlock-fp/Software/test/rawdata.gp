#!/usr/bin/env gnuplot
#
#
clear
# set term png
set term png enhanced font '/usr/share/fonts/liberation/LiberationSans-Regular.ttf' 12
set output 'rawdata.png'

#set xlabel 'Time (s)'
#set xlabel 'Samp'
set xlabel 'mSec'
#set ylabel 'Data / 2**17 LSB '
set ylabel 'Data /  LSB '
set title 'Raw Data 4Vpp second set of modules'
#set title 'Raw Data 5V '

set y2range [-1.1:1.1]
set y2tics nomirror
set ytics nomirror
#set yrange [-5000:-1000]
#set y2range [-2:2]

dfile='rawdata.bin'
cfile='chop.bin'
#
sampl_freq = 2000000.0
sampl_per = 0.0000005
scaleY= 1.0
#scaleY= 0.0001729
#scaleY= 1/2**17
plot_dec =100
# 200
firstl = 1
endl = 10000

# Channel 0 is no good on ATCA carrier board
#plot dfile binary format='%8int32' every plot_dec::firstl:0:endl  using ($0*1/2e3):(($1+374)*scaleY) with lines lt 1 lw 1  title 'Ch0', \

#IPP 15/06/2015
plot dfile binary format='%8int32' every plot_dec::firstl:0:endl  using ($0*1/2e3):(($1+374)*scaleY) with lines lt 1 lw 1  title 'Ch0', \
     dfile binary format='%8int32' every plot_dec::firstl:0:endl  using ($0/2e3):(($2+244)*scaleY) with lines lt 2 lw 1  title 'Ch1', \
     dfile binary format='%8int32' every plot_dec::firstl:0:endl  using ($0/2e3):(($3+179)*scaleY) with lines lt 3 lw 1 title 'Ch2', \
     dfile binary format='%8int32' every plot_dec::firstl:0:endl  using ($0/2e3):(($4+102)*scaleY) with lines lt 4 lw 1 title 'Ch3', \
     dfile binary format='%8int32' every plot_dec::firstl:0:endl  using ($0/2e3):(($5-109)*scaleY) with lines lt 5 lw 1 title 'Ch4', \
     dfile binary format='%8int32' every plot_dec::firstl:0:endl  using ($0/2e3):(($6+74)*scaleY) with lines lt 6 lw 2 title 'Ch5', \
     cfile binary format='%2int16' every plot_dec::firstl:0:endl  u ($0/2e3):($1*1.0) axis x1y2  w lines lt 0 t 'Phase'

#     dfile binary format='%8int32' every plot_dec::firstl:0:endl  using ($0/2e3):(($7+604)*scaleY) with lines lt 7 lw 2 title 'Ch6', \
#     dfile binary format='%8int32' every plot_dec::firstl:0:endl  using ($0/2e3):(($8+464)*scaleY) with lines lt 8 lw 2 title 'Ch7',\


#
#plot datafile binary format='%int' every plot_dec::firstl:0:endl  using ($0):($1) with lines lt 1 title 'data'


#     dfile binary format='%8int32' every plot_dec::firstl:0:endl  using ($0/2e3):(($9+703)*scaleY) w linesp lt 1   title 'Ch8',\
#     dfile binary format='%8int32' every plot_dec::firstl:0:endl  using ($0/2e3):(($10+612)*scaleY) w linesp lt 2  title 'Ch9',\


#set term x11

set term wxt
replot
pause -1 "Hit return to continue"
