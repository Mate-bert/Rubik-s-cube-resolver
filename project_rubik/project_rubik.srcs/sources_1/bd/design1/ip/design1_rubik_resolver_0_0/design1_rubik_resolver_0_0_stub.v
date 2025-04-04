// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Sat Mar 29 13:29:48 2025
// Host        : LAPTOP-N4P3CLBG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {C:/Users/mateo/OneDrive -
//               ozixe/Bureau/Cours/projet_rubik/projet_rubik/project_rubik/project_rubik.srcs/sources_1/bd/design1/ip/design1_rubik_resolver_0_0/design1_rubik_resolver_0_0_stub.v}
// Design      : design1_rubik_resolver_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "rubik_resolver,Vivado 2019.1" *)
module design1_rubik_resolver_0_0(i_clk, i_rst, i_cmd, i_new, o_done, o_done_temp, 
  o_m1, o_m2, o_m3, o_m4, o_m5, o_m6, o_leds)
/* synthesis syn_black_box black_box_pad_pin="i_clk,i_rst,i_cmd[3:0],i_new,o_done,o_done_temp,o_m1[3:0],o_m2[3:0],o_m3[3:0],o_m4[3:0],o_m5[3:0],o_m6[3:0],o_leds[3:0]" */;
  input i_clk;
  input i_rst;
  input [3:0]i_cmd;
  input i_new;
  output o_done;
  output o_done_temp;
  output [3:0]o_m1;
  output [3:0]o_m2;
  output [3:0]o_m3;
  output [3:0]o_m4;
  output [3:0]o_m5;
  output [3:0]o_m6;
  output [3:0]o_leds;
endmodule
