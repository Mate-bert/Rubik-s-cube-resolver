// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Sat Mar 29 13:29:47 2025
// Host        : LAPTOP-N4P3CLBG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design1_memory_reader_0_0_stub.v
// Design      : design1_memory_reader_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "memory_reader,Vivado 2019.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(i_clk, i_rst, i_go, i_done, o_cmd, o_new, bram_addr, 
  bram_clk, bram_din, bram_dout, bram_en, bram_rst, bram_we)
/* synthesis syn_black_box black_box_pad_pin="i_clk,i_rst,i_go,i_done,o_cmd[3:0],o_new,bram_addr[31:0],bram_clk,bram_din[31:0],bram_dout[31:0],bram_en,bram_rst,bram_we[3:0]" */;
  input i_clk;
  input i_rst;
  input i_go;
  input i_done;
  output [3:0]o_cmd;
  output o_new;
  output [31:0]bram_addr;
  output bram_clk;
  input [31:0]bram_din;
  output [31:0]bram_dout;
  output bram_en;
  output bram_rst;
  output [3:0]bram_we;
endmodule
