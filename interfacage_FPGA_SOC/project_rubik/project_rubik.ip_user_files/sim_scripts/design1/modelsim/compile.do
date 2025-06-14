vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_vip_v1_1_5
vlib modelsim_lib/msim/processing_system7_vip_v1_0_7
vlib modelsim_lib/msim/axi_bram_ctrl_v4_1_1
vlib modelsim_lib/msim/blk_mem_gen_v8_4_3
vlib modelsim_lib/msim/xlconstant_v1_1_6
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/proc_sys_reset_v5_0_13
vlib modelsim_lib/msim/smartconnect_v1_0

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_5 modelsim_lib/msim/axi_vip_v1_1_5
vmap processing_system7_vip_v1_0_7 modelsim_lib/msim/processing_system7_vip_v1_0_7
vmap axi_bram_ctrl_v4_1_1 modelsim_lib/msim/axi_bram_ctrl_v4_1_1
vmap blk_mem_gen_v8_4_3 modelsim_lib/msim/blk_mem_gen_v8_4_3
vmap xlconstant_v1_1_6 modelsim_lib/msim/xlconstant_v1_1_6
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 modelsim_lib/msim/proc_sys_reset_v5_0_13
vmap smartconnect_v1_0 modelsim_lib/msim/smartconnect_v1_0

vlog -work xilinx_vip -64 -incr -sv -L axi_vip_v1_1_5 -L processing_system7_vip_v1_0_7 -L smartconnect_v1_0 -L xilinx_vip "+incdir+C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/include" \
"C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_5 -L processing_system7_vip_v1_0_7 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ec67/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8c62/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/1ddd/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b2d0/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ip/design1_processing_system7_0_0" "+incdir+C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/include" \
"C:/Xilinx_2019/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx_2019/Vivado/2019.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx_2019/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx_2019/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ec67/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8c62/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/1ddd/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b2d0/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ip/design1_processing_system7_0_0" "+incdir+C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/design1/ip/design1_memory_reader_0_0/sim/design1_memory_reader_0_0.v" \
"../../../bd/design1/ip/design1_rubik_resolver_0_0/sim/design1_rubik_resolver_0_0.v" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ec67/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8c62/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/1ddd/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b2d0/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ip/design1_processing_system7_0_0" "+incdir+C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_5 -64 -incr -sv -L axi_vip_v1_1_5 -L processing_system7_vip_v1_0_7 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ec67/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8c62/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/1ddd/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b2d0/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ip/design1_processing_system7_0_0" "+incdir+C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/d4a8/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_7 -64 -incr -sv -L axi_vip_v1_1_5 -L processing_system7_vip_v1_0_7 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ec67/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8c62/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/1ddd/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b2d0/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ip/design1_processing_system7_0_0" "+incdir+C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8c62/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ec67/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8c62/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/1ddd/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b2d0/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ip/design1_processing_system7_0_0" "+incdir+C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/design1/ip/design1_processing_system7_0_0/sim/design1_processing_system7_0_0.v" \

vcom -work axi_bram_ctrl_v4_1_1 -64 -93 \
"../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/70bf/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design1/ip/design1_axi_bram_ctrl_0_0/sim/design1_axi_bram_ctrl_0_0.vhd" \

vlog -work blk_mem_gen_v8_4_3 -64 -incr "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ec67/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8c62/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/1ddd/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b2d0/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ip/design1_processing_system7_0_0" "+incdir+C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/c001/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ec67/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8c62/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/1ddd/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b2d0/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ip/design1_processing_system7_0_0" "+incdir+C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/design1/ip/design1_blk_mem_gen_0_0/sim/design1_blk_mem_gen_0_0.v" \

