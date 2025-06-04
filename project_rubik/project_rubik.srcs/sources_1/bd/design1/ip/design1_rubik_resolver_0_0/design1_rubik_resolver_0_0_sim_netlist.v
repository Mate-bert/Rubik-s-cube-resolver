// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Sun May 18 19:00:42 2025
// Host        : LAPTOP-N4P3CLBG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/workspace/rubik/project_rubik/project_rubik.srcs/sources_1/bd/design1/ip/design1_rubik_resolver_0_0/design1_rubik_resolver_0_0_sim_netlist.v
// Design      : design1_rubik_resolver_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design1_rubik_resolver_0_0,rubik_resolver,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "rubik_resolver,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module design1_rubik_resolver_0_0
   (i_clk,
    i_rst,
    i_cmd,
    i_new,
    o_done,
    o_m1,
    o_m2,
    o_m3,
    o_m4,
    o_m5,
    o_m6,
    o_leds);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 i_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME i_clk, ASSOCIATED_RESET i_rst, FREQ_HZ 50000000, PHASE 0.000, CLK_DOMAIN design1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input i_clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 i_rst RST" *) (* x_interface_parameter = "XIL_INTERFACENAME i_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input i_rst;
  input [3:0]i_cmd;
  input i_new;
  output o_done;
  output [3:0]o_m1;
  output [3:0]o_m2;
  output [3:0]o_m3;
  output [3:0]o_m4;
  output [3:0]o_m5;
  output [3:0]o_m6;
  output [3:0]o_leds;

  wire i_clk;
  wire [3:0]i_cmd;
  wire i_new;
  wire i_rst;
  wire o_done;
  wire [3:0]o_m1;
  wire [3:0]o_m2;
  wire [3:0]o_m3;
  wire [3:0]o_m4;
  wire [3:0]o_m5;
  wire [3:0]o_m6;

  assign o_leds[3:0] = i_cmd;
  design1_rubik_resolver_0_0_rubik_resolver U0
       (.i_clk(i_clk),
        .i_cmd(i_cmd),
        .i_new(i_new),
        .i_rst(i_rst),
        .o_done(o_done),
        .o_m1(o_m1),
        .o_m2(o_m2),
        .o_m3(o_m3),
        .o_m4(o_m4),
        .o_m5(o_m5),
        .o_m6(o_m6));
endmodule

