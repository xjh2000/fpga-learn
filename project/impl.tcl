#Generated by Fabric Compiler ( version 2021.4-SP1.2 <build 96435> ) at Fri Feb 10 16:09:09 2023

remove_design -verilog "C:/Users/93462/PdsProject/fpga-learn/rtl/flow_ledN.v"
add_design "C:/Users/93462/PdsProject/fpga-learn/rtl/Present.v"
add_design "C:/Users/93462/PdsProject/fpga-learn/sim/Present_tb.v"
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module test
remove_design -verilog "C:/Users/93462/PdsProject/fpga-learn/sim/Present_tb.v"
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module Present
remove_simulation "C:/Users/93462/PdsProject/fpga-learn/sim/PresentRound_tb.v"
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module Present
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module Present
remove_design -verilog "C:/Users/93462/PdsProject/fpga-learn/rtl/Present.v"
remove_design -verilog "C:/Users/93462/PdsProject/fpga-learn/rtl/PresentRound.v"
add_design "C:/Users/93462/PdsProject/fpga-learn/rtl/Present.v"
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module Present
synthesize -ads -selected_syn_tool_opt 2 
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module Present
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module Present
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 
remove_design -verilog "C:/Users/93462/PdsProject/fpga-learn/rtl/Present.v"
add_design "C:/Users/93462/PdsProject/fpga-learn/rtl/PresentFpga.v"
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 
add_constraint "C:/Users/93462/PdsProject/fpga-learn/project/present.fdc"
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 
add_fic "C:/Users/93462/PdsProject/fpga-learn/project/synthesize/PresentFpga_syn.fic"
remove_constraint  -logic -fdc "C:/Users/93462/PdsProject/fpga-learn/project/present.fdc"
remove_fic "C:/Users/93462/PdsProject/fpga-learn/project/synthesize/PresentFpga_syn.fic"
add_constraint "C:/Users/93462/PdsProject/fpga-learn/project/present.fdc"
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
add_fic "C:/Users/93462/PdsProject/fpga-learn/project/synthesize/PresentFpga_syn.fic"
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 
add_simulation "C:/Users/93462/PdsProject/fpga-learn/sim/Present_tb.v"
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 
gen_bit_stream 
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
dev_map 
pnr 
pnr 
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
synthesize -ads -selected_syn_tool_opt 2 
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
synthesize -ads -selected_syn_tool_opt 2 
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
dev_map 
pnr 
report_timing 
gen_bit_stream 
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 
add_design "C:/Users/93462/PdsProject/fpga-learn/rtl/uart_loopback_top.v"
remove_design -verilog "C:/Users/93462/PdsProject/fpga-learn/rtl/PresentFpga.v"
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module uart_loopback_top
synthesize -ads -selected_syn_tool_opt 2 
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
remove_fic "C:/Users/93462/PdsProject/fpga-learn/project/synthesize/PresentFpga_syn.fic"
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module uart_loopback_top
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 
remove_design -verilog "C:/Users/93462/PdsProject/fpga-learn/rtl/uart_loopback_top.v"
add_design "C:/Users/93462/PdsProject/fpga-learn/rtl/PresentFpga.v"
add_design "C:/Users/93462/PdsProject/fpga-learn/rtl/pLayer.v"
add_design "C:/Users/93462/PdsProject/fpga-learn/rtl/Present.v"
add_design "C:/Users/93462/PdsProject/fpga-learn/rtl/PresentRound.v"
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
remove_design -verilog "C:/Users/93462/PdsProject/fpga-learn/rtl/PresentFpga.v"
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module Present
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module Present
remove_design -verilog "C:/Users/93462/PdsProject/fpga-learn/rtl/PresentRound.v"
remove_design -verilog "C:/Users/93462/PdsProject/fpga-learn/rtl/pLayer.v"
remove_design -verilog "C:/Users/93462/PdsProject/fpga-learn/rtl/Present.v"
add_design "C:/Users/93462/PdsProject/fpga-learn/rtl/PresentFpga.v"
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 
add_fic "C:/Users/93462/PdsProject/fpga-learn/project/synthesize/PresentFpga_syn.fic"
gen_bit_stream 
pnr 
dev_map 
pnr 
report_timing 
gen_bit_stream 
dev_map 
add_design "C:/Users/93462/PdsProject/fpga-learn/rtl/uart_loopback_top.v"
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
dev_map 
dev_map 
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 
gen_bit_stream 
dev_map 
pnr 
report_timing 
gen_bit_stream 
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
pnr 
report_timing 
gen_bit_stream 
dev_map 
pnr 
report_timing 
gen_bit_stream 
set_arch -family Logos -device PGL22G -speedgrade -6 -package MBG324
compile -top_module PresentFpga
synthesize -ads -selected_syn_tool_opt 2 
dev_map 
dev_map 
pnr 
report_timing 
gen_bit_stream 
