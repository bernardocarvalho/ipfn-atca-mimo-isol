#!/usr/bin/env gnuplot
#
#
clear
# set term png
set term png enhanced font '/usr/share/fonts/liberation/LiberationSans-Regular.ttf' 12
set output 'timeInt.png'

#set xlabel 'Time (s)'
set xlabel 'Time (s)'
set ylabel 'packet No'
set yrange [-1:220000]
set ytics  nomirror tc lt 1
set y2label 'uSecTime'
set y2tics 2e6 nomirror tc lt 2
set y2range [0:2e7]
set title 'uSec Time'

datafile='dataInt.bin'
sampl_freq = 2000000.0
sampl_per = 0.0000005 
plot_dec = 10 
save_decimate=200
scaleX=save_decimate/2e6
scaleY=( 0.0001729 * sampl_per )
firstl = 0
endl = 1000000
print "scaleY= ", scaleY, ' (V.s)'


plot datafile binary format='%int32%int32%int32%int32%int32%int32%int32%int32%int32%int32%int32' every plot_dec::firstl:0:endl  using ($0*scaleX):($10) with lines lt 1 title 'Num', \
     datafile binary format='%int32%int32%int32%int32%int32%int32%int32%int32%int32%int32%int32' every plot_dec::firstl:0:endl  using ($0*scaleX):($11) with lines lt 2 axes x1y2 title 'Time'



set term x11
#set term wxt
replot
pause -1 "Hit return to continue"

