@set xilinx_path=e:\Xilinx\14.7\ISE_DS\ISE\bin\nt
@set top_file=W7X_STREAM_DAQ

rem Clean up the results directory
rmdir /S /Q results
mkdir results

echo 'Synthesizing HDL example design with XST';
%xilinx_path%\xst -ifn %top_file%.xst -ofn %top_file%.log

REM copy %top_file%.log xst.srp

if not exist %top_file%.ngc %xilinx_path%\netgen -sim -ofmt verilog -ne -w -tm %top_file% %top_file%.ngc

copy %top_file%.ngc .\results\

cd results

echo 'Running ngdbuild'
%xilinx_path%\ngdbuild -verbose -uc ../%top_file%.ucf %top_file%.ngc -sd ../../ip_cores
 
 echo 'Running map'
%xilinx_path%\map -u -timing -ol high -xe c -pr b -o mapped.ncd -t 1 %top_file%.ngd mapped.pcf
REM see results on  mapped.mrp

echo 'Running par'
%xilinx_path%\par -ol high -xe c -w mapped.ncd routed.ncd mapped.pcf
REM see results on routed.par

echo 'Running trce'
%xilinx_path%\trce -u -v 100 routed.ncd mapped.pcf

echo 'Running design through netgen'
REM for Simulation
%xilinx_path%\netgen -sim -ofmt verilog -ne -w -tm %top_file% -sdf_path . routed.ncd

echo 'Running design through bitgen'
%xilinx_path%\bitgen -w routed.ncd

cd ..
