#!/usr/bin/env gnuplot
#
#
# set term png
set term png enhanced font '/usr/share/fonts/liberation/LiberationSans-Regular.ttf' 12
#clear
shotnum ="38444"
set output 'isttokInt_'.shotnum.'.png'
#dfile='isttokInt_'.shotnum.'.bin'#cfile='chopZero.bin'
dfile='calcInt.bin'
#set title 'Integrated Data  \#'.shotnum

#set xlabel 'Time (s)'
#set xlabel 'Samp'
set xlabel 'mSec'
#set ylabel 'Amp (V.sec)'
set ylabel 'Amp (LSB x Sample)'

#
sampl_freq = 2e6
sampl_per = 1/2e6
scaleY= 1.0  
#scaleY= 0.0001729 * sampl_per
plot_dec = 20000
# 200 
firstl = 0000000
endl =   20000000

plot dfile binary format='%6float32' every plot_dec::firstl:0:endl  using ($0/2e3):(-($1)*scaleY) with lines lt 1 lw 1  title 'Ch1', \
     dfile binary format='%6float32' every plot_dec::firstl:0:endl  using ($0/2e3):(-($2)*scaleY) with lines lt 2 lw 1  title 'Ch12', \
     dfile binary format='%6float32' every plot_dec::firstl:0:endl  using ($0/2e3):(($3)*scaleY) with lines lt 3 lw 1 title 'Ch3', \
     dfile binary format='%6float32' every plot_dec::firstl:0:endl  using ($0/2e3):(-($4)*scaleY) with lines lt 4 lw 1 title 'Ch4', \
     dfile binary format='%6float32' every plot_dec::firstl:0:endl  using ($0/2e3):(($5)*scaleY) with lines lt 5 lw 1 title 'Ch5', \
     dfile binary format='%6float32' every plot_dec::firstl:0:endl  using ($0/2e3):(($6)*scaleY) with lines lt 6 lw 2 title 'Ch6'
#    dfile binary format='%6float32' every plot_dec::firstl:0:endl  using ($0/2e3):(($7)*scaleY) with lines lt 7 lw 2 title 'Ch7', \
#     dfile binary format='%6float32' every plot_dec::firstl:0:endl  using ($0/2e3):(($8)*scaleY) with lines lt 8 lw 2 title 'Ch8',\
#     dfile binary format='%10float32' every plot_dec::firstl:0:endl  u ($0/2e3):(($9)*scaleY) w linesp lt 1 lw 2 t 'Ch9',\
#     dfile binary format='%10float32' every plot_dec::firstl:0:endl  u ($0/2e3):(($10)*scaleY) w linesp lt 2 lw 2 t 'Ch10'



#set term wxt
set term x11
replot
pause -1 "Hit return to continue"
