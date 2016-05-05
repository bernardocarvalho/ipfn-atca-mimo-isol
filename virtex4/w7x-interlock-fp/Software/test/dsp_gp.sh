#!/bin/sh
# SVN keywords
# $Author: bernardo $
# $Date: 2014-12-30 17:31:23 +0000 (Tue, 30 Dec 2014) $
# $Revision: 6946 $
# $URL: http://metis.ipfn.ist.utl.pt:8888/svn/cdaq/ATCA/ATCA-IO-CONTROL/IPP/W7X_                    INTLCK_FP/Software/test/de_pack_gp.sh $
#
export GDFONTPATH="/usr/share/fonts/liberation/"
#echo '$1 = ' $1
#Place here the gnuplot executable. Must be version >= 4.4
#Place here the gnuplot executable. Must be version >= 4.4
/usr/bin/gnuplot << EOF #
#/opt/gnuplot4.6/bin/gnuplot <<EOF
# EOF #
### taken from example
#http://softsolder.com/2009/06/02/displaing-variables-in-gnuplot/
#
# Only runs on gnuplot version >= 4.4
#http://www.linuxquestions.org/questions/linux-software-2/gnuplot-arial-font-rep                    lace-with-what-817479/
set title "$1"
#
datafile='intData.bin'
#datafile2='channel_chp.bin'
sampl_freq = 2000000.0
sampl_per = 1.0/sampl_freq # 0.0000005
save_dec = 1 # WRITE_DEC_FACTOR same as in writer
plot_sampl_per = (save_dec * sampl_per)


set term png enhanced font 'LiberationSans-Regular.ttf' 12
set output 'dsp.png'
set xlabel 'Time (s)'
#set title 'Data Integral Drift test 270Ohms module C2AI22KF100KCYSN2'
#set title 'sine 100mHz 42pp module C2AI22KF100KCYSN2, HOLD 4 samples'

#set title  'Chanel Data EO corrected re-inverted'
#set ylabel 'Drift /LSB*s'
set grid xtics ytics

start_time = 0 #1.44208 #0008 #  in seconds
end_time = 0.5  # in seconds
plot_dec = int ((end_time - start_time) * sampl_freq / save_dec / 2048.0)
print "plot_dec ", plot_dec
Vs_scale = 1 # ( 0.0001729 * sampl_per )
set ylabel 'Data / LSB'
#set yrange [-5000:-1000]
set y2range [-2:2]

#firstl = 0
firstl = (sampl_freq /save_dec * start_time)
endl = (sampl_freq /save_dec * end_time)
#endl = 100000
#sampl_per = (0.0000005  * save_dec)

#plot data binary format="%int" every 100 u ($0 * 0.0000005):($1 * 0.0001729 * 0                    .0000005 * 1000000) with lines lt 1 title 'Channel  1'
#plot 'channel_data.bin' binary format="%int" every plot_dec::firstl::endl  \
#     using   ($0 * 0.0000005):($1 * 0.0001729 * 0.0000005 * 1000000) with lines
#plot datafile binary format="%int" every plot_dec::firstl:0:endl:0  \
#

#set label 1 sprintf("wo = %2.4f lsb", wo_pre) at wo_time,0
plot datafile binary format="%float" every plot_dec::firstl:0:endl  \
     using  (\$0 * plot_sampl_per):(\$1  ) with lines lt 1 title 'DSP Data'
#    datafile2 binary format="%int" every plot_dec::firstl:0:endl  \
#     using  (\$0 * plot_sampl_per):(\$1) with lines lt 2 axes x1y2 title 'Chop'

#     using  ($0 * plot_sampl_per):($1 * Vs_scale) with lines lt 1 title 'Chan 1                    '

set term x11 persist

replot
pause -1 "Hit return to continue"
EOF

EOF