vlog -work xlconstant_v1_1_6 -64 -incr "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ec67/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8c62/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/1ddd/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b2d0/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ip/design1_processing_system7_0_0" "+incdir+C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/66e7/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ec67/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8c62/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/1ddd/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b2d0/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ip/design1_processing_system7_0_0" "+incdir+C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/design1/ip/design1_axi_smc_0/bd_0/ip/ip_0/sim/bd_f176_one_0.v" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -64 -93 \
"../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design1/ip/design1_axi_smc_0/bd_0/ip/ip_1/sim/bd_f176_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0 -64 -incr -sv -L axi_vip_v1_1_5 -L processing_system7_vip_v1_0_7 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ec67/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8c62/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/1ddd/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b2d0/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ip/design1_processing_system7_0_0" "+incdir+C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/1ddd/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/f85e/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_5 -L processing_system7_vip_v1_0_7 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ec67/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8c62/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/1ddd/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b2d0/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ip/design1_processing_system7_0_0" "+incdir+C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/design1/ip/design1_axi_smc_0/bd_0/ip/ip_2/sim/bd_f176_s00mmu_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -sv -L axi_vip_v1_1_5 -L processing_system7_vip_v1_0_7 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ec67/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8c62/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/1ddd/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b2d0/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ip/design1_processing_system7_0_0" "+incdir+C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ca72/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_5 -L processing_system7_vip_v1_0_7 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ec67/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8c62/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/1ddd/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b2d0/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ip/design1_processing_system7_0_0" "+incdir+C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/design1/ip/design1_axi_smc_0/bd_0/ip/ip_3/sim/bd_f176_s00tr_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -sv -L axi_vip_v1_1_5 -L processing_system7_vip_v1_0_7 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ec67/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8c62/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/1ddd/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b2d0/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ip/design1_processing_system7_0_0" "+incdir+C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/7de4/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_5 -L processing_system7_vip_v1_0_7 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ec67/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8c62/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/1ddd/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b2d0/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ip/design1_processing_system7_0_0" "+incdir+C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/design1/ip/design1_axi_smc_0/bd_0/ip/ip_4/sim/bd_f176_s00sic_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -sv -L axi_vip_v1_1_5 -L processing_system7_vip_v1_0_7 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ec67/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8c62/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/1ddd/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b2d0/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ip/design1_processing_system7_0_0" "+incdir+C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b89e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_5 -L processing_system7_vip_v1_0_7 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ec67/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8c62/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/1ddd/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b2d0/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ip/design1_processing_system7_0_0" "+incdir+C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/design1/ip/design1_axi_smc_0/bd_0/ip/ip_5/sim/bd_f176_s00a2s_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -sv -L axi_vip_v1_1_5 -L processing_system7_vip_v1_0_7 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ec67/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8c62/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/1ddd/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b2d0/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ip/design1_processing_system7_0_0" "+incdir+C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b2d0/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_5 -L processing_system7_vip_v1_0_7 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ec67/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8c62/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/1ddd/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b2d0/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ip/design1_processing_system7_0_0" "+incdir+C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/design1/ip/design1_axi_smc_0/bd_0/ip/ip_6/sim/bd_f176_sarn_0.sv" \
"../../../bd/design1/ip/design1_axi_smc_0/bd_0/ip/ip_7/sim/bd_f176_srn_0.sv" \
"../../../bd/design1/ip/design1_axi_smc_0/bd_0/ip/ip_8/sim/bd_f176_sawn_0.sv" \
"../../../bd/design1/ip/design1_axi_smc_0/bd_0/ip/ip_9/sim/bd_f176_swn_0.sv" \
"../../../bd/design1/ip/design1_axi_smc_0/bd_0/ip/ip_10/sim/bd_f176_sbn_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -sv -L axi_vip_v1_1_5 -L processing_system7_vip_v1_0_7 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ec67/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8c62/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/1ddd/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b2d0/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ip/design1_processing_system7_0_0" "+incdir+C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/7005/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_5 -L processing_system7_vip_v1_0_7 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ec67/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8c62/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/1ddd/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b2d0/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ip/design1_processing_system7_0_0" "+incdir+C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/design1/ip/design1_axi_smc_0/bd_0/ip/ip_11/sim/bd_f176_m00s2a_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -sv -L axi_vip_v1_1_5 -L processing_system7_vip_v1_0_7 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ec67/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8c62/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/1ddd/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b2d0/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ip/design1_processing_system7_0_0" "+incdir+C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b387/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -sv -L axi_vip_v1_1_5 -L processing_system7_vip_v1_0_7 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ec67/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8c62/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/1ddd/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b2d0/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ip/design1_processing_system7_0_0" "+incdir+C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/design1/ip/design1_axi_smc_0/bd_0/ip/ip_12/sim/bd_f176_m00e_0.sv" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ec67/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8c62/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/1ddd/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b2d0/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ip/design1_processing_system7_0_0" "+incdir+C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/design1/ip/design1_axi_smc_0/bd_0/sim/bd_f176.v" \
"../../../bd/design1/ip/design1_axi_smc_0/sim/design1_axi_smc_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design1/ip/design1_rst_ps7_0_50M_0/sim/design1_rst_ps7_0_50M_0.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ec67/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8c62/hdl" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/1ddd/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b2d0/hdl/verilog" "+incdir+../../../../project_rubik.srcs/sources_1/bd/design1/ip/design1_processing_system7_0_0" "+incdir+C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/design1/sim/design1.v" \

vlog -work xil_defaultlib \
"glbl.v"