(* ORIG_REF_NAME = "rubik_resolver" *) 
module design1_rubik_resolver_0_0_rubik_resolver
   (o_m1,
    o_m2,
    o_m3,
    o_m4,
    o_m5,
    o_m6,
    o_done,
    i_new,
    i_clk,
    i_cmd,
    i_rst);
  output [3:0]o_m1;
  output [3:0]o_m2;
  output [3:0]o_m3;
  output [3:0]o_m4;
  output [3:0]o_m5;
  output [3:0]o_m6;
  output o_done;
  input i_new;
  input i_clk;
  input [3:0]i_cmd;
  input i_rst;

  wire \FSM_sequential_s_state[0]_i_1_n_0 ;
  wire \FSM_sequential_s_state[0]_i_2_n_0 ;
  wire \FSM_sequential_s_state[0]_i_3_n_0 ;
  wire \FSM_sequential_s_state[0]_i_4_n_0 ;
  wire \FSM_sequential_s_state[1]_i_1_n_0 ;
  wire \FSM_sequential_s_state[2]_i_1_n_0 ;
  wire \FSM_sequential_s_state[2]_i_2_n_0 ;
  wire \FSM_sequential_s_state[2]_i_3_n_0 ;
  wire \FSM_sequential_s_state[2]_i_4_n_0 ;
  wire \FSM_sequential_s_state[2]_i_5_n_0 ;
  wire \FSM_sequential_s_state[3]_i_1_n_0 ;
  wire \FSM_sequential_s_state[3]_i_2_n_0 ;
  wire \FSM_sequential_s_state[3]_i_3_n_0 ;
  wire \FSM_sequential_s_state[3]_i_4_n_0 ;
  wire \FSM_sequential_s_state[3]_i_5_n_0 ;
  wire \FSM_sequential_s_state[4]_i_1_n_0 ;
  wire \FSM_sequential_s_state[4]_i_2_n_0 ;
  wire \FSM_sequential_s_state[4]_i_3_n_0 ;
  wire \FSM_sequential_s_state[4]_i_4_n_0 ;
  wire \FSM_sequential_s_state[4]_i_5_n_0 ;
  wire \FSM_sequential_s_state[4]_i_6_n_0 ;
  wire \FSM_sequential_s_state[4]_i_7_n_0 ;
  wire \FSM_sequential_s_state[4]_i_8_n_0 ;
  wire \FSM_sequential_s_state[4]_i_9_n_0 ;
  wire i_clk;
  wire [3:0]i_cmd;
  wire i_new;
  wire i_rst;
  wire o_done;
  wire [3:0]o_m1;
  wire \o_m1[0]_i_1_n_0 ;
  wire \o_m1[2]_i_1_n_0 ;
  wire \o_m1[3]_i_1_n_0 ;
  wire \o_m1[3]_i_2_n_0 ;
  wire [3:0]o_m2;
  wire \o_m2[0]_i_1_n_0 ;
  wire \o_m2[2]_i_1_n_0 ;
  wire \o_m2[3]_i_1_n_0 ;
  wire \o_m2[3]_i_2_n_0 ;
  wire [3:0]o_m3;
  wire \o_m3[0]_i_1_n_0 ;
  wire \o_m3[2]_i_1_n_0 ;
  wire \o_m3[3]_i_1_n_0 ;
  wire \o_m3[3]_i_2_n_0 ;
  wire [3:0]o_m4;
  wire \o_m4[0]_i_1_n_0 ;
  wire \o_m4[1]_i_1_n_0 ;
  wire \o_m4[2]_i_1_n_0 ;
  wire \o_m4[3]_i_1_n_0 ;
  wire \o_m4[3]_i_2_n_0 ;
  wire [3:0]o_m5;
  wire \o_m5[0]_i_1_n_0 ;
  wire \o_m5[3]_i_1_n_0 ;
  wire \o_m5[3]_i_2_n_0 ;
  wire [3:0]o_m6;
  wire \o_m6[0]_i_1_n_0 ;
  wire \o_m6[1]_i_1_n_0 ;
  wire \o_m6[2]_i_1_n_0 ;
  wire \o_m6[3]_i_1_n_0 ;
  wire p_0_in;
  wire \s_cmd_d_reg_n_0_[0] ;
  wire \s_cmd_d_reg_n_0_[1] ;
  wire \s_cmd_d_reg_n_0_[2] ;
  wire [3:0]s_cpt_loop;
  wire \s_cpt_loop[3]_i_3_n_0 ;
  wire \s_cpt_loop[3]_i_4_n_0 ;
  wire \s_cpt_loop[3]_i_5_n_0 ;
  wire \s_cpt_loop[3]_i_6_n_0 ;
  wire \s_cpt_loop[3]_i_7_n_0 ;
  wire \s_cpt_loop[3]_i_8_n_0 ;
  wire \s_cpt_loop[3]_i_9_n_0 ;
  wire [3:0]s_cpt_loop_0;
  wire \s_cpt_loop_reg[3]_i_1_n_0 ;
  wire \s_cpt_phase[0]_i_10_n_0 ;
  wire \s_cpt_phase[0]_i_11_n_0 ;
  wire \s_cpt_phase[0]_i_1_n_0 ;
  wire \s_cpt_phase[0]_i_3_n_0 ;
  wire \s_cpt_phase[0]_i_4_n_0 ;
  wire \s_cpt_phase[0]_i_5_n_0 ;
  wire \s_cpt_phase[0]_i_6_n_0 ;
  wire \s_cpt_phase[0]_i_7_n_0 ;
  wire \s_cpt_phase[0]_i_8_n_0 ;
  wire \s_cpt_phase[0]_i_9_n_0 ;
  wire [31:0]s_cpt_phase_reg;
  wire \s_cpt_phase_reg[0]_i_2_n_0 ;
  wire \s_cpt_phase_reg[0]_i_2_n_1 ;
  wire \s_cpt_phase_reg[0]_i_2_n_2 ;
  wire \s_cpt_phase_reg[0]_i_2_n_3 ;
  wire \s_cpt_phase_reg[0]_i_2_n_4 ;
  wire \s_cpt_phase_reg[0]_i_2_n_5 ;
  wire \s_cpt_phase_reg[0]_i_2_n_6 ;
  wire \s_cpt_phase_reg[0]_i_2_n_7 ;
  wire \s_cpt_phase_reg[12]_i_1_n_0 ;
  wire \s_cpt_phase_reg[12]_i_1_n_1 ;
  wire \s_cpt_phase_reg[12]_i_1_n_2 ;
  wire \s_cpt_phase_reg[12]_i_1_n_3 ;
  wire \s_cpt_phase_reg[12]_i_1_n_4 ;
  wire \s_cpt_phase_reg[12]_i_1_n_5 ;
  wire \s_cpt_phase_reg[12]_i_1_n_6 ;
  wire \s_cpt_phase_reg[12]_i_1_n_7 ;
  wire \s_cpt_phase_reg[16]_i_1_n_0 ;
  wire \s_cpt_phase_reg[16]_i_1_n_1 ;
  wire \s_cpt_phase_reg[16]_i_1_n_2 ;
  wire \s_cpt_phase_reg[16]_i_1_n_3 ;
  wire \s_cpt_phase_reg[16]_i_1_n_4 ;
  wire \s_cpt_phase_reg[16]_i_1_n_5 ;
  wire \s_cpt_phase_reg[16]_i_1_n_6 ;
  wire \s_cpt_phase_reg[16]_i_1_n_7 ;
  wire \s_cpt_phase_reg[20]_i_1_n_0 ;
  wire \s_cpt_phase_reg[20]_i_1_n_1 ;
  wire \s_cpt_phase_reg[20]_i_1_n_2 ;
  wire \s_cpt_phase_reg[20]_i_1_n_3 ;
  wire \s_cpt_phase_reg[20]_i_1_n_4 ;
  wire \s_cpt_phase_reg[20]_i_1_n_5 ;
  wire \s_cpt_phase_reg[20]_i_1_n_6 ;
  wire \s_cpt_phase_reg[20]_i_1_n_7 ;
  wire \s_cpt_phase_reg[24]_i_1_n_0 ;
  wire \s_cpt_phase_reg[24]_i_1_n_1 ;
  wire \s_cpt_phase_reg[24]_i_1_n_2 ;
  wire \s_cpt_phase_reg[24]_i_1_n_3 ;
  wire \s_cpt_phase_reg[24]_i_1_n_4 ;
  wire \s_cpt_phase_reg[24]_i_1_n_5 ;
  wire \s_cpt_phase_reg[24]_i_1_n_6 ;
  wire \s_cpt_phase_reg[24]_i_1_n_7 ;
  wire \s_cpt_phase_reg[28]_i_1_n_1 ;
  wire \s_cpt_phase_reg[28]_i_1_n_2 ;
  wire \s_cpt_phase_reg[28]_i_1_n_3 ;
  wire \s_cpt_phase_reg[28]_i_1_n_4 ;
  wire \s_cpt_phase_reg[28]_i_1_n_5 ;
  wire \s_cpt_phase_reg[28]_i_1_n_6 ;
  wire \s_cpt_phase_reg[28]_i_1_n_7 ;
  wire \s_cpt_phase_reg[4]_i_1_n_0 ;
  wire \s_cpt_phase_reg[4]_i_1_n_1 ;
  wire \s_cpt_phase_reg[4]_i_1_n_2 ;
  wire \s_cpt_phase_reg[4]_i_1_n_3 ;
  wire \s_cpt_phase_reg[4]_i_1_n_4 ;
  wire \s_cpt_phase_reg[4]_i_1_n_5 ;
  wire \s_cpt_phase_reg[4]_i_1_n_6 ;
  wire \s_cpt_phase_reg[4]_i_1_n_7 ;
  wire \s_cpt_phase_reg[8]_i_1_n_0 ;
  wire \s_cpt_phase_reg[8]_i_1_n_1 ;
  wire \s_cpt_phase_reg[8]_i_1_n_2 ;
  wire \s_cpt_phase_reg[8]_i_1_n_3 ;
  wire \s_cpt_phase_reg[8]_i_1_n_4 ;
  wire \s_cpt_phase_reg[8]_i_1_n_5 ;
  wire \s_cpt_phase_reg[8]_i_1_n_6 ;
  wire \s_cpt_phase_reg[8]_i_1_n_7 ;
  wire s_done_i_1_n_0;
  wire s_done_i_2_n_0;
  wire s_done_i_3_n_0;
  wire s_done_i_4_n_0;
  wire s_done_i_5_n_0;
  wire s_done_i_6_n_0;
  wire s_done_i_7_n_0;
  wire s_next_phase;
  wire s_next_phase_i_1_n_0;
  wire s_start_cnt_phase;
  wire s_start_cnt_phase_i_1_n_0;
  wire s_start_cnt_phase_reg_n_0;
  wire [4:0]s_state;
  wire [3:3]\NLW_s_cpt_phase_reg[28]_i_1_CO_UNCONNECTED ;

  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hFEC2)) 
    \FSM_sequential_s_state[0]_i_1 
       (.I0(\FSM_sequential_s_state[0]_i_2_n_0 ),
        .I1(s_state[3]),
        .I2(s_state[4]),
        .I3(\FSM_sequential_s_state[0]_i_3_n_0 ),
        .O(\FSM_sequential_s_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F355FF00F300AA)) 
    \FSM_sequential_s_state[0]_i_2 
       (.I0(s_state[2]),
        .I1(s_done_i_4_n_0),
        .I2(p_0_in),
        .I3(s_state[0]),
        .I4(s_state[1]),
        .I5(\FSM_sequential_s_state[0]_i_4_n_0 ),
        .O(\FSM_sequential_s_state[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h00DF)) 
    \FSM_sequential_s_state[0]_i_3 
       (.I0(s_done_i_4_n_0),
        .I1(p_0_in),
        .I2(s_state[1]),
        .I3(s_state[0]),
        .O(\FSM_sequential_s_state[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h000000002AA80000)) 
    \FSM_sequential_s_state[0]_i_4 
       (.I0(p_0_in),
        .I1(\s_cmd_d_reg_n_0_[1] ),
        .I2(\s_cmd_d_reg_n_0_[2] ),
        .I3(\s_cmd_d_reg_n_0_[0] ),
        .I4(i_new),
        .I5(s_state[0]),
        .O(\FSM_sequential_s_state[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h003FFFC03F00C0FE)) 
    \FSM_sequential_s_state[1]_i_1 
       (.I0(s_state[2]),
        .I1(s_state[3]),
        .I2(s_state[4]),
        .I3(s_state[1]),
        .I4(p_0_in),
        .I5(s_state[0]),
        .O(\FSM_sequential_s_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEC2FEFEFEC2C2C2)) 
    \FSM_sequential_s_state[2]_i_1 
       (.I0(\FSM_sequential_s_state[2]_i_2_n_0 ),
        .I1(s_state[3]),
        .I2(s_state[4]),
        .I3(\FSM_sequential_s_state[2]_i_3_n_0 ),
        .I4(s_state[2]),
        .I5(\FSM_sequential_s_state[2]_i_4_n_0 ),
        .O(\FSM_sequential_s_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h268ADD55268A8800)) 
    \FSM_sequential_s_state[2]_i_2 
       (.I0(s_state[2]),
        .I1(s_state[0]),
        .I2(s_done_i_4_n_0),
        .I3(p_0_in),
        .I4(s_state[1]),
        .I5(\FSM_sequential_s_state[2]_i_5_n_0 ),
        .O(\FSM_sequential_s_state[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h3CC4)) 
    \FSM_sequential_s_state[2]_i_3 
       (.I0(s_done_i_4_n_0),
        .I1(s_state[1]),
        .I2(s_state[0]),
        .I3(p_0_in),
        .O(\FSM_sequential_s_state[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h4333)) 
    \FSM_sequential_s_state[2]_i_4 
       (.I0(s_done_i_4_n_0),
        .I1(s_state[1]),
        .I2(p_0_in),
        .I3(s_state[0]),
        .O(\FSM_sequential_s_state[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00004440AEEEAAAA)) 
    \FSM_sequential_s_state[2]_i_5 
       (.I0(s_state[0]),
        .I1(i_new),
        .I2(\s_cmd_d_reg_n_0_[1] ),
        .I3(\s_cmd_d_reg_n_0_[2] ),
        .I4(\s_cmd_d_reg_n_0_[0] ),
        .I5(p_0_in),
        .O(\FSM_sequential_s_state[2]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h0FCA00CA)) 
    \FSM_sequential_s_state[3]_i_1 
       (.I0(\FSM_sequential_s_state[3]_i_2_n_0 ),
        .I1(\FSM_sequential_s_state[3]_i_3_n_0 ),
        .I2(s_state[3]),
        .I3(s_state[4]),
        .I4(\FSM_sequential_s_state[3]_i_4_n_0 ),
        .O(\FSM_sequential_s_state[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h400040000CFF0C00)) 
    \FSM_sequential_s_state[3]_i_2 
       (.I0(s_done_i_4_n_0),
        .I1(s_state[0]),
        .I2(p_0_in),
        .I3(s_state[2]),
        .I4(\FSM_sequential_s_state[3]_i_5_n_0 ),
        .I5(s_state[1]),
        .O(\FSM_sequential_s_state[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h37DDCFAA)) 
    \FSM_sequential_s_state[3]_i_3 
       (.I0(s_state[2]),
        .I1(p_0_in),
        .I2(s_done_i_4_n_0),
        .I3(s_state[1]),
        .I4(s_state[0]),
        .O(\FSM_sequential_s_state[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h4030000F)) 
    \FSM_sequential_s_state[3]_i_4 
       (.I0(s_done_i_4_n_0),
        .I1(p_0_in),
        .I2(\FSM_sequential_s_state[4]_i_5_n_0 ),
        .I3(s_state[1]),
        .I4(s_state[0]),
        .O(\FSM_sequential_s_state[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h000000000C640000)) 
    \FSM_sequential_s_state[3]_i_5 
       (.I0(p_0_in),
        .I1(\s_cmd_d_reg_n_0_[1] ),
        .I2(\s_cmd_d_reg_n_0_[2] ),
        .I3(\s_cmd_d_reg_n_0_[0] ),
        .I4(i_new),
        .I5(s_state[0]),
        .O(\FSM_sequential_s_state[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h3F003F003F007F01)) 
    \FSM_sequential_s_state[4]_i_1 
       (.I0(s_state[1]),
        .I1(s_state[3]),
        .I2(s_state[4]),
        .I3(s_next_phase),
        .I4(s_state[2]),
        .I5(s_state[0]),
        .O(\FSM_sequential_s_state[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBF8CBFBFBF8CBCBC)) 
    \FSM_sequential_s_state[4]_i_2 
       (.I0(\FSM_sequential_s_state[4]_i_3_n_0 ),
        .I1(\FSM_sequential_s_state[4]_i_4_n_0 ),
        .I2(\FSM_sequential_s_state[4]_i_5_n_0 ),
        .I3(\FSM_sequential_s_state[4]_i_6_n_0 ),
        .I4(s_state[1]),
        .I5(s_state[0]),
        .O(\FSM_sequential_s_state[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hC0A0C0A0000F0000)) 
    \FSM_sequential_s_state[4]_i_3 
       (.I0(\FSM_sequential_s_state[4]_i_7_n_0 ),
        .I1(\FSM_sequential_s_state[4]_i_8_n_0 ),
        .I2(s_state[3]),
        .I3(s_state[1]),
        .I4(\FSM_sequential_s_state[4]_i_9_n_0 ),
        .I5(s_state[2]),
        .O(\FSM_sequential_s_state[4]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \FSM_sequential_s_state[4]_i_4 
       (.I0(s_state[3]),
        .I1(s_state[4]),
        .O(\FSM_sequential_s_state[4]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h5D)) 
    \FSM_sequential_s_state[4]_i_5 
       (.I0(s_state[4]),
        .I1(s_state[2]),
        .I2(s_state[3]),
        .O(\FSM_sequential_s_state[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF6FFF)) 
    \FSM_sequential_s_state[4]_i_6 
       (.I0(s_state[0]),
        .I1(p_0_in),
        .I2(s_cpt_loop[3]),
        .I3(s_cpt_loop[2]),
        .I4(s_cpt_loop[0]),
        .I5(s_cpt_loop[1]),
        .O(\FSM_sequential_s_state[4]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_sequential_s_state[4]_i_7 
       (.I0(s_state[0]),
        .I1(p_0_in),
        .O(\FSM_sequential_s_state[4]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hA8AAAAAA00000000)) 
    \FSM_sequential_s_state[4]_i_8 
       (.I0(s_state[0]),
        .I1(s_cpt_loop[1]),
        .I2(s_cpt_loop[0]),
        .I3(s_cpt_loop[2]),
        .I4(s_cpt_loop[3]),
        .I5(p_0_in),
        .O(\FSM_sequential_s_state[4]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h000000000CC40000)) 
    \FSM_sequential_s_state[4]_i_9 
       (.I0(p_0_in),
        .I1(\s_cmd_d_reg_n_0_[2] ),
        .I2(\s_cmd_d_reg_n_0_[1] ),
        .I3(\s_cmd_d_reg_n_0_[0] ),
        .I4(i_new),
        .I5(s_state[0]),
        .O(\FSM_sequential_s_state[4]_i_9_n_0 ));
  (* FSM_ENCODED_STATES = "m4_p2:01111,m4_p1:10000,m3_p4:01001,m5_p3:10010,m5_p2:10011,m1_p3:00010,m5_p1:10100,m1_p2:00011,m4_p4:01101,m1_p1:00100,m6_p3:10110,m3_p3:01010,m6_p2:10111,idle:00000,m3_p2:01011,m2_p3:00110,m6_p4:10101,m2_p2:00111,m6_p1:11000,m5_p4:10001,m3_p1:01100,m2_p4:00101,m2_p1:01000,m4_p3:01110,m1_p4:00001" *) 
  FDRE \FSM_sequential_s_state_reg[0] 
       (.C(i_clk),
        .CE(\FSM_sequential_s_state[4]_i_1_n_0 ),
        .D(\FSM_sequential_s_state[0]_i_1_n_0 ),
        .Q(s_state[0]),
        .R(s_done_i_1_n_0));
  (* FSM_ENCODED_STATES = "m4_p2:01111,m4_p1:10000,m3_p4:01001,m5_p3:10010,m5_p2:10011,m1_p3:00010,m5_p1:10100,m1_p2:00011,m4_p4:01101,m1_p1:00100,m6_p3:10110,m3_p3:01010,m6_p2:10111,idle:00000,m3_p2:01011,m2_p3:00110,m6_p4:10101,m2_p2:00111,m6_p1:11000,m5_p4:10001,m3_p1:01100,m2_p4:00101,m2_p1:01000,m4_p3:01110,m1_p4:00001" *) 
  FDRE \FSM_sequential_s_state_reg[1] 
       (.C(i_clk),
        .CE(\FSM_sequential_s_state[4]_i_1_n_0 ),
        .D(\FSM_sequential_s_state[1]_i_1_n_0 ),
        .Q(s_state[1]),
        .R(s_done_i_1_n_0));
  (* FSM_ENCODED_STATES = "m4_p2:01111,m4_p1:10000,m3_p4:01001,m5_p3:10010,m5_p2:10011,m1_p3:00010,m5_p1:10100,m1_p2:00011,m4_p4:01101,m1_p1:00100,m6_p3:10110,m3_p3:01010,m6_p2:10111,idle:00000,m3_p2:01011,m2_p3:00110,m6_p4:10101,m2_p2:00111,m6_p1:11000,m5_p4:10001,m3_p1:01100,m2_p4:00101,m2_p1:01000,m4_p3:01110,m1_p4:00001" *) 
  FDRE \FSM_sequential_s_state_reg[2] 
       (.C(i_clk),
        .CE(\FSM_sequential_s_state[4]_i_1_n_0 ),
        .D(\FSM_sequential_s_state[2]_i_1_n_0 ),
        .Q(s_state[2]),
        .R(s_done_i_1_n_0));
  (* FSM_ENCODED_STATES = "m4_p2:01111,m4_p1:10000,m3_p4:01001,m5_p3:10010,m5_p2:10011,m1_p3:00010,m5_p1:10100,m1_p2:00011,m4_p4:01101,m1_p1:00100,m6_p3:10110,m3_p3:01010,m6_p2:10111,idle:00000,m3_p2:01011,m2_p3:00110,m6_p4:10101,m2_p2:00111,m6_p1:11000,m5_p4:10001,m3_p1:01100,m2_p4:00101,m2_p1:01000,m4_p3:01110,m1_p4:00001" *) 
  FDRE \FSM_sequential_s_state_reg[3] 
       (.C(i_clk),
        .CE(\FSM_sequential_s_state[4]_i_1_n_0 ),
        .D(\FSM_sequential_s_state[3]_i_1_n_0 ),
        .Q(s_state[3]),
        .R(s_done_i_1_n_0));
  (* FSM_ENCODED_STATES = "m4_p2:01111,m4_p1:10000,m3_p4:01001,m5_p3:10010,m5_p2:10011,m1_p3:00010,m5_p1:10100,m1_p2:00011,m4_p4:01101,m1_p1:00100,m6_p3:10110,m3_p3:01010,m6_p2:10111,idle:00000,m3_p2:01011,m2_p3:00110,m6_p4:10101,m2_p2:00111,m6_p1:11000,m5_p4:10001,m3_p1:01100,m2_p4:00101,m2_p1:01000,m4_p3:01110,m1_p4:00001" *) 
  FDRE \FSM_sequential_s_state_reg[4] 
       (.C(i_clk),
        .CE(\FSM_sequential_s_state[4]_i_1_n_0 ),
        .D(\FSM_sequential_s_state[4]_i_2_n_0 ),
        .Q(s_state[4]),
        .R(s_done_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h0E)) 
    \o_m1[0]_i_1 
       (.I0(s_state[2]),
        .I1(s_state[0]),
        .I2(s_state[1]),
        .O(\o_m1[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h5540)) 
    \o_m1[2]_i_1 
       (.I0(s_state[3]),
        .I1(s_state[0]),
        .I2(s_state[1]),
        .I3(s_state[2]),
        .O(\o_m1[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0000001F)) 
    \o_m1[3]_i_1 
       (.I0(s_state[0]),
        .I1(s_state[1]),
        .I2(s_state[2]),
        .I3(s_state[4]),
        .I4(s_state[3]),
        .O(\o_m1[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \o_m1[3]_i_2 
       (.I0(s_state[1]),
        .I1(s_state[0]),
        .O(\o_m1[3]_i_2_n_0 ));
  FDRE \o_m1_reg[0] 
       (.C(i_clk),
        .CE(\o_m1[3]_i_1_n_0 ),
        .D(\o_m1[0]_i_1_n_0 ),
        .Q(o_m1[0]),
        .R(s_done_i_1_n_0));
  FDRE \o_m1_reg[1] 
       (.C(i_clk),
        .CE(\o_m1[3]_i_1_n_0 ),
        .D(s_state[1]),
        .Q(o_m1[1]),
        .R(s_done_i_1_n_0));
  FDRE \o_m1_reg[2] 
       (.C(i_clk),
        .CE(\o_m1[3]_i_1_n_0 ),
        .D(\o_m1[2]_i_1_n_0 ),
        .Q(o_m1[2]),
        .R(s_done_i_1_n_0));
  FDRE \o_m1_reg[3] 
       (.C(i_clk),
        .CE(\o_m1[3]_i_1_n_0 ),
        .D(\o_m1[3]_i_2_n_0 ),
        .Q(o_m1[3]),
        .R(s_done_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h54)) 
    \o_m2[0]_i_1 
       (.I0(s_state[1]),
        .I1(s_state[3]),
        .I2(s_state[2]),
        .O(\o_m2[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h9990)) 
    \o_m2[2]_i_1 
       (.I0(s_state[0]),
        .I1(s_state[1]),
        .I2(s_state[2]),
        .I3(s_state[3]),
        .O(\o_m2[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00014441)) 
    \o_m2[3]_i_1 
       (.I0(s_state[4]),
        .I1(s_state[2]),
        .I2(s_state[1]),
        .I3(s_state[0]),
        .I4(s_state[3]),
        .O(\o_m2[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0444)) 
    \o_m2[3]_i_2 
       (.I0(s_state[3]),
        .I1(s_state[2]),
        .I2(s_state[0]),
        .I3(s_state[1]),
        .O(\o_m2[3]_i_2_n_0 ));
  FDRE \o_m2_reg[0] 
       (.C(i_clk),
        .CE(\o_m2[3]_i_1_n_0 ),
        .D(\o_m2[0]_i_1_n_0 ),
        .Q(o_m2[0]),
        .R(s_done_i_1_n_0));
  FDRE \o_m2_reg[1] 
       (.C(i_clk),
        .CE(\o_m2[3]_i_1_n_0 ),
        .D(s_state[1]),
        .Q(o_m2[1]),
        .R(s_done_i_1_n_0));
  FDRE \o_m2_reg[2] 
       (.C(i_clk),
        .CE(\o_m2[3]_i_1_n_0 ),
        .D(\o_m2[2]_i_1_n_0 ),
        .Q(o_m2[2]),
        .R(s_done_i_1_n_0));
  FDRE \o_m2_reg[3] 
       (.C(i_clk),
        .CE(\o_m2[3]_i_1_n_0 ),
        .D(\o_m2[3]_i_2_n_0 ),
        .Q(o_m2[3]),
        .R(s_done_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    \o_m3[0]_i_1 
       (.I0(s_state[3]),
        .I1(s_state[1]),
        .O(\o_m3[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hF8)) 
    \o_m3[2]_i_1 
       (.I0(s_state[0]),
        .I1(s_state[1]),
        .I2(s_state[2]),
        .O(\o_m3[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04040441)) 
    \o_m3[3]_i_1 
       (.I0(s_state[4]),
        .I1(s_state[3]),
        .I2(s_state[2]),
        .I3(s_state[1]),
        .I4(s_state[0]),
        .O(\o_m3[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h0444)) 
    \o_m3[3]_i_2 
       (.I0(s_state[2]),
        .I1(s_state[3]),
        .I2(s_state[0]),
        .I3(s_state[1]),
        .O(\o_m3[3]_i_2_n_0 ));
  FDRE \o_m3_reg[0] 
       (.C(i_clk),
        .CE(\o_m3[3]_i_1_n_0 ),
        .D(\o_m3[0]_i_1_n_0 ),
        .Q(o_m3[0]),
        .R(s_done_i_1_n_0));
  FDRE \o_m3_reg[1] 
       (.C(i_clk),
        .CE(\o_m3[3]_i_1_n_0 ),
        .D(s_state[1]),
        .Q(o_m3[1]),
        .R(s_done_i_1_n_0));
  FDRE \o_m3_reg[2] 
       (.C(i_clk),
        .CE(\o_m3[3]_i_1_n_0 ),
        .D(\o_m3[2]_i_1_n_0 ),
        .Q(o_m3[2]),
        .R(s_done_i_1_n_0));
  FDRE \o_m3_reg[3] 
       (.C(i_clk),
        .CE(\o_m3[3]_i_1_n_0 ),
        .D(\o_m3[3]_i_2_n_0 ),
        .Q(o_m3[3]),
        .R(s_done_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \o_m4[0]_i_1 
       (.I0(s_state[4]),
        .I1(s_state[3]),
        .I2(s_state[1]),
        .O(\o_m4[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \o_m4[1]_i_1 
       (.I0(s_state[1]),
        .I1(s_state[4]),
        .O(\o_m4[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h6006)) 
    \o_m4[2]_i_1 
       (.I0(s_state[4]),
        .I1(s_state[3]),
        .I2(s_state[1]),
        .I3(s_state[0]),
        .O(\o_m4[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h40404003)) 
    \o_m4[3]_i_1 
       (.I0(s_state[4]),
        .I1(s_state[3]),
        .I2(s_state[2]),
        .I3(s_state[1]),
        .I4(s_state[0]),
        .O(\o_m4[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h0444)) 
    \o_m4[3]_i_2 
       (.I0(s_state[4]),
        .I1(s_state[2]),
        .I2(s_state[0]),
        .I3(s_state[1]),
        .O(\o_m4[3]_i_2_n_0 ));
  FDRE \o_m4_reg[0] 
       (.C(i_clk),
        .CE(\o_m4[3]_i_1_n_0 ),
        .D(\o_m4[0]_i_1_n_0 ),
        .Q(o_m4[0]),
        .R(s_done_i_1_n_0));
  FDRE \o_m4_reg[1] 
       (.C(i_clk),
        .CE(\o_m4[3]_i_1_n_0 ),
        .D(\o_m4[1]_i_1_n_0 ),
        .Q(o_m4[1]),
        .R(s_done_i_1_n_0));
  FDRE \o_m4_reg[2] 
       (.C(i_clk),
        .CE(\o_m4[3]_i_1_n_0 ),
        .D(\o_m4[2]_i_1_n_0 ),
        .Q(o_m4[2]),
        .R(s_done_i_1_n_0));
  FDRE \o_m4_reg[3] 
       (.C(i_clk),
        .CE(\o_m4[3]_i_1_n_0 ),
        .D(\o_m4[3]_i_2_n_0 ),
        .Q(o_m4[3]),
        .R(s_done_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    \o_m5[0]_i_1 
       (.I0(s_state[4]),
        .I1(s_state[1]),
        .O(\o_m5[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04040441)) 
    \o_m5[3]_i_1 
       (.I0(s_state[3]),
        .I1(s_state[4]),
        .I2(s_state[2]),
        .I3(s_state[1]),
        .I4(s_state[0]),
        .O(\o_m5[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0444)) 
    \o_m5[3]_i_2 
       (.I0(s_state[2]),
        .I1(s_state[4]),
        .I2(s_state[0]),
        .I3(s_state[1]),
        .O(\o_m5[3]_i_2_n_0 ));
  FDRE \o_m5_reg[0] 
       (.C(i_clk),
        .CE(\o_m5[3]_i_1_n_0 ),
        .D(\o_m5[0]_i_1_n_0 ),
        .Q(o_m5[0]),
        .R(s_done_i_1_n_0));
  FDRE \o_m5_reg[1] 
       (.C(i_clk),
        .CE(\o_m5[3]_i_1_n_0 ),
        .D(s_state[1]),
        .Q(o_m5[1]),
        .R(s_done_i_1_n_0));
  FDRE \o_m5_reg[2] 
       (.C(i_clk),
        .CE(\o_m5[3]_i_1_n_0 ),
        .D(\o_m1[2]_i_1_n_0 ),
        .Q(o_m5[2]),
        .R(s_done_i_1_n_0));
  FDRE \o_m5_reg[3] 
       (.C(i_clk),
        .CE(\o_m5[3]_i_1_n_0 ),
        .D(\o_m5[3]_i_2_n_0 ),
        .Q(o_m5[3]),
        .R(s_done_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h0414)) 
    \o_m6[0]_i_1 
       (.I0(s_state[1]),
        .I1(s_state[2]),
        .I2(s_state[3]),
        .I3(s_state[0]),
        .O(\o_m6[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \o_m6[1]_i_1 
       (.I0(s_state[1]),
        .I1(s_state[3]),
        .O(\o_m6[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h4102)) 
    \o_m6[2]_i_1 
       (.I0(s_state[3]),
        .I1(s_state[1]),
        .I2(s_state[0]),
        .I3(s_state[2]),
        .O(\o_m6[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0100E001)) 
    \o_m6[3]_i_1 
       (.I0(s_state[0]),
        .I1(s_state[1]),
        .I2(s_state[2]),
        .I3(s_state[4]),
        .I4(s_state[3]),
        .O(\o_m6[3]_i_1_n_0 ));
  FDRE \o_m6_reg[0] 
       (.C(i_clk),
        .CE(\o_m6[3]_i_1_n_0 ),
        .D(\o_m6[0]_i_1_n_0 ),
        .Q(o_m6[0]),
        .R(s_done_i_1_n_0));
  FDRE \o_m6_reg[1] 
       (.C(i_clk),
        .CE(\o_m6[3]_i_1_n_0 ),
        .D(\o_m6[1]_i_1_n_0 ),
        .Q(o_m6[1]),
        .R(s_done_i_1_n_0));
  FDRE \o_m6_reg[2] 
       (.C(i_clk),
        .CE(\o_m6[3]_i_1_n_0 ),
        .D(\o_m6[2]_i_1_n_0 ),
        .Q(o_m6[2]),
        .R(s_done_i_1_n_0));
  FDRE \o_m6_reg[3] 
       (.C(i_clk),
        .CE(\o_m6[3]_i_1_n_0 ),
        .D(\o_m2[3]_i_2_n_0 ),
        .Q(o_m6[3]),
        .R(s_done_i_1_n_0));
  FDRE \s_cmd_d_reg[0] 
       (.C(i_clk),
        .CE(1'b1),
        .D(i_cmd[0]),
        .Q(\s_cmd_d_reg_n_0_[0] ),
        .R(s_done_i_1_n_0));
  FDRE \s_cmd_d_reg[1] 
       (.C(i_clk),
        .CE(1'b1),
        .D(i_cmd[1]),
        .Q(\s_cmd_d_reg_n_0_[1] ),
        .R(s_done_i_1_n_0));
  FDRE \s_cmd_d_reg[2] 
       (.C(i_clk),
        .CE(1'b1),
        .D(i_cmd[2]),
        .Q(\s_cmd_d_reg_n_0_[2] ),
        .R(s_done_i_1_n_0));
  FDRE \s_cmd_d_reg[3] 
       (.C(i_clk),
        .CE(1'b1),
        .D(i_cmd[3]),
        .Q(p_0_in),
        .R(s_done_i_1_n_0));
  LUT6 #(
    .INIT(64'h080800003B3B0003)) 
    \s_cpt_loop[0]_i_1 
       (.I0(p_0_in),
        .I1(s_state[1]),
        .I2(s_state[0]),
        .I3(s_state[2]),
        .I4(s_done_i_3_n_0),
        .I5(s_cpt_loop[0]),
        .O(s_cpt_loop_0[0]));
  LUT5 #(
    .INIT(32'h8BB88888)) 
    \s_cpt_loop[1]_i_1 
       (.I0(\s_cpt_loop[3]_i_5_n_0 ),
        .I1(s_state[1]),
        .I2(s_cpt_loop[1]),
        .I3(s_cpt_loop[0]),
        .I4(\s_cpt_loop[3]_i_7_n_0 ),
        .O(s_cpt_loop_0[1]));
  LUT6 #(
    .INIT(64'h8BB8B8B888888888)) 
    \s_cpt_loop[2]_i_1 
       (.I0(\s_cpt_loop[3]_i_5_n_0 ),
        .I1(s_state[1]),
        .I2(s_cpt_loop[2]),
        .I3(s_cpt_loop[1]),
        .I4(s_cpt_loop[0]),
        .I5(\s_cpt_loop[3]_i_7_n_0 ),
        .O(s_cpt_loop_0[2]));
  LUT6 #(
    .INIT(64'h8BB8B8B888888888)) 
    \s_cpt_loop[3]_i_2 
       (.I0(\s_cpt_loop[3]_i_5_n_0 ),
        .I1(s_state[1]),
        .I2(s_cpt_loop[3]),
        .I3(s_cpt_loop[2]),
        .I4(\s_cpt_loop[3]_i_6_n_0 ),
        .I5(\s_cpt_loop[3]_i_7_n_0 ),
        .O(s_cpt_loop_0[3]));
  LUT6 #(
    .INIT(64'h0444FFFF04440000)) 
    \s_cpt_loop[3]_i_3 
       (.I0(\s_cpt_loop[3]_i_8_n_0 ),
        .I1(s_next_phase),
        .I2(s_state[4]),
        .I3(s_state[3]),
        .I4(s_state[1]),
        .I5(\s_cpt_loop[3]_i_9_n_0 ),
        .O(\s_cpt_loop[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7000070000000700)) 
    \s_cpt_loop[3]_i_4 
       (.I0(s_state[4]),
        .I1(s_state[3]),
        .I2(p_0_in),
        .I3(s_next_phase),
        .I4(s_state[1]),
        .I5(s_done_i_4_n_0),
        .O(\s_cpt_loop[3]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h1500)) 
    \s_cpt_loop[3]_i_5 
       (.I0(s_state[0]),
        .I1(s_state[3]),
        .I2(s_state[4]),
        .I3(p_0_in),
        .O(\s_cpt_loop[3]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_cpt_loop[3]_i_6 
       (.I0(s_cpt_loop[1]),
        .I1(s_cpt_loop[0]),
        .O(\s_cpt_loop[3]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h777F)) 
    \s_cpt_loop[3]_i_7 
       (.I0(s_state[4]),
        .I1(s_state[3]),
        .I2(s_state[2]),
        .I3(s_state[0]),
        .O(\s_cpt_loop[3]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hFFFFFFBF)) 
    \s_cpt_loop[3]_i_8 
       (.I0(p_0_in),
        .I1(s_cpt_loop[3]),
        .I2(s_cpt_loop[2]),
        .I3(s_cpt_loop[0]),
        .I4(s_cpt_loop[1]),
        .O(\s_cpt_loop[3]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h08888880)) 
    \s_cpt_loop[3]_i_9 
       (.I0(p_0_in),
        .I1(s_next_phase),
        .I2(s_state[3]),
        .I3(s_state[4]),
        .I4(s_state[2]),
        .O(\s_cpt_loop[3]_i_9_n_0 ));
  FDRE \s_cpt_loop_reg[0] 
       (.C(i_clk),
        .CE(\s_cpt_loop_reg[3]_i_1_n_0 ),
        .D(s_cpt_loop_0[0]),
        .Q(s_cpt_loop[0]),
        .R(s_done_i_1_n_0));
  FDRE \s_cpt_loop_reg[1] 
       (.C(i_clk),
        .CE(\s_cpt_loop_reg[3]_i_1_n_0 ),
        .D(s_cpt_loop_0[1]),
        .Q(s_cpt_loop[1]),
        .R(s_done_i_1_n_0));
  FDRE \s_cpt_loop_reg[2] 
       (.C(i_clk),
        .CE(\s_cpt_loop_reg[3]_i_1_n_0 ),
        .D(s_cpt_loop_0[2]),
        .Q(s_cpt_loop[2]),
        .R(s_done_i_1_n_0));
  FDRE \s_cpt_loop_reg[3] 
       (.C(i_clk),
        .CE(\s_cpt_loop_reg[3]_i_1_n_0 ),
        .D(s_cpt_loop_0[3]),
        .Q(s_cpt_loop[3]),
        .R(s_done_i_1_n_0));
  MUXF7 \s_cpt_loop_reg[3]_i_1 
       (.I0(\s_cpt_loop[3]_i_3_n_0 ),
        .I1(\s_cpt_loop[3]_i_4_n_0 ),
        .O(\s_cpt_loop_reg[3]_i_1_n_0 ),
        .S(s_state[0]));
  LUT6 #(
    .INIT(64'h75555555FFFFFFFF)) 
    \s_cpt_phase[0]_i_1 
       (.I0(s_start_cnt_phase_reg_n_0),
        .I1(\s_cpt_phase[0]_i_3_n_0 ),
        .I2(\s_cpt_phase[0]_i_4_n_0 ),
        .I3(\s_cpt_phase[0]_i_5_n_0 ),
        .I4(\s_cpt_phase[0]_i_6_n_0 ),
        .I5(i_rst),
        .O(\s_cpt_phase[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \s_cpt_phase[0]_i_10 
       (.I0(s_cpt_phase_reg[9]),
        .I1(s_cpt_phase_reg[8]),
        .I2(s_cpt_phase_reg[11]),
        .I3(s_cpt_phase_reg[10]),
        .O(\s_cpt_phase[0]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \s_cpt_phase[0]_i_11 
       (.I0(s_cpt_phase_reg[1]),
        .I1(s_cpt_phase_reg[0]),
        .I2(s_cpt_phase_reg[3]),
        .I3(s_cpt_phase_reg[2]),
        .O(\s_cpt_phase[0]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'hFF7FFFFF)) 
    \s_cpt_phase[0]_i_3 
       (.I0(s_cpt_phase_reg[16]),
        .I1(s_cpt_phase_reg[17]),
        .I2(s_cpt_phase_reg[18]),
        .I3(s_cpt_phase_reg[19]),
        .I4(\s_cpt_phase[0]_i_8_n_0 ),
        .O(\s_cpt_phase[0]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \s_cpt_phase[0]_i_4 
       (.I0(s_cpt_phase_reg[28]),
        .I1(s_cpt_phase_reg[29]),
        .I2(s_cpt_phase_reg[31]),
        .I3(s_cpt_phase_reg[30]),
        .I4(\s_cpt_phase[0]_i_9_n_0 ),
        .O(\s_cpt_phase[0]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h00008000)) 
    \s_cpt_phase[0]_i_5 
       (.I0(s_cpt_phase_reg[14]),
        .I1(s_cpt_phase_reg[15]),
        .I2(s_cpt_phase_reg[12]),
        .I3(s_cpt_phase_reg[13]),
        .I4(\s_cpt_phase[0]_i_10_n_0 ),
        .O(\s_cpt_phase[0]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h00008000)) 
    \s_cpt_phase[0]_i_6 
       (.I0(s_cpt_phase_reg[6]),
        .I1(s_cpt_phase_reg[7]),
        .I2(s_cpt_phase_reg[4]),
        .I3(s_cpt_phase_reg[5]),
        .I4(\s_cpt_phase[0]_i_11_n_0 ),
        .O(\s_cpt_phase[0]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \s_cpt_phase[0]_i_7 
       (.I0(s_cpt_phase_reg[0]),
        .O(\s_cpt_phase[0]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \s_cpt_phase[0]_i_8 
       (.I0(s_cpt_phase_reg[23]),
        .I1(s_cpt_phase_reg[22]),
        .I2(s_cpt_phase_reg[21]),
        .I3(s_cpt_phase_reg[20]),
        .O(\s_cpt_phase[0]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \s_cpt_phase[0]_i_9 
       (.I0(s_cpt_phase_reg[25]),
        .I1(s_cpt_phase_reg[24]),
        .I2(s_cpt_phase_reg[27]),
        .I3(s_cpt_phase_reg[26]),
        .O(\s_cpt_phase[0]_i_9_n_0 ));
  FDRE \s_cpt_phase_reg[0] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[0]_i_2_n_7 ),
        .Q(s_cpt_phase_reg[0]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  CARRY4 \s_cpt_phase_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\s_cpt_phase_reg[0]_i_2_n_0 ,\s_cpt_phase_reg[0]_i_2_n_1 ,\s_cpt_phase_reg[0]_i_2_n_2 ,\s_cpt_phase_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\s_cpt_phase_reg[0]_i_2_n_4 ,\s_cpt_phase_reg[0]_i_2_n_5 ,\s_cpt_phase_reg[0]_i_2_n_6 ,\s_cpt_phase_reg[0]_i_2_n_7 }),
        .S({s_cpt_phase_reg[3:1],\s_cpt_phase[0]_i_7_n_0 }));
  FDRE \s_cpt_phase_reg[10] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[8]_i_1_n_5 ),
        .Q(s_cpt_phase_reg[10]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  FDRE \s_cpt_phase_reg[11] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[8]_i_1_n_4 ),
        .Q(s_cpt_phase_reg[11]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  FDRE \s_cpt_phase_reg[12] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[12]_i_1_n_7 ),
        .Q(s_cpt_phase_reg[12]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  CARRY4 \s_cpt_phase_reg[12]_i_1 
       (.CI(\s_cpt_phase_reg[8]_i_1_n_0 ),
        .CO({\s_cpt_phase_reg[12]_i_1_n_0 ,\s_cpt_phase_reg[12]_i_1_n_1 ,\s_cpt_phase_reg[12]_i_1_n_2 ,\s_cpt_phase_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\s_cpt_phase_reg[12]_i_1_n_4 ,\s_cpt_phase_reg[12]_i_1_n_5 ,\s_cpt_phase_reg[12]_i_1_n_6 ,\s_cpt_phase_reg[12]_i_1_n_7 }),
        .S(s_cpt_phase_reg[15:12]));
  FDRE \s_cpt_phase_reg[13] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[12]_i_1_n_6 ),
        .Q(s_cpt_phase_reg[13]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  FDRE \s_cpt_phase_reg[14] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[12]_i_1_n_5 ),
        .Q(s_cpt_phase_reg[14]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  FDRE \s_cpt_phase_reg[15] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[12]_i_1_n_4 ),
        .Q(s_cpt_phase_reg[15]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  FDRE \s_cpt_phase_reg[16] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[16]_i_1_n_7 ),
        .Q(s_cpt_phase_reg[16]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  CARRY4 \s_cpt_phase_reg[16]_i_1 
       (.CI(\s_cpt_phase_reg[12]_i_1_n_0 ),
        .CO({\s_cpt_phase_reg[16]_i_1_n_0 ,\s_cpt_phase_reg[16]_i_1_n_1 ,\s_cpt_phase_reg[16]_i_1_n_2 ,\s_cpt_phase_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\s_cpt_phase_reg[16]_i_1_n_4 ,\s_cpt_phase_reg[16]_i_1_n_5 ,\s_cpt_phase_reg[16]_i_1_n_6 ,\s_cpt_phase_reg[16]_i_1_n_7 }),
        .S(s_cpt_phase_reg[19:16]));
  FDRE \s_cpt_phase_reg[17] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[16]_i_1_n_6 ),
        .Q(s_cpt_phase_reg[17]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  FDRE \s_cpt_phase_reg[18] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[16]_i_1_n_5 ),
        .Q(s_cpt_phase_reg[18]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  FDRE \s_cpt_phase_reg[19] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[16]_i_1_n_4 ),
        .Q(s_cpt_phase_reg[19]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  FDRE \s_cpt_phase_reg[1] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[0]_i_2_n_6 ),
        .Q(s_cpt_phase_reg[1]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  FDRE \s_cpt_phase_reg[20] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[20]_i_1_n_7 ),
        .Q(s_cpt_phase_reg[20]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  CARRY4 \s_cpt_phase_reg[20]_i_1 
       (.CI(\s_cpt_phase_reg[16]_i_1_n_0 ),
        .CO({\s_cpt_phase_reg[20]_i_1_n_0 ,\s_cpt_phase_reg[20]_i_1_n_1 ,\s_cpt_phase_reg[20]_i_1_n_2 ,\s_cpt_phase_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\s_cpt_phase_reg[20]_i_1_n_4 ,\s_cpt_phase_reg[20]_i_1_n_5 ,\s_cpt_phase_reg[20]_i_1_n_6 ,\s_cpt_phase_reg[20]_i_1_n_7 }),
        .S(s_cpt_phase_reg[23:20]));
  FDRE \s_cpt_phase_reg[21] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[20]_i_1_n_6 ),
        .Q(s_cpt_phase_reg[21]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  FDRE \s_cpt_phase_reg[22] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[20]_i_1_n_5 ),
        .Q(s_cpt_phase_reg[22]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  FDRE \s_cpt_phase_reg[23] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[20]_i_1_n_4 ),
        .Q(s_cpt_phase_reg[23]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  FDRE \s_cpt_phase_reg[24] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[24]_i_1_n_7 ),
        .Q(s_cpt_phase_reg[24]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  CARRY4 \s_cpt_phase_reg[24]_i_1 
       (.CI(\s_cpt_phase_reg[20]_i_1_n_0 ),
        .CO({\s_cpt_phase_reg[24]_i_1_n_0 ,\s_cpt_phase_reg[24]_i_1_n_1 ,\s_cpt_phase_reg[24]_i_1_n_2 ,\s_cpt_phase_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\s_cpt_phase_reg[24]_i_1_n_4 ,\s_cpt_phase_reg[24]_i_1_n_5 ,\s_cpt_phase_reg[24]_i_1_n_6 ,\s_cpt_phase_reg[24]_i_1_n_7 }),
        .S(s_cpt_phase_reg[27:24]));
  FDRE \s_cpt_phase_reg[25] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[24]_i_1_n_6 ),
        .Q(s_cpt_phase_reg[25]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  FDRE \s_cpt_phase_reg[26] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[24]_i_1_n_5 ),
        .Q(s_cpt_phase_reg[26]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  FDRE \s_cpt_phase_reg[27] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[24]_i_1_n_4 ),
        .Q(s_cpt_phase_reg[27]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  FDRE \s_cpt_phase_reg[28] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[28]_i_1_n_7 ),
        .Q(s_cpt_phase_reg[28]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  CARRY4 \s_cpt_phase_reg[28]_i_1 
       (.CI(\s_cpt_phase_reg[24]_i_1_n_0 ),
        .CO({\NLW_s_cpt_phase_reg[28]_i_1_CO_UNCONNECTED [3],\s_cpt_phase_reg[28]_i_1_n_1 ,\s_cpt_phase_reg[28]_i_1_n_2 ,\s_cpt_phase_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\s_cpt_phase_reg[28]_i_1_n_4 ,\s_cpt_phase_reg[28]_i_1_n_5 ,\s_cpt_phase_reg[28]_i_1_n_6 ,\s_cpt_phase_reg[28]_i_1_n_7 }),
        .S(s_cpt_phase_reg[31:28]));
  FDRE \s_cpt_phase_reg[29] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[28]_i_1_n_6 ),
        .Q(s_cpt_phase_reg[29]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  FDRE \s_cpt_phase_reg[2] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[0]_i_2_n_5 ),
        .Q(s_cpt_phase_reg[2]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  FDRE \s_cpt_phase_reg[30] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[28]_i_1_n_5 ),
        .Q(s_cpt_phase_reg[30]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  FDRE \s_cpt_phase_reg[31] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[28]_i_1_n_4 ),
        .Q(s_cpt_phase_reg[31]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  FDRE \s_cpt_phase_reg[3] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[0]_i_2_n_4 ),
        .Q(s_cpt_phase_reg[3]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  FDRE \s_cpt_phase_reg[4] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[4]_i_1_n_7 ),
        .Q(s_cpt_phase_reg[4]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  CARRY4 \s_cpt_phase_reg[4]_i_1 
       (.CI(\s_cpt_phase_reg[0]_i_2_n_0 ),
        .CO({\s_cpt_phase_reg[4]_i_1_n_0 ,\s_cpt_phase_reg[4]_i_1_n_1 ,\s_cpt_phase_reg[4]_i_1_n_2 ,\s_cpt_phase_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\s_cpt_phase_reg[4]_i_1_n_4 ,\s_cpt_phase_reg[4]_i_1_n_5 ,\s_cpt_phase_reg[4]_i_1_n_6 ,\s_cpt_phase_reg[4]_i_1_n_7 }),
        .S(s_cpt_phase_reg[7:4]));
  FDRE \s_cpt_phase_reg[5] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[4]_i_1_n_6 ),
        .Q(s_cpt_phase_reg[5]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  FDRE \s_cpt_phase_reg[6] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[4]_i_1_n_5 ),
        .Q(s_cpt_phase_reg[6]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  FDRE \s_cpt_phase_reg[7] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[4]_i_1_n_4 ),
        .Q(s_cpt_phase_reg[7]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  FDRE \s_cpt_phase_reg[8] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[8]_i_1_n_7 ),
        .Q(s_cpt_phase_reg[8]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  CARRY4 \s_cpt_phase_reg[8]_i_1 
       (.CI(\s_cpt_phase_reg[4]_i_1_n_0 ),
        .CO({\s_cpt_phase_reg[8]_i_1_n_0 ,\s_cpt_phase_reg[8]_i_1_n_1 ,\s_cpt_phase_reg[8]_i_1_n_2 ,\s_cpt_phase_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\s_cpt_phase_reg[8]_i_1_n_4 ,\s_cpt_phase_reg[8]_i_1_n_5 ,\s_cpt_phase_reg[8]_i_1_n_6 ,\s_cpt_phase_reg[8]_i_1_n_7 }),
        .S(s_cpt_phase_reg[11:8]));
  FDRE \s_cpt_phase_reg[9] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_cpt_phase_reg[8]_i_1_n_6 ),
        .Q(s_cpt_phase_reg[9]),
        .R(\s_cpt_phase[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    s_done_i_1
       (.I0(i_rst),
        .O(s_done_i_1_n_0));
  LUT6 #(
    .INIT(64'hA202FFFFA2020000)) 
    s_done_i_2
       (.I0(s_done_i_3_n_0),
        .I1(i_new),
        .I2(s_state[1]),
        .I3(s_done_i_4_n_0),
        .I4(s_done_i_5_n_0),
        .I5(o_done),
        .O(s_done_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h7)) 
    s_done_i_3
       (.I0(s_state[3]),
        .I1(s_state[4]),
        .O(s_done_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    s_done_i_4
       (.I0(s_cpt_loop[1]),
        .I1(s_cpt_loop[0]),
        .I2(s_cpt_loop[2]),
        .I3(s_cpt_loop[3]),
        .O(s_done_i_4_n_0));
  LUT6 #(
    .INIT(64'h8200222200000000)) 
    s_done_i_5
       (.I0(s_done_i_3_n_0),
        .I1(s_state[0]),
        .I2(p_0_in),
        .I3(s_done_i_6_n_0),
        .I4(s_state[1]),
        .I5(s_done_i_7_n_0),
        .O(s_done_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00000080)) 
    s_done_i_6
       (.I0(s_next_phase),
        .I1(s_cpt_loop[3]),
        .I2(s_cpt_loop[2]),
        .I3(s_cpt_loop[0]),
        .I4(s_cpt_loop[1]),
        .O(s_done_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hAAAB)) 
    s_done_i_7
       (.I0(s_state[1]),
        .I1(s_state[4]),
        .I2(s_state[2]),
        .I3(s_state[3]),
        .O(s_done_i_7_n_0));
  FDRE #(
    .INIT(1'b0)) 
    s_done_reg
       (.C(i_clk),
        .CE(1'b1),
        .D(s_done_i_2_n_0),
        .Q(o_done),
        .R(s_done_i_1_n_0));
  LUT6 #(
    .INIT(64'h0080000000000000)) 
    s_next_phase_i_1
       (.I0(\s_cpt_phase[0]_i_6_n_0 ),
        .I1(\s_cpt_phase[0]_i_5_n_0 ),
        .I2(\s_cpt_phase[0]_i_4_n_0 ),
        .I3(\s_cpt_phase[0]_i_3_n_0 ),
        .I4(s_start_cnt_phase_reg_n_0),
        .I5(i_rst),
        .O(s_next_phase_i_1_n_0));
  FDRE s_next_phase_reg
       (.C(i_clk),
        .CE(1'b1),
        .D(s_next_phase_i_1_n_0),
        .Q(s_next_phase),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hB8)) 
    s_start_cnt_phase_i_1
       (.I0(s_start_cnt_phase),
        .I1(s_done_i_5_n_0),
        .I2(s_start_cnt_phase_reg_n_0),
        .O(s_start_cnt_phase_i_1_n_0));
  LUT6 #(
    .INIT(64'h1515150000001500)) 
    s_start_cnt_phase_i_2
       (.I0(s_state[0]),
        .I1(s_state[3]),
        .I2(s_state[4]),
        .I3(i_new),
        .I4(s_state[1]),
        .I5(p_0_in),
        .O(s_start_cnt_phase));
  FDRE s_start_cnt_phase_reg
       (.C(i_clk),
        .CE(1'b1),
        .D(s_start_cnt_phase_i_1_n_0),
        .Q(s_start_cnt_phase_reg_n_0),
        .R(s_done_i_1_n_0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
