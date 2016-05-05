#!/bin/sh
TOP_FILE="W7X_INTLCK_FP"

# Clean up the results directory
rm -rf results
mkdir results

#Synthesize the Verilog Wrapper Files
echo 'Synthesizing verilog example design with XST';
xst -ifn $TOP_FILE.xst

mv $TOP_FILE.ngc ./results/

cd results

echo 'Running ngdbuild'
ngdbuild \
      -verbose \
      -uc ../$TOP_FILE.ucf \
      $TOP_FILE.ngc \
      -sd ../../ip_cores

echo 'Running map'
map \
  -timing \
  -ol high \
  -pr b \
  -o mapped.ncd \
  $TOP_FILE.ngd \
  mapped.pcf

echo 'Running par'
par \
  -ol high \
  -w mapped.ncd \
  routed.ncd \
  mapped.pcf

echo 'Running trce'
trce \
  -u \
  -v 100 \
  routed.ncd \
  mapped.pcf

echo 'Running design through netgen'
netgen  \
  -sim  \
  -ofmt verilog \
  -ne \
  -w \
  -tm $TOP_FILE \
  -sdf_path . \
  routed.ncd

echo 'Running design through bitgen'
bitgen \
  -w routed.ncd

cd ..
