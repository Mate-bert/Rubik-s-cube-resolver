-makelib ies_lib/xilinx_vip -sv \
  "C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "C:/Xilinx_2019/Vivado/2019.1/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "C:/Xilinx_2019/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx_2019/Vivado/2019.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "C:/Xilinx_2019/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "C:/Xilinx_2019/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design1/ip/design1_memory_reader_0_0/sim/design1_memory_reader_0_0.v" \
  "../../../bd/design1/ip/design1_rubik_resolver_0_0/sim/design1_rubik_resolver_0_0.v" \
-endlib
-makelib ies_lib/axi_infrastructure_v1_1_0 \
  "../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_vip_v1_1_5 -sv \
  "../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/d4a8/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib ies_lib/processing_system7_vip_v1_0_7 -sv \
  "../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8c62/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design1/ip/design1_processing_system7_0_0/sim/design1_processing_system7_0_0.v" \
-endlib
-makelib ies_lib/axi_bram_ctrl_v4_1_1 \
  "../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/70bf/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design1/ip/design1_axi_bram_ctrl_0_0/sim/design1_axi_bram_ctrl_0_0.vhd" \
-endlib
-makelib ies_lib/blk_mem_gen_v8_4_3 \
  "../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/c001/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design1/ip/design1_blk_mem_gen_0_0/sim/design1_blk_mem_gen_0_0.v" \
-endlib
-makelib ies_lib/xlconstant_v1_1_6 \
  "../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/66e7/hdl/xlconstant_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design1/ip/design1_axi_smc_0/bd_0/ip/ip_0/sim/bd_f176_one_0.v" \
-endlib
-makelib ies_lib/lib_cdc_v1_0_2 \
  "../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/proc_sys_reset_v5_0_13 \
  "../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design1/ip/design1_axi_smc_0/bd_0/ip/ip_1/sim/bd_f176_psr_aclk_0.vhd" \
-endlib
-makelib ies_lib/smartconnect_v1_0 -sv \
  "../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/1ddd/hdl/sc_util_v1_0_vl_rfs.sv" \
  "../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/f85e/hdl/sc_mmu_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "../../../bd/design1/ip/design1_axi_smc_0/bd_0/ip/ip_2/sim/bd_f176_s00mmu_0.sv" \
-endlib
-makelib ies_lib/smartconnect_v1_0 -sv \
  "../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/ca72/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "../../../bd/design1/ip/design1_axi_smc_0/bd_0/ip/ip_3/sim/bd_f176_s00tr_0.sv" \
-endlib
-makelib ies_lib/smartconnect_v1_0 -sv \
  "../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/7de4/hdl/sc_si_converter_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "../../../bd/design1/ip/design1_axi_smc_0/bd_0/ip/ip_4/sim/bd_f176_s00sic_0.sv" \
-endlib
-makelib ies_lib/smartconnect_v1_0 -sv \
  "../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b89e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "../../../bd/design1/ip/design1_axi_smc_0/bd_0/ip/ip_5/sim/bd_f176_s00a2s_0.sv" \
-endlib
-makelib ies_lib/smartconnect_v1_0 -sv \
  "../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b2d0/hdl/sc_node_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "../../../bd/design1/ip/design1_axi_smc_0/bd_0/ip/ip_6/sim/bd_f176_sarn_0.sv" \
  "../../../bd/design1/ip/design1_axi_smc_0/bd_0/ip/ip_7/sim/bd_f176_srn_0.sv" \
  "../../../bd/design1/ip/design1_axi_smc_0/bd_0/ip/ip_8/sim/bd_f176_sawn_0.sv" \
  "../../../bd/design1/ip/design1_axi_smc_0/bd_0/ip/ip_9/sim/bd_f176_swn_0.sv" \
  "../../../bd/design1/ip/design1_axi_smc_0/bd_0/ip/ip_10/sim/bd_f176_sbn_0.sv" \
-endlib
-makelib ies_lib/smartconnect_v1_0 -sv \
  "../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/7005/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "../../../bd/design1/ip/design1_axi_smc_0/bd_0/ip/ip_11/sim/bd_f176_m00s2a_0.sv" \
-endlib
-makelib ies_lib/smartconnect_v1_0 -sv \
  "../../../../project_rubik.srcs/sources_1/bd/design1/ipshared/b387/hdl/sc_exit_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "../../../bd/design1/ip/design1_axi_smc_0/bd_0/ip/ip_12/sim/bd_f176_m00e_0.sv" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design1/ip/design1_axi_smc_0/bd_0/sim/bd_f176.v" \
  "../../../bd/design1/ip/design1_axi_smc_0/sim/design1_axi_smc_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design1/ip/design1_rst_ps7_0_50M_0/sim/design1_rst_ps7_0_50M_0.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design1/sim/design1.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

