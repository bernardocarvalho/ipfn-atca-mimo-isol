onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /RT_packet_gen_tb/trn_clk
add wave -noupdate /RT_packet_gen_tb/pio_reset_n
add wave -noupdate /RT_packet_gen_tb/ff_clk
add wave -noupdate -radix hexadecimal /RT_packet_gen_tb/command
add wave -noupdate /RT_packet_gen_tb/PCIe_dma_rd_en
add wave -noupdate -radix hexadecimal /RT_packet_gen_tb/int_decimate
add wave -noupdate /RT_packet_gen_tb/stream_on
add wave -noupdate /RT_packet_gen_tb/wordSync_n
add wave -noupdate /RT_packet_gen_tb/acq_on
add wave -noupdate /RT_packet_gen_tb/trigger_n
add wave -noupdate /RT_packet_gen_tb/adc_chop_dly
add wave -noupdate -radix hexadecimal /RT_packet_gen_tb/data_in_ch1
add wave -noupdate -radix hexadecimal /RT_packet_gen_tb/data_in_ch2
add wave -noupdate -radix hexadecimal /RT_packet_gen_tb/data_in_ch3
add wave -noupdate -radix hexadecimal /RT_packet_gen_tb/data_in_ch4
add wave -noupdate -radix hexadecimal /RT_packet_gen_tb/data_in_ch5
add wave -noupdate -radix hexadecimal /RT_packet_gen_tb/data_in_ch6
add wave -noupdate /RT_packet_gen_tb/reg_offset
add wave -noupdate /RT_packet_gen_tb/reg_data
add wave -noupdate /RT_packet_gen_tb/reg_wrt_en
add wave -noupdate /RT_packet_gen_tb/dma_ready
add wave -noupdate -radix hexadecimal /RT_packet_gen_tb/dma_data_out
add wave -noupdate -radix hexadecimal /RT_packet_gen_tb/dac_out
add wave -noupdate -radix decimal /RT_packet_gen_tb/data_in_ch1
add wave -noupdate -format Analog-Step -height 40 -max 131072.0 -radix decimal /RT_packet_gen_tb/data_in_ch1
add wave -noupdate -divider UUT
add wave -noupdate -radix hexadecimal {/RT_packet_gen_tb/uut/adc_int[0]}
add wave -noupdate -format Analog-Step -height 30 -max 245983999999.99997 -min -6591150000.0 -radix decimal {/RT_packet_gen_tb/uut/adc_int[0]}
add wave -noupdate -format Analog-Step -height 20 -max 18077800000.0 -min -13182700000.0 -radix decimal {/RT_packet_gen_tb/uut/adc_int[1]}
add wave -noupdate -radix hexadecimal /RT_packet_gen_tb/uut/data32_fifo_in
add wave -noupdate -divider DSP
add wave -noupdate -radix hexadecimal /RT_packet_gen_tb/uut/ff_clk_cnt
add wave -noupdate /RT_packet_gen_tb/uut/dsp_en_r
add wave -noupdate -radix hexadecimal -childformat {{{/RT_packet_gen_tb/uut/data_fp32[0]} -radix hexadecimal} {{/RT_packet_gen_tb/uut/data_fp32[1]} -radix hexadecimal} {{/RT_packet_gen_tb/uut/data_fp32[2]} -radix hexadecimal} {{/RT_packet_gen_tb/uut/data_fp32[3]} -radix hexadecimal} {{/RT_packet_gen_tb/uut/data_fp32[4]} -radix hexadecimal} {{/RT_packet_gen_tb/uut/data_fp32[5]} -radix hexadecimal}} -expand -subitemconfig {{/RT_packet_gen_tb/uut/data_fp32[0]} {-radix hexadecimal} {/RT_packet_gen_tb/uut/data_fp32[1]} {-radix hexadecimal} {/RT_packet_gen_tb/uut/data_fp32[2]} {-radix hexadecimal} {/RT_packet_gen_tb/uut/data_fp32[3]} {-radix hexadecimal} {/RT_packet_gen_tb/uut/data_fp32[4]} {-radix hexadecimal} {/RT_packet_gen_tb/uut/data_fp32[5]} {-radix hexadecimal}} /RT_packet_gen_tb/uut/data_fp32
add wave -noupdate -radix hexadecimal -childformat {{{/RT_packet_gen_tb/uut/DspMult_res[0]} -radix hexadecimal} {{/RT_packet_gen_tb/uut/DspMult_res[1]} -radix hexadecimal} {{/RT_packet_gen_tb/uut/DspMult_res[2]} -radix hexadecimal} {{/RT_packet_gen_tb/uut/DspMult_res[3]} -radix hexadecimal} {{/RT_packet_gen_tb/uut/DspMult_res[4]} -radix hexadecimal} {{/RT_packet_gen_tb/uut/DspMult_res[5]} -radix hexadecimal}} -expand -subitemconfig {{/RT_packet_gen_tb/uut/DspMult_res[0]} {-height 15 -radix hexadecimal} {/RT_packet_gen_tb/uut/DspMult_res[1]} {-height 15 -radix hexadecimal} {/RT_packet_gen_tb/uut/DspMult_res[2]} {-height 15 -radix hexadecimal} {/RT_packet_gen_tb/uut/DspMult_res[3]} {-height 15 -radix hexadecimal} {/RT_packet_gen_tb/uut/DspMult_res[4]} {-height 15 -radix hexadecimal} {/RT_packet_gen_tb/uut/DspMult_res[5]} {-height 15 -radix hexadecimal}} /RT_packet_gen_tb/uut/DspMult_res
add wave -noupdate -radix hexadecimal /RT_packet_gen_tb/uut/dataDspAdd
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {535000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 244
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
WaveRestoreZoom {390984 ps} {679016 ps}
