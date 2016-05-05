onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/CK
add wave -noupdate /testbench/RST
add wave -noupdate -radix hexadecimal /testbench/Ain
add wave -noupdate -radix hexadecimal /testbench/Bin
add wave -noupdate -radix hexadecimal /testbench/S
add wave -noupdate -radix decimal /testbench/Ain
add wave -noupdate -radix decimal /testbench/Bin
add wave -noupdate -radix decimal /testbench/S
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {123210 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {210 ns}
