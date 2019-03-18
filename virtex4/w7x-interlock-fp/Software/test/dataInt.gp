#!/usr/bin/env gnuplot
#
#
clear
# set term png
set term png enhanced font '/usr/share/fonts/liberation/LiberationSans-Regular.ttf' 12
set output 'dataInt.png'

#set xlabel 'Time (s)'
set xlabel 'Time (s)'
set ylabel 'int [LSB*Sample]'
set title 'Integral Data'

datafile='../apps/intFdata.bin'
sampl_freq = 2000000.0
sampl_per = 0.0000005 
plot_dec = 1000 
save_decimate=200
scaleX=save_decimate/2e6
scaleY=( 0.0001729 * sampl_per )
firstl = 0
endl = 1000000
print "scaleY= ", scaleY, ' (V.s)'

#fmt='%int32%int32%int32%int32'
#fmt=format='%int32%int32%int32%int32%int32%int32%int32%int32%int32%int32%int32'
#plot datafile binary format='%int32%int32%int32%int32%int32%int32%int32%int32%int32%int32%int32' every plot_dec::firstl:0:endl  using ($0*scaleX):($1) with lines lt 1 title 'Ch0', \
# channel 0 no good
plot   datafile binary format='%int32%int32%int32%int32%int32%int32%int32%int32%int32%int32%int32' every plot_dec::firstl:0:endl  using ($0*scaleX):($2) with lines lt 2 title 'Ch1', \
      datafile binary format='%int32%int32%int32%int32%int32%int32%int32%int32%int32%int32%int32' every plot_dec::firstl:0:endl  using ($0*scaleX):($3) with lines lt 6 title 'Ch2', \
      datafile binary format='%int32%int32%int32%int32%int32%int32%int32%int32%int32%int32%int32' every plot_dec::firstl:0:endl  using ($0*scaleX):($4) with lines lt 6 title 'Ch3', \
      datafile binary format='%int32%int32%int32%int32%int32%int32%int32%int32%int32%int32%int32' every plot_dec::firstl:0:endl  using ($0*scaleX):($5) with lines lt 7 title 'Ch4'
#
#     datafile binary format='%int32%int32%int32%int32%int32%int32%int32%int32%int32%int32%int32' every plot_dec::firstl:0:endl  using ($0*scaleX):($6) with lines lt 4 title 'Ch5', \
#      datafile binary format='%int32%int32%int32%int32%int32%int32%int32%int32%int32%int32%int32' every plot_dec::firstl:0:endl  using ($0*scaleX):($7) with lines lt 5 title 'Ch6', \
#      datafile binary format='%int32%int32%int32%int32%int32%int32%int32%int32%int32%int32%int32' every plot_dec::firstl:0:endl  using ($0*scaleX):($8) with lines lt 6 title 'Ch7', \
#      datafile binary format='%int32%int32%int32%int32%int32%int32%int32%int32%int32%int32%int32' every plot_dec::firstl:0:endl  using ($0*scaleX):($9) with lines lt 7 title 'Ch8'



set term x11
#set term wxt
replot
pause -1 "Hit return to continue"

