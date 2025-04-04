// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Sat Mar 29 13:29:47 2025
// Host        : LAPTOP-N4P3CLBG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design1_rubik_resolver_0_0_sim_netlist.v
// Design      : design1_rubik_resolver_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design1_rubik_resolver_0_0,rubik_resolver,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "rubik_resolver,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (i_clk,
    i_rst,
    i_cmd,
    i_new,
    o_done,
    o_done_temp,
    o_m1,
    o_m2,
    o_m3,
    o_m4,
    o_m5,
    o_m6,
    o_leds);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 i_clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME i_clk, ASSOCIATED_RESET i_rst, FREQ_HZ 50000000, PHASE 0.000, CLK_DOMAIN design1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input i_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 i_rst RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME i_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input i_rst;
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

  wire \<const0> ;
  wire i_clk;
  wire [3:0]i_cmd;
  wire i_new;
  wire i_rst;
  wire o_done;
  wire o_done_temp;
  wire [3:0]o_m1;
  wire [3:0]o_m2;
  wire [2:0]\^o_m3 ;
  wire [3:0]o_m4;
  wire [3:0]o_m5;
  wire [3:0]o_m6;

  assign o_leds[3:0] = i_cmd;
  assign o_m3[3] = \<const0> ;
  assign o_m3[2:0] = \^o_m3 [2:0];
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rubik_resolver inst
       (.i_clk(i_clk),
        .i_cmd(i_cmd),
        .i_new(i_new),
        .i_rst(i_rst),
        .o_done(o_done),
        .o_done_temp(o_done_temp),
        .o_m1(o_m1),
        .o_m2(o_m2),
        .o_m3(\^o_m3 ),
        .o_m4(o_m4),
        .o_m5(o_m5),
        .o_m6(o_m6));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rubik_resolver
   (o_done_temp,
    o_m1,
    o_m2,
    o_m3,
    o_m4,
    o_m5,
    o_m6,
    o_done,
    i_rst,
    i_clk,
    i_cmd,
    i_new);
  output o_done_temp;
  output [3:0]o_m1;
  output [3:0]o_m2;
  output [2:0]o_m3;
  output [3:0]o_m4;
  output [3:0]o_m5;
  output [3:0]o_m6;
  output o_done;
  input i_rst;
  input i_clk;
  input [3:0]i_cmd;
  input i_new;

  wire \FSM_onehot_s_state[0]_i_1_n_0 ;
  wire \FSM_onehot_s_state[10]_i_1_n_0 ;
  wire \FSM_onehot_s_state[11]_i_1_n_0 ;
  wire \FSM_onehot_s_state[12]_i_1_n_0 ;
  wire \FSM_onehot_s_state[13]_i_1_n_0 ;
  wire \FSM_onehot_s_state[14]_i_1_n_0 ;
  wire \FSM_onehot_s_state[15]_i_1_n_0 ;
  wire \FSM_onehot_s_state[16]_i_1_n_0 ;
  wire \FSM_onehot_s_state[17]_i_1_n_0 ;
  wire \FSM_onehot_s_state[18]_i_1_n_0 ;
  wire \FSM_onehot_s_state[19]_i_1_n_0 ;
  wire \FSM_onehot_s_state[1]_i_1_n_0 ;
  wire \FSM_onehot_s_state[20]_i_1_n_0 ;
  wire \FSM_onehot_s_state[20]_i_2_n_0 ;
  wire \FSM_onehot_s_state[21]_i_1_n_0 ;
  wire \FSM_onehot_s_state[22]_i_1_n_0 ;
  wire \FSM_onehot_s_state[23]_i_1_n_0 ;
  wire \FSM_onehot_s_state[24]_i_1_n_0 ;
  wire \FSM_onehot_s_state[24]_i_2_n_0 ;
  wire \FSM_onehot_s_state[2]_i_1_n_0 ;
  wire \FSM_onehot_s_state[3]_i_1_n_0 ;
  wire \FSM_onehot_s_state[4]_i_1_n_0 ;
  wire \FSM_onehot_s_state[5]_i_1_n_0 ;
  wire \FSM_onehot_s_state[6]_i_1_n_0 ;
  wire \FSM_onehot_s_state[7]_i_1_n_0 ;
  wire \FSM_onehot_s_state[8]_i_1_n_0 ;
  wire \FSM_onehot_s_state[9]_i_1_n_0 ;
  wire \FSM_onehot_s_state_reg_n_0_[0] ;
  wire \FSM_onehot_s_state_reg_n_0_[10] ;
  wire \FSM_onehot_s_state_reg_n_0_[11] ;
  wire \FSM_onehot_s_state_reg_n_0_[12] ;
  wire \FSM_onehot_s_state_reg_n_0_[13] ;
  wire \FSM_onehot_s_state_reg_n_0_[14] ;
  wire \FSM_onehot_s_state_reg_n_0_[15] ;
  wire \FSM_onehot_s_state_reg_n_0_[16] ;
  wire \FSM_onehot_s_state_reg_n_0_[17] ;
  wire \FSM_onehot_s_state_reg_n_0_[18] ;
  wire \FSM_onehot_s_state_reg_n_0_[19] ;
  wire \FSM_onehot_s_state_reg_n_0_[1] ;
  wire \FSM_onehot_s_state_reg_n_0_[20] ;
  wire \FSM_onehot_s_state_reg_n_0_[21] ;
  wire \FSM_onehot_s_state_reg_n_0_[22] ;
  wire \FSM_onehot_s_state_reg_n_0_[23] ;
  wire \FSM_onehot_s_state_reg_n_0_[24] ;
  wire \FSM_onehot_s_state_reg_n_0_[2] ;
  wire \FSM_onehot_s_state_reg_n_0_[3] ;
  wire \FSM_onehot_s_state_reg_n_0_[4] ;
  wire \FSM_onehot_s_state_reg_n_0_[5] ;
  wire \FSM_onehot_s_state_reg_n_0_[6] ;
  wire \FSM_onehot_s_state_reg_n_0_[7] ;
  wire \FSM_onehot_s_state_reg_n_0_[8] ;
  wire \FSM_onehot_s_state_reg_n_0_[9] ;
  wire eqOp;
  wire i_clk;
  wire [3:0]i_cmd;
  wire i_new;
  wire i_rst;
  wire o_done;
  wire o_done_i_1_n_0;
  wire o_done_i_2_n_0;
  wire o_done_i_3_n_0;
  wire o_done_i_4_n_0;
  wire o_done_i_5_n_0;
  wire o_done_i_6_n_0;
  wire o_done_i_7_n_0;
  wire o_done_i_8_n_0;
  wire o_done_temp;
  wire o_done_temp_i_2_n_0;
  wire o_done_temp_i_3_n_0;
  wire o_done_temp_i_4_n_0;
  wire o_done_temp_i_5_n_0;
  wire o_done_temp_i_6_n_0;
  wire o_done_temp_i_7_n_0;
  wire o_done_temp_i_8_n_0;
  wire o_done_temp_i_9_n_0;
  wire [3:0]o_m1;
  wire \o_m1[3]_i_1_n_0 ;
  wire [3:0]o_m2;
  wire \o_m2[3]_i_1_n_0 ;
  wire \o_m2[3]_i_2_n_0 ;
  wire [2:0]o_m3;
  wire \o_m3[0]_i_1_n_0 ;
  wire \o_m3[1]_i_1_n_0 ;
  wire \o_m3[2]_i_1_n_0 ;
  wire [3:0]o_m4;
  wire \o_m4[3]_i_1_n_0 ;
  wire [3:0]o_m5;
  wire \o_m5[3]_i_1_n_0 ;
  wire [3:0]o_m6;
  wire \o_m6[3]_i_1_n_0 ;
  wire p_0_in;
  wire \s_cmd_d_reg_n_0_[0] ;
  wire \s_cmd_d_reg_n_0_[1] ;
  wire \s_cmd_d_reg_n_0_[2] ;
  wire \s_compteur[0]_i_1_n_0 ;
  wire \s_compteur[0]_i_3_n_0 ;
  wire [31:0]s_compteur_reg;
  wire \s_compteur_reg[0]_i_2_n_0 ;
  wire \s_compteur_reg[0]_i_2_n_1 ;
  wire \s_compteur_reg[0]_i_2_n_2 ;
  wire \s_compteur_reg[0]_i_2_n_3 ;
  wire \s_compteur_reg[0]_i_2_n_4 ;
  wire \s_compteur_reg[0]_i_2_n_5 ;
  wire \s_compteur_reg[0]_i_2_n_6 ;
  wire \s_compteur_reg[0]_i_2_n_7 ;
  wire \s_compteur_reg[12]_i_1_n_0 ;
  wire \s_compteur_reg[12]_i_1_n_1 ;
  wire \s_compteur_reg[12]_i_1_n_2 ;
  wire \s_compteur_reg[12]_i_1_n_3 ;
  wire \s_compteur_reg[12]_i_1_n_4 ;
  wire \s_compteur_reg[12]_i_1_n_5 ;
  wire \s_compteur_reg[12]_i_1_n_6 ;
  wire \s_compteur_reg[12]_i_1_n_7 ;
  wire \s_compteur_reg[16]_i_1_n_0 ;
  wire \s_compteur_reg[16]_i_1_n_1 ;
  wire \s_compteur_reg[16]_i_1_n_2 ;
  wire \s_compteur_reg[16]_i_1_n_3 ;
  wire \s_compteur_reg[16]_i_1_n_4 ;
  wire \s_compteur_reg[16]_i_1_n_5 ;
  wire \s_compteur_reg[16]_i_1_n_6 ;
  wire \s_compteur_reg[16]_i_1_n_7 ;
  wire \s_compteur_reg[20]_i_1_n_0 ;
  wire \s_compteur_reg[20]_i_1_n_1 ;
  wire \s_compteur_reg[20]_i_1_n_2 ;
  wire \s_compteur_reg[20]_i_1_n_3 ;
  wire \s_compteur_reg[20]_i_1_n_4 ;
  wire \s_compteur_reg[20]_i_1_n_5 ;
  wire \s_compteur_reg[20]_i_1_n_6 ;
  wire \s_compteur_reg[20]_i_1_n_7 ;
  wire \s_compteur_reg[24]_i_1_n_0 ;
  wire \s_compteur_reg[24]_i_1_n_1 ;
  wire \s_compteur_reg[24]_i_1_n_2 ;
  wire \s_compteur_reg[24]_i_1_n_3 ;
  wire \s_compteur_reg[24]_i_1_n_4 ;
  wire \s_compteur_reg[24]_i_1_n_5 ;
  wire \s_compteur_reg[24]_i_1_n_6 ;
  wire \s_compteur_reg[24]_i_1_n_7 ;
  wire \s_compteur_reg[28]_i_1_n_1 ;
  wire \s_compteur_reg[28]_i_1_n_2 ;
  wire \s_compteur_reg[28]_i_1_n_3 ;
  wire \s_compteur_reg[28]_i_1_n_4 ;
  wire \s_compteur_reg[28]_i_1_n_5 ;
  wire \s_compteur_reg[28]_i_1_n_6 ;
  wire \s_compteur_reg[28]_i_1_n_7 ;
  wire \s_compteur_reg[4]_i_1_n_0 ;
  wire \s_compteur_reg[4]_i_1_n_1 ;
  wire \s_compteur_reg[4]_i_1_n_2 ;
  wire \s_compteur_reg[4]_i_1_n_3 ;
  wire \s_compteur_reg[4]_i_1_n_4 ;
  wire \s_compteur_reg[4]_i_1_n_5 ;
  wire \s_compteur_reg[4]_i_1_n_6 ;
  wire \s_compteur_reg[4]_i_1_n_7 ;
  wire \s_compteur_reg[8]_i_1_n_0 ;
  wire \s_compteur_reg[8]_i_1_n_1 ;
  wire \s_compteur_reg[8]_i_1_n_2 ;
  wire \s_compteur_reg[8]_i_1_n_3 ;
  wire \s_compteur_reg[8]_i_1_n_4 ;
  wire \s_compteur_reg[8]_i_1_n_5 ;
  wire \s_compteur_reg[8]_i_1_n_6 ;
  wire \s_compteur_reg[8]_i_1_n_7 ;
  wire [3:3]\NLW_s_compteur_reg[28]_i_1_CO_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hFDCCDDCCDDCCDFCC)) 
    \FSM_onehot_s_state[0]_i_1 
       (.I0(i_new),
        .I1(o_done_i_6_n_0),
        .I2(\s_cmd_d_reg_n_0_[0] ),
        .I3(\FSM_onehot_s_state_reg_n_0_[0] ),
        .I4(\s_cmd_d_reg_n_0_[2] ),
        .I5(\s_cmd_d_reg_n_0_[1] ),
        .O(\FSM_onehot_s_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \FSM_onehot_s_state[10]_i_1 
       (.I0(\FSM_onehot_s_state_reg_n_0_[9] ),
        .I1(p_0_in),
        .I2(\FSM_onehot_s_state_reg_n_0_[11] ),
        .O(\FSM_onehot_s_state[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \FSM_onehot_s_state[11]_i_1 
       (.I0(\FSM_onehot_s_state_reg_n_0_[10] ),
        .I1(p_0_in),
        .I2(\FSM_onehot_s_state_reg_n_0_[12] ),
        .O(\FSM_onehot_s_state[11]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFF002020)) 
    \FSM_onehot_s_state[12]_i_1 
       (.I0(\FSM_onehot_s_state[20]_i_2_n_0 ),
        .I1(\s_cmd_d_reg_n_0_[2] ),
        .I2(\s_cmd_d_reg_n_0_[1] ),
        .I3(\FSM_onehot_s_state_reg_n_0_[11] ),
        .I4(p_0_in),
        .O(\FSM_onehot_s_state[12]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h20FF2000)) 
    \FSM_onehot_s_state[13]_i_1 
       (.I0(\FSM_onehot_s_state[24]_i_2_n_0 ),
        .I1(\s_cmd_d_reg_n_0_[1] ),
        .I2(\s_cmd_d_reg_n_0_[2] ),
        .I3(p_0_in),
        .I4(\FSM_onehot_s_state_reg_n_0_[14] ),
        .O(\FSM_onehot_s_state[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \FSM_onehot_s_state[14]_i_1 
       (.I0(\FSM_onehot_s_state_reg_n_0_[13] ),
        .I1(p_0_in),
        .I2(\FSM_onehot_s_state_reg_n_0_[15] ),
        .O(\FSM_onehot_s_state[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \FSM_onehot_s_state[15]_i_1 
       (.I0(\FSM_onehot_s_state_reg_n_0_[14] ),
        .I1(p_0_in),
        .I2(\FSM_onehot_s_state_reg_n_0_[16] ),
        .O(\FSM_onehot_s_state[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFF002020)) 
    \FSM_onehot_s_state[16]_i_1 
       (.I0(\FSM_onehot_s_state[24]_i_2_n_0 ),
        .I1(\s_cmd_d_reg_n_0_[1] ),
        .I2(\s_cmd_d_reg_n_0_[2] ),
        .I3(\FSM_onehot_s_state_reg_n_0_[15] ),
        .I4(p_0_in),
        .O(\FSM_onehot_s_state[16]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h20FF2000)) 
    \FSM_onehot_s_state[17]_i_1 
       (.I0(\FSM_onehot_s_state[20]_i_2_n_0 ),
        .I1(\s_cmd_d_reg_n_0_[1] ),
        .I2(\s_cmd_d_reg_n_0_[2] ),
        .I3(p_0_in),
        .I4(\FSM_onehot_s_state_reg_n_0_[18] ),
        .O(\FSM_onehot_s_state[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \FSM_onehot_s_state[18]_i_1 
       (.I0(\FSM_onehot_s_state_reg_n_0_[17] ),
        .I1(p_0_in),
        .I2(\FSM_onehot_s_state_reg_n_0_[19] ),
        .O(\FSM_onehot_s_state[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \FSM_onehot_s_state[19]_i_1 
       (.I0(\FSM_onehot_s_state_reg_n_0_[18] ),
        .I1(p_0_in),
        .I2(\FSM_onehot_s_state_reg_n_0_[20] ),
        .O(\FSM_onehot_s_state[19]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h02FF0200)) 
    \FSM_onehot_s_state[1]_i_1 
       (.I0(\FSM_onehot_s_state[20]_i_2_n_0 ),
        .I1(\s_cmd_d_reg_n_0_[2] ),
        .I2(\s_cmd_d_reg_n_0_[1] ),
        .I3(p_0_in),
        .I4(\FSM_onehot_s_state_reg_n_0_[2] ),
        .O(\FSM_onehot_s_state[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFF002020)) 
    \FSM_onehot_s_state[20]_i_1 
       (.I0(\FSM_onehot_s_state[20]_i_2_n_0 ),
        .I1(\s_cmd_d_reg_n_0_[1] ),
        .I2(\s_cmd_d_reg_n_0_[2] ),
        .I3(\FSM_onehot_s_state_reg_n_0_[19] ),
        .I4(p_0_in),
        .O(\FSM_onehot_s_state[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \FSM_onehot_s_state[20]_i_2 
       (.I0(\FSM_onehot_s_state_reg_n_0_[0] ),
        .I1(i_new),
        .I2(\s_cmd_d_reg_n_0_[0] ),
        .O(\FSM_onehot_s_state[20]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h80FF8000)) 
    \FSM_onehot_s_state[21]_i_1 
       (.I0(\FSM_onehot_s_state[24]_i_2_n_0 ),
        .I1(\s_cmd_d_reg_n_0_[2] ),
        .I2(\s_cmd_d_reg_n_0_[1] ),
        .I3(p_0_in),
        .I4(\FSM_onehot_s_state_reg_n_0_[22] ),
        .O(\FSM_onehot_s_state[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \FSM_onehot_s_state[22]_i_1 
       (.I0(\FSM_onehot_s_state_reg_n_0_[21] ),
        .I1(p_0_in),
        .I2(\FSM_onehot_s_state_reg_n_0_[23] ),
        .O(\FSM_onehot_s_state[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \FSM_onehot_s_state[23]_i_1 
       (.I0(\FSM_onehot_s_state_reg_n_0_[22] ),
        .I1(p_0_in),
        .I2(\FSM_onehot_s_state_reg_n_0_[24] ),
        .O(\FSM_onehot_s_state[23]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFF008080)) 
    \FSM_onehot_s_state[24]_i_1 
       (.I0(\FSM_onehot_s_state[24]_i_2_n_0 ),
        .I1(\s_cmd_d_reg_n_0_[2] ),
        .I2(\s_cmd_d_reg_n_0_[1] ),
        .I3(\FSM_onehot_s_state_reg_n_0_[23] ),
        .I4(p_0_in),
        .O(\FSM_onehot_s_state[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \FSM_onehot_s_state[24]_i_2 
       (.I0(\FSM_onehot_s_state_reg_n_0_[0] ),
        .I1(i_new),
        .I2(\s_cmd_d_reg_n_0_[0] ),
        .O(\FSM_onehot_s_state[24]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \FSM_onehot_s_state[2]_i_1 
       (.I0(\FSM_onehot_s_state_reg_n_0_[1] ),
        .I1(p_0_in),
        .I2(\FSM_onehot_s_state_reg_n_0_[3] ),
        .O(\FSM_onehot_s_state[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \FSM_onehot_s_state[3]_i_1 
       (.I0(\FSM_onehot_s_state_reg_n_0_[2] ),
        .I1(p_0_in),
        .I2(\FSM_onehot_s_state_reg_n_0_[4] ),
        .O(\FSM_onehot_s_state[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFF000202)) 
    \FSM_onehot_s_state[4]_i_1 
       (.I0(\FSM_onehot_s_state[20]_i_2_n_0 ),
        .I1(\s_cmd_d_reg_n_0_[2] ),
        .I2(\s_cmd_d_reg_n_0_[1] ),
        .I3(\FSM_onehot_s_state_reg_n_0_[3] ),
        .I4(p_0_in),
        .O(\FSM_onehot_s_state[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h20FF2000)) 
    \FSM_onehot_s_state[5]_i_1 
       (.I0(\FSM_onehot_s_state[24]_i_2_n_0 ),
        .I1(\s_cmd_d_reg_n_0_[2] ),
        .I2(\s_cmd_d_reg_n_0_[1] ),
        .I3(p_0_in),
        .I4(\FSM_onehot_s_state_reg_n_0_[6] ),
        .O(\FSM_onehot_s_state[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \FSM_onehot_s_state[6]_i_1 
       (.I0(\FSM_onehot_s_state_reg_n_0_[5] ),
        .I1(p_0_in),
        .I2(\FSM_onehot_s_state_reg_n_0_[7] ),
        .O(\FSM_onehot_s_state[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \FSM_onehot_s_state[7]_i_1 
       (.I0(\FSM_onehot_s_state_reg_n_0_[6] ),
        .I1(p_0_in),
        .I2(\FSM_onehot_s_state_reg_n_0_[8] ),
        .O(\FSM_onehot_s_state[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFF002020)) 
    \FSM_onehot_s_state[8]_i_1 
       (.I0(\FSM_onehot_s_state[24]_i_2_n_0 ),
        .I1(\s_cmd_d_reg_n_0_[2] ),
        .I2(\s_cmd_d_reg_n_0_[1] ),
        .I3(\FSM_onehot_s_state_reg_n_0_[7] ),
        .I4(p_0_in),
        .O(\FSM_onehot_s_state[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h20FF2000)) 
    \FSM_onehot_s_state[9]_i_1 
       (.I0(\FSM_onehot_s_state[20]_i_2_n_0 ),
        .I1(\s_cmd_d_reg_n_0_[2] ),
        .I2(\s_cmd_d_reg_n_0_[1] ),
        .I3(p_0_in),
        .I4(\FSM_onehot_s_state_reg_n_0_[10] ),
        .O(\FSM_onehot_s_state[9]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "m4_p2:0000000001000000000000000,m4_p1:0000000010000000000000000,m3_p4:0000000000000001000000000,m5_p3:0000001000000000000000000,m5_p2:0000010000000000000000000,m1_p3:0000000000000000000000100,m5_p1:0000100000000000000000000,m1_p2:0000000000000000000001000,m4_p4:0000000000010000000000000,m1_p1:0000000000000000000010000,m6_p3:0010000000000000000000000,m3_p3:0000000000000010000000000,m6_p2:0100000000000000000000000,idle:0000000000000000000000001,m3_p2:0000000000000100000000000,m2_p3:0000000000000000001000000,m6_p4:0001000000000000000000000,m2_p2:0000000000000000010000000,m6_p1:1000000000000000000000000,m5_p4:0000000100000000000000000,m3_p1:0000000000001000000000000,m2_p4:0000000000000000000100000,m2_p1:0000000000000000100000000,m4_p3:0000000000100000000000000,m1_p4:0000000000000000000000010" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_s_state_reg[0] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_onehot_s_state[0]_i_1_n_0 ),
        .Q(\FSM_onehot_s_state_reg_n_0_[0] ),
        .S(o_done_i_1_n_0));
  (* FSM_ENCODED_STATES = "m4_p2:0000000001000000000000000,m4_p1:0000000010000000000000000,m3_p4:0000000000000001000000000,m5_p3:0000001000000000000000000,m5_p2:0000010000000000000000000,m1_p3:0000000000000000000000100,m5_p1:0000100000000000000000000,m1_p2:0000000000000000000001000,m4_p4:0000000000010000000000000,m1_p1:0000000000000000000010000,m6_p3:0010000000000000000000000,m3_p3:0000000000000010000000000,m6_p2:0100000000000000000000000,idle:0000000000000000000000001,m3_p2:0000000000000100000000000,m2_p3:0000000000000000001000000,m6_p4:0001000000000000000000000,m2_p2:0000000000000000010000000,m6_p1:1000000000000000000000000,m5_p4:0000000100000000000000000,m3_p1:0000000000001000000000000,m2_p4:0000000000000000000100000,m2_p1:0000000000000000100000000,m4_p3:0000000000100000000000000,m1_p4:0000000000000000000000010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_s_state_reg[10] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_onehot_s_state[10]_i_1_n_0 ),
        .Q(\FSM_onehot_s_state_reg_n_0_[10] ),
        .R(o_done_i_1_n_0));
  (* FSM_ENCODED_STATES = "m4_p2:0000000001000000000000000,m4_p1:0000000010000000000000000,m3_p4:0000000000000001000000000,m5_p3:0000001000000000000000000,m5_p2:0000010000000000000000000,m1_p3:0000000000000000000000100,m5_p1:0000100000000000000000000,m1_p2:0000000000000000000001000,m4_p4:0000000000010000000000000,m1_p1:0000000000000000000010000,m6_p3:0010000000000000000000000,m3_p3:0000000000000010000000000,m6_p2:0100000000000000000000000,idle:0000000000000000000000001,m3_p2:0000000000000100000000000,m2_p3:0000000000000000001000000,m6_p4:0001000000000000000000000,m2_p2:0000000000000000010000000,m6_p1:1000000000000000000000000,m5_p4:0000000100000000000000000,m3_p1:0000000000001000000000000,m2_p4:0000000000000000000100000,m2_p1:0000000000000000100000000,m4_p3:0000000000100000000000000,m1_p4:0000000000000000000000010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_s_state_reg[11] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_onehot_s_state[11]_i_1_n_0 ),
        .Q(\FSM_onehot_s_state_reg_n_0_[11] ),
        .R(o_done_i_1_n_0));
  (* FSM_ENCODED_STATES = "m4_p2:0000000001000000000000000,m4_p1:0000000010000000000000000,m3_p4:0000000000000001000000000,m5_p3:0000001000000000000000000,m5_p2:0000010000000000000000000,m1_p3:0000000000000000000000100,m5_p1:0000100000000000000000000,m1_p2:0000000000000000000001000,m4_p4:0000000000010000000000000,m1_p1:0000000000000000000010000,m6_p3:0010000000000000000000000,m3_p3:0000000000000010000000000,m6_p2:0100000000000000000000000,idle:0000000000000000000000001,m3_p2:0000000000000100000000000,m2_p3:0000000000000000001000000,m6_p4:0001000000000000000000000,m2_p2:0000000000000000010000000,m6_p1:1000000000000000000000000,m5_p4:0000000100000000000000000,m3_p1:0000000000001000000000000,m2_p4:0000000000000000000100000,m2_p1:0000000000000000100000000,m4_p3:0000000000100000000000000,m1_p4:0000000000000000000000010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_s_state_reg[12] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_onehot_s_state[12]_i_1_n_0 ),
        .Q(\FSM_onehot_s_state_reg_n_0_[12] ),
        .R(o_done_i_1_n_0));
  (* FSM_ENCODED_STATES = "m4_p2:0000000001000000000000000,m4_p1:0000000010000000000000000,m3_p4:0000000000000001000000000,m5_p3:0000001000000000000000000,m5_p2:0000010000000000000000000,m1_p3:0000000000000000000000100,m5_p1:0000100000000000000000000,m1_p2:0000000000000000000001000,m4_p4:0000000000010000000000000,m1_p1:0000000000000000000010000,m6_p3:0010000000000000000000000,m3_p3:0000000000000010000000000,m6_p2:0100000000000000000000000,idle:0000000000000000000000001,m3_p2:0000000000000100000000000,m2_p3:0000000000000000001000000,m6_p4:0001000000000000000000000,m2_p2:0000000000000000010000000,m6_p1:1000000000000000000000000,m5_p4:0000000100000000000000000,m3_p1:0000000000001000000000000,m2_p4:0000000000000000000100000,m2_p1:0000000000000000100000000,m4_p3:0000000000100000000000000,m1_p4:0000000000000000000000010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_s_state_reg[13] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_onehot_s_state[13]_i_1_n_0 ),
        .Q(\FSM_onehot_s_state_reg_n_0_[13] ),
        .R(o_done_i_1_n_0));
  (* FSM_ENCODED_STATES = "m4_p2:0000000001000000000000000,m4_p1:0000000010000000000000000,m3_p4:0000000000000001000000000,m5_p3:0000001000000000000000000,m5_p2:0000010000000000000000000,m1_p3:0000000000000000000000100,m5_p1:0000100000000000000000000,m1_p2:0000000000000000000001000,m4_p4:0000000000010000000000000,m1_p1:0000000000000000000010000,m6_p3:0010000000000000000000000,m3_p3:0000000000000010000000000,m6_p2:0100000000000000000000000,idle:0000000000000000000000001,m3_p2:0000000000000100000000000,m2_p3:0000000000000000001000000,m6_p4:0001000000000000000000000,m2_p2:0000000000000000010000000,m6_p1:1000000000000000000000000,m5_p4:0000000100000000000000000,m3_p1:0000000000001000000000000,m2_p4:0000000000000000000100000,m2_p1:0000000000000000100000000,m4_p3:0000000000100000000000000,m1_p4:0000000000000000000000010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_s_state_reg[14] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_onehot_s_state[14]_i_1_n_0 ),
        .Q(\FSM_onehot_s_state_reg_n_0_[14] ),
        .R(o_done_i_1_n_0));
  (* FSM_ENCODED_STATES = "m4_p2:0000000001000000000000000,m4_p1:0000000010000000000000000,m3_p4:0000000000000001000000000,m5_p3:0000001000000000000000000,m5_p2:0000010000000000000000000,m1_p3:0000000000000000000000100,m5_p1:0000100000000000000000000,m1_p2:0000000000000000000001000,m4_p4:0000000000010000000000000,m1_p1:0000000000000000000010000,m6_p3:0010000000000000000000000,m3_p3:0000000000000010000000000,m6_p2:0100000000000000000000000,idle:0000000000000000000000001,m3_p2:0000000000000100000000000,m2_p3:0000000000000000001000000,m6_p4:0001000000000000000000000,m2_p2:0000000000000000010000000,m6_p1:1000000000000000000000000,m5_p4:0000000100000000000000000,m3_p1:0000000000001000000000000,m2_p4:0000000000000000000100000,m2_p1:0000000000000000100000000,m4_p3:0000000000100000000000000,m1_p4:0000000000000000000000010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_s_state_reg[15] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_onehot_s_state[15]_i_1_n_0 ),
        .Q(\FSM_onehot_s_state_reg_n_0_[15] ),
        .R(o_done_i_1_n_0));
  (* FSM_ENCODED_STATES = "m4_p2:0000000001000000000000000,m4_p1:0000000010000000000000000,m3_p4:0000000000000001000000000,m5_p3:0000001000000000000000000,m5_p2:0000010000000000000000000,m1_p3:0000000000000000000000100,m5_p1:0000100000000000000000000,m1_p2:0000000000000000000001000,m4_p4:0000000000010000000000000,m1_p1:0000000000000000000010000,m6_p3:0010000000000000000000000,m3_p3:0000000000000010000000000,m6_p2:0100000000000000000000000,idle:0000000000000000000000001,m3_p2:0000000000000100000000000,m2_p3:0000000000000000001000000,m6_p4:0001000000000000000000000,m2_p2:0000000000000000010000000,m6_p1:1000000000000000000000000,m5_p4:0000000100000000000000000,m3_p1:0000000000001000000000000,m2_p4:0000000000000000000100000,m2_p1:0000000000000000100000000,m4_p3:0000000000100000000000000,m1_p4:0000000000000000000000010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_s_state_reg[16] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_onehot_s_state[16]_i_1_n_0 ),
        .Q(\FSM_onehot_s_state_reg_n_0_[16] ),
        .R(o_done_i_1_n_0));
  (* FSM_ENCODED_STATES = "m4_p2:0000000001000000000000000,m4_p1:0000000010000000000000000,m3_p4:0000000000000001000000000,m5_p3:0000001000000000000000000,m5_p2:0000010000000000000000000,m1_p3:0000000000000000000000100,m5_p1:0000100000000000000000000,m1_p2:0000000000000000000001000,m4_p4:0000000000010000000000000,m1_p1:0000000000000000000010000,m6_p3:0010000000000000000000000,m3_p3:0000000000000010000000000,m6_p2:0100000000000000000000000,idle:0000000000000000000000001,m3_p2:0000000000000100000000000,m2_p3:0000000000000000001000000,m6_p4:0001000000000000000000000,m2_p2:0000000000000000010000000,m6_p1:1000000000000000000000000,m5_p4:0000000100000000000000000,m3_p1:0000000000001000000000000,m2_p4:0000000000000000000100000,m2_p1:0000000000000000100000000,m4_p3:0000000000100000000000000,m1_p4:0000000000000000000000010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_s_state_reg[17] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_onehot_s_state[17]_i_1_n_0 ),
        .Q(\FSM_onehot_s_state_reg_n_0_[17] ),
        .R(o_done_i_1_n_0));
  (* FSM_ENCODED_STATES = "m4_p2:0000000001000000000000000,m4_p1:0000000010000000000000000,m3_p4:0000000000000001000000000,m5_p3:0000001000000000000000000,m5_p2:0000010000000000000000000,m1_p3:0000000000000000000000100,m5_p1:0000100000000000000000000,m1_p2:0000000000000000000001000,m4_p4:0000000000010000000000000,m1_p1:0000000000000000000010000,m6_p3:0010000000000000000000000,m3_p3:0000000000000010000000000,m6_p2:0100000000000000000000000,idle:0000000000000000000000001,m3_p2:0000000000000100000000000,m2_p3:0000000000000000001000000,m6_p4:0001000000000000000000000,m2_p2:0000000000000000010000000,m6_p1:1000000000000000000000000,m5_p4:0000000100000000000000000,m3_p1:0000000000001000000000000,m2_p4:0000000000000000000100000,m2_p1:0000000000000000100000000,m4_p3:0000000000100000000000000,m1_p4:0000000000000000000000010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_s_state_reg[18] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_onehot_s_state[18]_i_1_n_0 ),
        .Q(\FSM_onehot_s_state_reg_n_0_[18] ),
        .R(o_done_i_1_n_0));
  (* FSM_ENCODED_STATES = "m4_p2:0000000001000000000000000,m4_p1:0000000010000000000000000,m3_p4:0000000000000001000000000,m5_p3:0000001000000000000000000,m5_p2:0000010000000000000000000,m1_p3:0000000000000000000000100,m5_p1:0000100000000000000000000,m1_p2:0000000000000000000001000,m4_p4:0000000000010000000000000,m1_p1:0000000000000000000010000,m6_p3:0010000000000000000000000,m3_p3:0000000000000010000000000,m6_p2:0100000000000000000000000,idle:0000000000000000000000001,m3_p2:0000000000000100000000000,m2_p3:0000000000000000001000000,m6_p4:0001000000000000000000000,m2_p2:0000000000000000010000000,m6_p1:1000000000000000000000000,m5_p4:0000000100000000000000000,m3_p1:0000000000001000000000000,m2_p4:0000000000000000000100000,m2_p1:0000000000000000100000000,m4_p3:0000000000100000000000000,m1_p4:0000000000000000000000010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_s_state_reg[19] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_onehot_s_state[19]_i_1_n_0 ),
        .Q(\FSM_onehot_s_state_reg_n_0_[19] ),
        .R(o_done_i_1_n_0));
  (* FSM_ENCODED_STATES = "m4_p2:0000000001000000000000000,m4_p1:0000000010000000000000000,m3_p4:0000000000000001000000000,m5_p3:0000001000000000000000000,m5_p2:0000010000000000000000000,m1_p3:0000000000000000000000100,m5_p1:0000100000000000000000000,m1_p2:0000000000000000000001000,m4_p4:0000000000010000000000000,m1_p1:0000000000000000000010000,m6_p3:0010000000000000000000000,m3_p3:0000000000000010000000000,m6_p2:0100000000000000000000000,idle:0000000000000000000000001,m3_p2:0000000000000100000000000,m2_p3:0000000000000000001000000,m6_p4:0001000000000000000000000,m2_p2:0000000000000000010000000,m6_p1:1000000000000000000000000,m5_p4:0000000100000000000000000,m3_p1:0000000000001000000000000,m2_p4:0000000000000000000100000,m2_p1:0000000000000000100000000,m4_p3:0000000000100000000000000,m1_p4:0000000000000000000000010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_s_state_reg[1] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_onehot_s_state[1]_i_1_n_0 ),
        .Q(\FSM_onehot_s_state_reg_n_0_[1] ),
        .R(o_done_i_1_n_0));
  (* FSM_ENCODED_STATES = "m4_p2:0000000001000000000000000,m4_p1:0000000010000000000000000,m3_p4:0000000000000001000000000,m5_p3:0000001000000000000000000,m5_p2:0000010000000000000000000,m1_p3:0000000000000000000000100,m5_p1:0000100000000000000000000,m1_p2:0000000000000000000001000,m4_p4:0000000000010000000000000,m1_p1:0000000000000000000010000,m6_p3:0010000000000000000000000,m3_p3:0000000000000010000000000,m6_p2:0100000000000000000000000,idle:0000000000000000000000001,m3_p2:0000000000000100000000000,m2_p3:0000000000000000001000000,m6_p4:0001000000000000000000000,m2_p2:0000000000000000010000000,m6_p1:1000000000000000000000000,m5_p4:0000000100000000000000000,m3_p1:0000000000001000000000000,m2_p4:0000000000000000000100000,m2_p1:0000000000000000100000000,m4_p3:0000000000100000000000000,m1_p4:0000000000000000000000010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_s_state_reg[20] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_onehot_s_state[20]_i_1_n_0 ),
        .Q(\FSM_onehot_s_state_reg_n_0_[20] ),
        .R(o_done_i_1_n_0));
  (* FSM_ENCODED_STATES = "m4_p2:0000000001000000000000000,m4_p1:0000000010000000000000000,m3_p4:0000000000000001000000000,m5_p3:0000001000000000000000000,m5_p2:0000010000000000000000000,m1_p3:0000000000000000000000100,m5_p1:0000100000000000000000000,m1_p2:0000000000000000000001000,m4_p4:0000000000010000000000000,m1_p1:0000000000000000000010000,m6_p3:0010000000000000000000000,m3_p3:0000000000000010000000000,m6_p2:0100000000000000000000000,idle:0000000000000000000000001,m3_p2:0000000000000100000000000,m2_p3:0000000000000000001000000,m6_p4:0001000000000000000000000,m2_p2:0000000000000000010000000,m6_p1:1000000000000000000000000,m5_p4:0000000100000000000000000,m3_p1:0000000000001000000000000,m2_p4:0000000000000000000100000,m2_p1:0000000000000000100000000,m4_p3:0000000000100000000000000,m1_p4:0000000000000000000000010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_s_state_reg[21] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_onehot_s_state[21]_i_1_n_0 ),
        .Q(\FSM_onehot_s_state_reg_n_0_[21] ),
        .R(o_done_i_1_n_0));
  (* FSM_ENCODED_STATES = "m4_p2:0000000001000000000000000,m4_p1:0000000010000000000000000,m3_p4:0000000000000001000000000,m5_p3:0000001000000000000000000,m5_p2:0000010000000000000000000,m1_p3:0000000000000000000000100,m5_p1:0000100000000000000000000,m1_p2:0000000000000000000001000,m4_p4:0000000000010000000000000,m1_p1:0000000000000000000010000,m6_p3:0010000000000000000000000,m3_p3:0000000000000010000000000,m6_p2:0100000000000000000000000,idle:0000000000000000000000001,m3_p2:0000000000000100000000000,m2_p3:0000000000000000001000000,m6_p4:0001000000000000000000000,m2_p2:0000000000000000010000000,m6_p1:1000000000000000000000000,m5_p4:0000000100000000000000000,m3_p1:0000000000001000000000000,m2_p4:0000000000000000000100000,m2_p1:0000000000000000100000000,m4_p3:0000000000100000000000000,m1_p4:0000000000000000000000010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_s_state_reg[22] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_onehot_s_state[22]_i_1_n_0 ),
        .Q(\FSM_onehot_s_state_reg_n_0_[22] ),
        .R(o_done_i_1_n_0));
  (* FSM_ENCODED_STATES = "m4_p2:0000000001000000000000000,m4_p1:0000000010000000000000000,m3_p4:0000000000000001000000000,m5_p3:0000001000000000000000000,m5_p2:0000010000000000000000000,m1_p3:0000000000000000000000100,m5_p1:0000100000000000000000000,m1_p2:0000000000000000000001000,m4_p4:0000000000010000000000000,m1_p1:0000000000000000000010000,m6_p3:0010000000000000000000000,m3_p3:0000000000000010000000000,m6_p2:0100000000000000000000000,idle:0000000000000000000000001,m3_p2:0000000000000100000000000,m2_p3:0000000000000000001000000,m6_p4:0001000000000000000000000,m2_p2:0000000000000000010000000,m6_p1:1000000000000000000000000,m5_p4:0000000100000000000000000,m3_p1:0000000000001000000000000,m2_p4:0000000000000000000100000,m2_p1:0000000000000000100000000,m4_p3:0000000000100000000000000,m1_p4:0000000000000000000000010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_s_state_reg[23] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_onehot_s_state[23]_i_1_n_0 ),
        .Q(\FSM_onehot_s_state_reg_n_0_[23] ),
        .R(o_done_i_1_n_0));
  (* FSM_ENCODED_STATES = "m4_p2:0000000001000000000000000,m4_p1:0000000010000000000000000,m3_p4:0000000000000001000000000,m5_p3:0000001000000000000000000,m5_p2:0000010000000000000000000,m1_p3:0000000000000000000000100,m5_p1:0000100000000000000000000,m1_p2:0000000000000000000001000,m4_p4:0000000000010000000000000,m1_p1:0000000000000000000010000,m6_p3:0010000000000000000000000,m3_p3:0000000000000010000000000,m6_p2:0100000000000000000000000,idle:0000000000000000000000001,m3_p2:0000000000000100000000000,m2_p3:0000000000000000001000000,m6_p4:0001000000000000000000000,m2_p2:0000000000000000010000000,m6_p1:1000000000000000000000000,m5_p4:0000000100000000000000000,m3_p1:0000000000001000000000000,m2_p4:0000000000000000000100000,m2_p1:0000000000000000100000000,m4_p3:0000000000100000000000000,m1_p4:0000000000000000000000010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_s_state_reg[24] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_onehot_s_state[24]_i_1_n_0 ),
        .Q(\FSM_onehot_s_state_reg_n_0_[24] ),
        .R(o_done_i_1_n_0));
  (* FSM_ENCODED_STATES = "m4_p2:0000000001000000000000000,m4_p1:0000000010000000000000000,m3_p4:0000000000000001000000000,m5_p3:0000001000000000000000000,m5_p2:0000010000000000000000000,m1_p3:0000000000000000000000100,m5_p1:0000100000000000000000000,m1_p2:0000000000000000000001000,m4_p4:0000000000010000000000000,m1_p1:0000000000000000000010000,m6_p3:0010000000000000000000000,m3_p3:0000000000000010000000000,m6_p2:0100000000000000000000000,idle:0000000000000000000000001,m3_p2:0000000000000100000000000,m2_p3:0000000000000000001000000,m6_p4:0001000000000000000000000,m2_p2:0000000000000000010000000,m6_p1:1000000000000000000000000,m5_p4:0000000100000000000000000,m3_p1:0000000000001000000000000,m2_p4:0000000000000000000100000,m2_p1:0000000000000000100000000,m4_p3:0000000000100000000000000,m1_p4:0000000000000000000000010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_s_state_reg[2] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_onehot_s_state[2]_i_1_n_0 ),
        .Q(\FSM_onehot_s_state_reg_n_0_[2] ),
        .R(o_done_i_1_n_0));
  (* FSM_ENCODED_STATES = "m4_p2:0000000001000000000000000,m4_p1:0000000010000000000000000,m3_p4:0000000000000001000000000,m5_p3:0000001000000000000000000,m5_p2:0000010000000000000000000,m1_p3:0000000000000000000000100,m5_p1:0000100000000000000000000,m1_p2:0000000000000000000001000,m4_p4:0000000000010000000000000,m1_p1:0000000000000000000010000,m6_p3:0010000000000000000000000,m3_p3:0000000000000010000000000,m6_p2:0100000000000000000000000,idle:0000000000000000000000001,m3_p2:0000000000000100000000000,m2_p3:0000000000000000001000000,m6_p4:0001000000000000000000000,m2_p2:0000000000000000010000000,m6_p1:1000000000000000000000000,m5_p4:0000000100000000000000000,m3_p1:0000000000001000000000000,m2_p4:0000000000000000000100000,m2_p1:0000000000000000100000000,m4_p3:0000000000100000000000000,m1_p4:0000000000000000000000010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_s_state_reg[3] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_onehot_s_state[3]_i_1_n_0 ),
        .Q(\FSM_onehot_s_state_reg_n_0_[3] ),
        .R(o_done_i_1_n_0));
  (* FSM_ENCODED_STATES = "m4_p2:0000000001000000000000000,m4_p1:0000000010000000000000000,m3_p4:0000000000000001000000000,m5_p3:0000001000000000000000000,m5_p2:0000010000000000000000000,m1_p3:0000000000000000000000100,m5_p1:0000100000000000000000000,m1_p2:0000000000000000000001000,m4_p4:0000000000010000000000000,m1_p1:0000000000000000000010000,m6_p3:0010000000000000000000000,m3_p3:0000000000000010000000000,m6_p2:0100000000000000000000000,idle:0000000000000000000000001,m3_p2:0000000000000100000000000,m2_p3:0000000000000000001000000,m6_p4:0001000000000000000000000,m2_p2:0000000000000000010000000,m6_p1:1000000000000000000000000,m5_p4:0000000100000000000000000,m3_p1:0000000000001000000000000,m2_p4:0000000000000000000100000,m2_p1:0000000000000000100000000,m4_p3:0000000000100000000000000,m1_p4:0000000000000000000000010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_s_state_reg[4] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_onehot_s_state[4]_i_1_n_0 ),
        .Q(\FSM_onehot_s_state_reg_n_0_[4] ),
        .R(o_done_i_1_n_0));
  (* FSM_ENCODED_STATES = "m4_p2:0000000001000000000000000,m4_p1:0000000010000000000000000,m3_p4:0000000000000001000000000,m5_p3:0000001000000000000000000,m5_p2:0000010000000000000000000,m1_p3:0000000000000000000000100,m5_p1:0000100000000000000000000,m1_p2:0000000000000000000001000,m4_p4:0000000000010000000000000,m1_p1:0000000000000000000010000,m6_p3:0010000000000000000000000,m3_p3:0000000000000010000000000,m6_p2:0100000000000000000000000,idle:0000000000000000000000001,m3_p2:0000000000000100000000000,m2_p3:0000000000000000001000000,m6_p4:0001000000000000000000000,m2_p2:0000000000000000010000000,m6_p1:1000000000000000000000000,m5_p4:0000000100000000000000000,m3_p1:0000000000001000000000000,m2_p4:0000000000000000000100000,m2_p1:0000000000000000100000000,m4_p3:0000000000100000000000000,m1_p4:0000000000000000000000010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_s_state_reg[5] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_onehot_s_state[5]_i_1_n_0 ),
        .Q(\FSM_onehot_s_state_reg_n_0_[5] ),
        .R(o_done_i_1_n_0));
  (* FSM_ENCODED_STATES = "m4_p2:0000000001000000000000000,m4_p1:0000000010000000000000000,m3_p4:0000000000000001000000000,m5_p3:0000001000000000000000000,m5_p2:0000010000000000000000000,m1_p3:0000000000000000000000100,m5_p1:0000100000000000000000000,m1_p2:0000000000000000000001000,m4_p4:0000000000010000000000000,m1_p1:0000000000000000000010000,m6_p3:0010000000000000000000000,m3_p3:0000000000000010000000000,m6_p2:0100000000000000000000000,idle:0000000000000000000000001,m3_p2:0000000000000100000000000,m2_p3:0000000000000000001000000,m6_p4:0001000000000000000000000,m2_p2:0000000000000000010000000,m6_p1:1000000000000000000000000,m5_p4:0000000100000000000000000,m3_p1:0000000000001000000000000,m2_p4:0000000000000000000100000,m2_p1:0000000000000000100000000,m4_p3:0000000000100000000000000,m1_p4:0000000000000000000000010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_s_state_reg[6] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_onehot_s_state[6]_i_1_n_0 ),
        .Q(\FSM_onehot_s_state_reg_n_0_[6] ),
        .R(o_done_i_1_n_0));
  (* FSM_ENCODED_STATES = "m4_p2:0000000001000000000000000,m4_p1:0000000010000000000000000,m3_p4:0000000000000001000000000,m5_p3:0000001000000000000000000,m5_p2:0000010000000000000000000,m1_p3:0000000000000000000000100,m5_p1:0000100000000000000000000,m1_p2:0000000000000000000001000,m4_p4:0000000000010000000000000,m1_p1:0000000000000000000010000,m6_p3:0010000000000000000000000,m3_p3:0000000000000010000000000,m6_p2:0100000000000000000000000,idle:0000000000000000000000001,m3_p2:0000000000000100000000000,m2_p3:0000000000000000001000000,m6_p4:0001000000000000000000000,m2_p2:0000000000000000010000000,m6_p1:1000000000000000000000000,m5_p4:0000000100000000000000000,m3_p1:0000000000001000000000000,m2_p4:0000000000000000000100000,m2_p1:0000000000000000100000000,m4_p3:0000000000100000000000000,m1_p4:0000000000000000000000010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_s_state_reg[7] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_onehot_s_state[7]_i_1_n_0 ),
        .Q(\FSM_onehot_s_state_reg_n_0_[7] ),
        .R(o_done_i_1_n_0));
  (* FSM_ENCODED_STATES = "m4_p2:0000000001000000000000000,m4_p1:0000000010000000000000000,m3_p4:0000000000000001000000000,m5_p3:0000001000000000000000000,m5_p2:0000010000000000000000000,m1_p3:0000000000000000000000100,m5_p1:0000100000000000000000000,m1_p2:0000000000000000000001000,m4_p4:0000000000010000000000000,m1_p1:0000000000000000000010000,m6_p3:0010000000000000000000000,m3_p3:0000000000000010000000000,m6_p2:0100000000000000000000000,idle:0000000000000000000000001,m3_p2:0000000000000100000000000,m2_p3:0000000000000000001000000,m6_p4:0001000000000000000000000,m2_p2:0000000000000000010000000,m6_p1:1000000000000000000000000,m5_p4:0000000100000000000000000,m3_p1:0000000000001000000000000,m2_p4:0000000000000000000100000,m2_p1:0000000000000000100000000,m4_p3:0000000000100000000000000,m1_p4:0000000000000000000000010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_s_state_reg[8] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_onehot_s_state[8]_i_1_n_0 ),
        .Q(\FSM_onehot_s_state_reg_n_0_[8] ),
        .R(o_done_i_1_n_0));
  (* FSM_ENCODED_STATES = "m4_p2:0000000001000000000000000,m4_p1:0000000010000000000000000,m3_p4:0000000000000001000000000,m5_p3:0000001000000000000000000,m5_p2:0000010000000000000000000,m1_p3:0000000000000000000000100,m5_p1:0000100000000000000000000,m1_p2:0000000000000000000001000,m4_p4:0000000000010000000000000,m1_p1:0000000000000000000010000,m6_p3:0010000000000000000000000,m3_p3:0000000000000010000000000,m6_p2:0100000000000000000000000,idle:0000000000000000000000001,m3_p2:0000000000000100000000000,m2_p3:0000000000000000001000000,m6_p4:0001000000000000000000000,m2_p2:0000000000000000010000000,m6_p1:1000000000000000000000000,m5_p4:0000000100000000000000000,m3_p1:0000000000001000000000000,m2_p4:0000000000000000000100000,m2_p1:0000000000000000100000000,m4_p3:0000000000100000000000000,m1_p4:0000000000000000000000010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_s_state_reg[9] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_onehot_s_state[9]_i_1_n_0 ),
        .Q(\FSM_onehot_s_state_reg_n_0_[9] ),
        .R(o_done_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    o_done_i_1
       (.I0(i_rst),
        .O(o_done_i_1_n_0));
  LUT6 #(
    .INIT(64'hFEFEFEFFFEFEFE00)) 
    o_done_i_2
       (.I0(o_done_i_3_n_0),
        .I1(o_done_i_4_n_0),
        .I2(o_done_i_5_n_0),
        .I3(o_done_i_6_n_0),
        .I4(\FSM_onehot_s_state_reg_n_0_[0] ),
        .I5(o_done),
        .O(o_done_i_2_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    o_done_i_3
       (.I0(\FSM_onehot_s_state_reg_n_0_[3] ),
        .I1(\FSM_onehot_s_state_reg_n_0_[2] ),
        .I2(\FSM_onehot_s_state_reg_n_0_[7] ),
        .I3(\FSM_onehot_s_state_reg_n_0_[6] ),
        .O(o_done_i_3_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFF2)) 
    o_done_i_4
       (.I0(\FSM_onehot_s_state_reg_n_0_[1] ),
        .I1(p_0_in),
        .I2(\FSM_onehot_s_state_reg_n_0_[22] ),
        .I3(\FSM_onehot_s_state_reg_n_0_[23] ),
        .I4(o_done_i_7_n_0),
        .I5(\FSM_onehot_s_state_reg_n_0_[19] ),
        .O(o_done_i_4_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    o_done_i_5
       (.I0(o_done_i_8_n_0),
        .I1(\FSM_onehot_s_state_reg_n_0_[11] ),
        .I2(\FSM_onehot_s_state_reg_n_0_[14] ),
        .I3(\FSM_onehot_s_state_reg_n_0_[10] ),
        .I4(\FSM_onehot_s_state_reg_n_0_[15] ),
        .I5(\FSM_onehot_s_state_reg_n_0_[18] ),
        .O(o_done_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hBBB8)) 
    o_done_i_6
       (.I0(o_done_i_8_n_0),
        .I1(p_0_in),
        .I2(o_done_i_7_n_0),
        .I3(\FSM_onehot_s_state_reg_n_0_[1] ),
        .O(o_done_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    o_done_i_7
       (.I0(\FSM_onehot_s_state_reg_n_0_[13] ),
        .I1(\FSM_onehot_s_state_reg_n_0_[5] ),
        .I2(\FSM_onehot_s_state_reg_n_0_[9] ),
        .I3(\FSM_onehot_s_state_reg_n_0_[21] ),
        .I4(\FSM_onehot_s_state_reg_n_0_[17] ),
        .O(o_done_i_7_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    o_done_i_8
       (.I0(\FSM_onehot_s_state_reg_n_0_[20] ),
        .I1(\FSM_onehot_s_state_reg_n_0_[24] ),
        .I2(\FSM_onehot_s_state_reg_n_0_[12] ),
        .I3(\FSM_onehot_s_state_reg_n_0_[16] ),
        .I4(\FSM_onehot_s_state_reg_n_0_[8] ),
        .I5(\FSM_onehot_s_state_reg_n_0_[4] ),
        .O(o_done_i_8_n_0));
  FDRE o_done_reg
       (.C(i_clk),
        .CE(1'b1),
        .D(o_done_i_2_n_0),
        .Q(o_done),
        .R(o_done_i_1_n_0));
  LUT4 #(
    .INIT(16'h4000)) 
    o_done_temp_i_1
       (.I0(o_done_temp_i_2_n_0),
        .I1(o_done_temp_i_3_n_0),
        .I2(o_done_temp_i_4_n_0),
        .I3(o_done_temp_i_5_n_0),
        .O(eqOp));
  LUT5 #(
    .INIT(32'hFFFEFFFF)) 
    o_done_temp_i_2
       (.I0(s_compteur_reg[5]),
        .I1(s_compteur_reg[7]),
        .I2(s_compteur_reg[8]),
        .I3(s_compteur_reg[14]),
        .I4(o_done_temp_i_6_n_0),
        .O(o_done_temp_i_2_n_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    o_done_temp_i_3
       (.I0(s_compteur_reg[27]),
        .I1(s_compteur_reg[28]),
        .I2(s_compteur_reg[31]),
        .I3(s_compteur_reg[30]),
        .I4(o_done_temp_i_7_n_0),
        .O(o_done_temp_i_3_n_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    o_done_temp_i_4
       (.I0(s_compteur_reg[1]),
        .I1(s_compteur_reg[2]),
        .I2(s_compteur_reg[3]),
        .I3(s_compteur_reg[4]),
        .I4(o_done_temp_i_8_n_0),
        .O(o_done_temp_i_4_n_0));
  LUT5 #(
    .INIT(32'h00008000)) 
    o_done_temp_i_5
       (.I0(s_compteur_reg[15]),
        .I1(s_compteur_reg[22]),
        .I2(s_compteur_reg[12]),
        .I3(s_compteur_reg[13]),
        .I4(o_done_temp_i_9_n_0),
        .O(o_done_temp_i_5_n_0));
  LUT4 #(
    .INIT(16'h0001)) 
    o_done_temp_i_6
       (.I0(s_compteur_reg[19]),
        .I1(s_compteur_reg[18]),
        .I2(s_compteur_reg[17]),
        .I3(s_compteur_reg[16]),
        .O(o_done_temp_i_6_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    o_done_temp_i_7
       (.I0(s_compteur_reg[21]),
        .I1(s_compteur_reg[20]),
        .I2(s_compteur_reg[25]),
        .I3(s_compteur_reg[23]),
        .O(o_done_temp_i_7_n_0));
  LUT4 #(
    .INIT(16'hF7FF)) 
    o_done_temp_i_8
       (.I0(s_compteur_reg[26]),
        .I1(s_compteur_reg[24]),
        .I2(s_compteur_reg[0]),
        .I3(s_compteur_reg[29]),
        .O(o_done_temp_i_8_n_0));
  LUT4 #(
    .INIT(16'h7FFF)) 
    o_done_temp_i_9
       (.I0(s_compteur_reg[9]),
        .I1(s_compteur_reg[6]),
        .I2(s_compteur_reg[11]),
        .I3(s_compteur_reg[10]),
        .O(o_done_temp_i_9_n_0));
  FDRE o_done_temp_reg
       (.C(i_clk),
        .CE(1'b1),
        .D(eqOp),
        .Q(o_done_temp),
        .R(o_done_i_1_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \o_m1[3]_i_1 
       (.I0(\FSM_onehot_s_state_reg_n_0_[0] ),
        .I1(\FSM_onehot_s_state_reg_n_0_[3] ),
        .I2(\FSM_onehot_s_state_reg_n_0_[4] ),
        .I3(\FSM_onehot_s_state_reg_n_0_[2] ),
        .I4(\FSM_onehot_s_state_reg_n_0_[1] ),
        .O(\o_m1[3]_i_1_n_0 ));
  FDRE \o_m1_reg[0] 
       (.C(i_clk),
        .CE(\o_m1[3]_i_1_n_0 ),
        .D(\FSM_onehot_s_state_reg_n_0_[4] ),
        .Q(o_m1[0]),
        .R(o_done_i_1_n_0));
  FDRE \o_m1_reg[1] 
       (.C(i_clk),
        .CE(\o_m1[3]_i_1_n_0 ),
        .D(\FSM_onehot_s_state_reg_n_0_[3] ),
        .Q(o_m1[1]),
        .R(o_done_i_1_n_0));
  FDRE \o_m1_reg[2] 
       (.C(i_clk),
        .CE(\o_m1[3]_i_1_n_0 ),
        .D(\FSM_onehot_s_state_reg_n_0_[2] ),
        .Q(o_m1[2]),
        .R(o_done_i_1_n_0));
  FDRE \o_m1_reg[3] 
       (.C(i_clk),
        .CE(\o_m1[3]_i_1_n_0 ),
        .D(\FSM_onehot_s_state_reg_n_0_[1] ),
        .Q(o_m1[3]),
        .R(o_done_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \o_m2[3]_i_1 
       (.I0(\FSM_onehot_s_state_reg_n_0_[0] ),
        .I1(\FSM_onehot_s_state_reg_n_0_[6] ),
        .I2(\FSM_onehot_s_state_reg_n_0_[7] ),
        .I3(\FSM_onehot_s_state_reg_n_0_[5] ),
        .I4(\FSM_onehot_s_state_reg_n_0_[9] ),
        .I5(\FSM_onehot_s_state_reg_n_0_[8] ),
        .O(\o_m2[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \o_m2[3]_i_2 
       (.I0(\FSM_onehot_s_state_reg_n_0_[5] ),
        .I1(\FSM_onehot_s_state_reg_n_0_[9] ),
        .O(\o_m2[3]_i_2_n_0 ));
  FDRE \o_m2_reg[0] 
       (.C(i_clk),
        .CE(\o_m2[3]_i_1_n_0 ),
        .D(\FSM_onehot_s_state_reg_n_0_[8] ),
        .Q(o_m2[0]),
        .R(o_done_i_1_n_0));
  FDRE \o_m2_reg[1] 
       (.C(i_clk),
        .CE(\o_m2[3]_i_1_n_0 ),
        .D(\FSM_onehot_s_state_reg_n_0_[7] ),
        .Q(o_m2[1]),
        .R(o_done_i_1_n_0));
  FDRE \o_m2_reg[2] 
       (.C(i_clk),
        .CE(\o_m2[3]_i_1_n_0 ),
        .D(\FSM_onehot_s_state_reg_n_0_[6] ),
        .Q(o_m2[2]),
        .R(o_done_i_1_n_0));
  FDRE \o_m2_reg[3] 
       (.C(i_clk),
        .CE(\o_m2[3]_i_1_n_0 ),
        .D(\o_m2[3]_i_2_n_0 ),
        .Q(o_m2[3]),
        .R(o_done_i_1_n_0));
  LUT5 #(
    .INIT(32'hF0F1F0F0)) 
    \o_m3[0]_i_1 
       (.I0(\FSM_onehot_s_state_reg_n_0_[10] ),
        .I1(\FSM_onehot_s_state_reg_n_0_[0] ),
        .I2(\FSM_onehot_s_state_reg_n_0_[12] ),
        .I3(\FSM_onehot_s_state_reg_n_0_[11] ),
        .I4(o_m3[0]),
        .O(\o_m3[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFF01FF00)) 
    \o_m3[1]_i_1 
       (.I0(\FSM_onehot_s_state_reg_n_0_[10] ),
        .I1(\FSM_onehot_s_state_reg_n_0_[0] ),
        .I2(\FSM_onehot_s_state_reg_n_0_[12] ),
        .I3(\FSM_onehot_s_state_reg_n_0_[11] ),
        .I4(o_m3[1]),
        .O(\o_m3[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAABAAAA)) 
    \o_m3[2]_i_1 
       (.I0(\FSM_onehot_s_state_reg_n_0_[10] ),
        .I1(\FSM_onehot_s_state_reg_n_0_[0] ),
        .I2(\FSM_onehot_s_state_reg_n_0_[12] ),
        .I3(\FSM_onehot_s_state_reg_n_0_[11] ),
        .I4(o_m3[2]),
        .O(\o_m3[2]_i_1_n_0 ));
  FDRE \o_m3_reg[0] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\o_m3[0]_i_1_n_0 ),
        .Q(o_m3[0]),
        .R(o_done_i_1_n_0));
  FDRE \o_m3_reg[1] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\o_m3[1]_i_1_n_0 ),
        .Q(o_m3[1]),
        .R(o_done_i_1_n_0));
  FDRE \o_m3_reg[2] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\o_m3[2]_i_1_n_0 ),
        .Q(o_m3[2]),
        .R(o_done_i_1_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \o_m4[3]_i_1 
       (.I0(\FSM_onehot_s_state_reg_n_0_[0] ),
        .I1(\FSM_onehot_s_state_reg_n_0_[15] ),
        .I2(\FSM_onehot_s_state_reg_n_0_[16] ),
        .I3(\FSM_onehot_s_state_reg_n_0_[14] ),
        .I4(\FSM_onehot_s_state_reg_n_0_[13] ),
        .O(\o_m4[3]_i_1_n_0 ));
  FDRE \o_m4_reg[0] 
       (.C(i_clk),
        .CE(\o_m4[3]_i_1_n_0 ),
        .D(\FSM_onehot_s_state_reg_n_0_[16] ),
        .Q(o_m4[0]),
        .R(o_done_i_1_n_0));
  FDRE \o_m4_reg[1] 
       (.C(i_clk),
        .CE(\o_m4[3]_i_1_n_0 ),
        .D(\FSM_onehot_s_state_reg_n_0_[15] ),
        .Q(o_m4[1]),
        .R(o_done_i_1_n_0));
  FDRE \o_m4_reg[2] 
       (.C(i_clk),
        .CE(\o_m4[3]_i_1_n_0 ),
        .D(\FSM_onehot_s_state_reg_n_0_[14] ),
        .Q(o_m4[2]),
        .R(o_done_i_1_n_0));
  FDRE \o_m4_reg[3] 
       (.C(i_clk),
        .CE(\o_m4[3]_i_1_n_0 ),
        .D(\FSM_onehot_s_state_reg_n_0_[13] ),
        .Q(o_m4[3]),
        .R(o_done_i_1_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \o_m5[3]_i_1 
       (.I0(\FSM_onehot_s_state_reg_n_0_[0] ),
        .I1(\FSM_onehot_s_state_reg_n_0_[19] ),
        .I2(\FSM_onehot_s_state_reg_n_0_[20] ),
        .I3(\FSM_onehot_s_state_reg_n_0_[18] ),
        .I4(\FSM_onehot_s_state_reg_n_0_[17] ),
        .O(\o_m5[3]_i_1_n_0 ));
  FDRE \o_m5_reg[0] 
       (.C(i_clk),
        .CE(\o_m5[3]_i_1_n_0 ),
        .D(\FSM_onehot_s_state_reg_n_0_[20] ),
        .Q(o_m5[0]),
        .R(o_done_i_1_n_0));
  FDRE \o_m5_reg[1] 
       (.C(i_clk),
        .CE(\o_m5[3]_i_1_n_0 ),
        .D(\FSM_onehot_s_state_reg_n_0_[19] ),
        .Q(o_m5[1]),
        .R(o_done_i_1_n_0));
  FDRE \o_m5_reg[2] 
       (.C(i_clk),
        .CE(\o_m5[3]_i_1_n_0 ),
        .D(\FSM_onehot_s_state_reg_n_0_[18] ),
        .Q(o_m5[2]),
        .R(o_done_i_1_n_0));
  FDRE \o_m5_reg[3] 
       (.C(i_clk),
        .CE(\o_m5[3]_i_1_n_0 ),
        .D(\FSM_onehot_s_state_reg_n_0_[17] ),
        .Q(o_m5[3]),
        .R(o_done_i_1_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \o_m6[3]_i_1 
       (.I0(\FSM_onehot_s_state_reg_n_0_[0] ),
        .I1(\FSM_onehot_s_state_reg_n_0_[23] ),
        .I2(\FSM_onehot_s_state_reg_n_0_[24] ),
        .I3(\FSM_onehot_s_state_reg_n_0_[22] ),
        .I4(\FSM_onehot_s_state_reg_n_0_[21] ),
        .O(\o_m6[3]_i_1_n_0 ));
  FDRE \o_m6_reg[0] 
       (.C(i_clk),
        .CE(\o_m6[3]_i_1_n_0 ),
        .D(\FSM_onehot_s_state_reg_n_0_[24] ),
        .Q(o_m6[0]),
        .R(o_done_i_1_n_0));
  FDRE \o_m6_reg[1] 
       (.C(i_clk),
        .CE(\o_m6[3]_i_1_n_0 ),
        .D(\FSM_onehot_s_state_reg_n_0_[23] ),
        .Q(o_m6[1]),
        .R(o_done_i_1_n_0));
  FDRE \o_m6_reg[2] 
       (.C(i_clk),
        .CE(\o_m6[3]_i_1_n_0 ),
        .D(\FSM_onehot_s_state_reg_n_0_[22] ),
        .Q(o_m6[2]),
        .R(o_done_i_1_n_0));
  FDRE \o_m6_reg[3] 
       (.C(i_clk),
        .CE(\o_m6[3]_i_1_n_0 ),
        .D(\FSM_onehot_s_state_reg_n_0_[21] ),
        .Q(o_m6[3]),
        .R(o_done_i_1_n_0));
  FDRE \s_cmd_d_reg[0] 
       (.C(i_clk),
        .CE(1'b1),
        .D(i_cmd[0]),
        .Q(\s_cmd_d_reg_n_0_[0] ),
        .R(o_done_i_1_n_0));
  FDRE \s_cmd_d_reg[1] 
       (.C(i_clk),
        .CE(1'b1),
        .D(i_cmd[1]),
        .Q(\s_cmd_d_reg_n_0_[1] ),
        .R(o_done_i_1_n_0));
  FDRE \s_cmd_d_reg[2] 
       (.C(i_clk),
        .CE(1'b1),
        .D(i_cmd[2]),
        .Q(\s_cmd_d_reg_n_0_[2] ),
        .R(o_done_i_1_n_0));
  FDRE \s_cmd_d_reg[3] 
       (.C(i_clk),
        .CE(1'b1),
        .D(i_cmd[3]),
        .Q(p_0_in),
        .R(o_done_i_1_n_0));
  LUT5 #(
    .INIT(32'h0080FFFF)) 
    \s_compteur[0]_i_1 
       (.I0(o_done_temp_i_5_n_0),
        .I1(o_done_temp_i_4_n_0),
        .I2(o_done_temp_i_3_n_0),
        .I3(o_done_temp_i_2_n_0),
        .I4(i_rst),
        .O(\s_compteur[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \s_compteur[0]_i_3 
       (.I0(s_compteur_reg[0]),
        .O(\s_compteur[0]_i_3_n_0 ));
  FDRE \s_compteur_reg[0] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[0]_i_2_n_7 ),
        .Q(s_compteur_reg[0]),
        .R(\s_compteur[0]_i_1_n_0 ));
  CARRY4 \s_compteur_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\s_compteur_reg[0]_i_2_n_0 ,\s_compteur_reg[0]_i_2_n_1 ,\s_compteur_reg[0]_i_2_n_2 ,\s_compteur_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\s_compteur_reg[0]_i_2_n_4 ,\s_compteur_reg[0]_i_2_n_5 ,\s_compteur_reg[0]_i_2_n_6 ,\s_compteur_reg[0]_i_2_n_7 }),
        .S({s_compteur_reg[3:1],\s_compteur[0]_i_3_n_0 }));
  FDRE \s_compteur_reg[10] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[8]_i_1_n_5 ),
        .Q(s_compteur_reg[10]),
        .R(\s_compteur[0]_i_1_n_0 ));
  FDRE \s_compteur_reg[11] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[8]_i_1_n_4 ),
        .Q(s_compteur_reg[11]),
        .R(\s_compteur[0]_i_1_n_0 ));
  FDRE \s_compteur_reg[12] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[12]_i_1_n_7 ),
        .Q(s_compteur_reg[12]),
        .R(\s_compteur[0]_i_1_n_0 ));
  CARRY4 \s_compteur_reg[12]_i_1 
       (.CI(\s_compteur_reg[8]_i_1_n_0 ),
        .CO({\s_compteur_reg[12]_i_1_n_0 ,\s_compteur_reg[12]_i_1_n_1 ,\s_compteur_reg[12]_i_1_n_2 ,\s_compteur_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\s_compteur_reg[12]_i_1_n_4 ,\s_compteur_reg[12]_i_1_n_5 ,\s_compteur_reg[12]_i_1_n_6 ,\s_compteur_reg[12]_i_1_n_7 }),
        .S(s_compteur_reg[15:12]));
  FDRE \s_compteur_reg[13] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[12]_i_1_n_6 ),
        .Q(s_compteur_reg[13]),
        .R(\s_compteur[0]_i_1_n_0 ));
  FDRE \s_compteur_reg[14] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[12]_i_1_n_5 ),
        .Q(s_compteur_reg[14]),
        .R(\s_compteur[0]_i_1_n_0 ));
  FDRE \s_compteur_reg[15] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[12]_i_1_n_4 ),
        .Q(s_compteur_reg[15]),
        .R(\s_compteur[0]_i_1_n_0 ));
  FDRE \s_compteur_reg[16] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[16]_i_1_n_7 ),
        .Q(s_compteur_reg[16]),
        .R(\s_compteur[0]_i_1_n_0 ));
  CARRY4 \s_compteur_reg[16]_i_1 
       (.CI(\s_compteur_reg[12]_i_1_n_0 ),
        .CO({\s_compteur_reg[16]_i_1_n_0 ,\s_compteur_reg[16]_i_1_n_1 ,\s_compteur_reg[16]_i_1_n_2 ,\s_compteur_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\s_compteur_reg[16]_i_1_n_4 ,\s_compteur_reg[16]_i_1_n_5 ,\s_compteur_reg[16]_i_1_n_6 ,\s_compteur_reg[16]_i_1_n_7 }),
        .S(s_compteur_reg[19:16]));
  FDRE \s_compteur_reg[17] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[16]_i_1_n_6 ),
        .Q(s_compteur_reg[17]),
        .R(\s_compteur[0]_i_1_n_0 ));
  FDRE \s_compteur_reg[18] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[16]_i_1_n_5 ),
        .Q(s_compteur_reg[18]),
        .R(\s_compteur[0]_i_1_n_0 ));
  FDRE \s_compteur_reg[19] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[16]_i_1_n_4 ),
        .Q(s_compteur_reg[19]),
        .R(\s_compteur[0]_i_1_n_0 ));
  FDRE \s_compteur_reg[1] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[0]_i_2_n_6 ),
        .Q(s_compteur_reg[1]),
        .R(\s_compteur[0]_i_1_n_0 ));
  FDRE \s_compteur_reg[20] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[20]_i_1_n_7 ),
        .Q(s_compteur_reg[20]),
        .R(\s_compteur[0]_i_1_n_0 ));
  CARRY4 \s_compteur_reg[20]_i_1 
       (.CI(\s_compteur_reg[16]_i_1_n_0 ),
        .CO({\s_compteur_reg[20]_i_1_n_0 ,\s_compteur_reg[20]_i_1_n_1 ,\s_compteur_reg[20]_i_1_n_2 ,\s_compteur_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\s_compteur_reg[20]_i_1_n_4 ,\s_compteur_reg[20]_i_1_n_5 ,\s_compteur_reg[20]_i_1_n_6 ,\s_compteur_reg[20]_i_1_n_7 }),
        .S(s_compteur_reg[23:20]));
  FDRE \s_compteur_reg[21] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[20]_i_1_n_6 ),
        .Q(s_compteur_reg[21]),
        .R(\s_compteur[0]_i_1_n_0 ));
  FDRE \s_compteur_reg[22] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[20]_i_1_n_5 ),
        .Q(s_compteur_reg[22]),
        .R(\s_compteur[0]_i_1_n_0 ));
  FDRE \s_compteur_reg[23] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[20]_i_1_n_4 ),
        .Q(s_compteur_reg[23]),
        .R(\s_compteur[0]_i_1_n_0 ));
  FDRE \s_compteur_reg[24] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[24]_i_1_n_7 ),
        .Q(s_compteur_reg[24]),
        .R(\s_compteur[0]_i_1_n_0 ));
  CARRY4 \s_compteur_reg[24]_i_1 
       (.CI(\s_compteur_reg[20]_i_1_n_0 ),
        .CO({\s_compteur_reg[24]_i_1_n_0 ,\s_compteur_reg[24]_i_1_n_1 ,\s_compteur_reg[24]_i_1_n_2 ,\s_compteur_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\s_compteur_reg[24]_i_1_n_4 ,\s_compteur_reg[24]_i_1_n_5 ,\s_compteur_reg[24]_i_1_n_6 ,\s_compteur_reg[24]_i_1_n_7 }),
        .S(s_compteur_reg[27:24]));
  FDRE \s_compteur_reg[25] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[24]_i_1_n_6 ),
        .Q(s_compteur_reg[25]),
        .R(\s_compteur[0]_i_1_n_0 ));
  FDRE \s_compteur_reg[26] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[24]_i_1_n_5 ),
        .Q(s_compteur_reg[26]),
        .R(\s_compteur[0]_i_1_n_0 ));
  FDRE \s_compteur_reg[27] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[24]_i_1_n_4 ),
        .Q(s_compteur_reg[27]),
        .R(\s_compteur[0]_i_1_n_0 ));
  FDRE \s_compteur_reg[28] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[28]_i_1_n_7 ),
        .Q(s_compteur_reg[28]),
        .R(\s_compteur[0]_i_1_n_0 ));
  CARRY4 \s_compteur_reg[28]_i_1 
       (.CI(\s_compteur_reg[24]_i_1_n_0 ),
        .CO({\NLW_s_compteur_reg[28]_i_1_CO_UNCONNECTED [3],\s_compteur_reg[28]_i_1_n_1 ,\s_compteur_reg[28]_i_1_n_2 ,\s_compteur_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\s_compteur_reg[28]_i_1_n_4 ,\s_compteur_reg[28]_i_1_n_5 ,\s_compteur_reg[28]_i_1_n_6 ,\s_compteur_reg[28]_i_1_n_7 }),
        .S(s_compteur_reg[31:28]));
  FDRE \s_compteur_reg[29] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[28]_i_1_n_6 ),
        .Q(s_compteur_reg[29]),
        .R(\s_compteur[0]_i_1_n_0 ));
  FDRE \s_compteur_reg[2] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[0]_i_2_n_5 ),
        .Q(s_compteur_reg[2]),
        .R(\s_compteur[0]_i_1_n_0 ));
  FDRE \s_compteur_reg[30] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[28]_i_1_n_5 ),
        .Q(s_compteur_reg[30]),
        .R(\s_compteur[0]_i_1_n_0 ));
  FDRE \s_compteur_reg[31] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[28]_i_1_n_4 ),
        .Q(s_compteur_reg[31]),
        .R(\s_compteur[0]_i_1_n_0 ));
  FDRE \s_compteur_reg[3] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[0]_i_2_n_4 ),
        .Q(s_compteur_reg[3]),
        .R(\s_compteur[0]_i_1_n_0 ));
  FDRE \s_compteur_reg[4] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[4]_i_1_n_7 ),
        .Q(s_compteur_reg[4]),
        .R(\s_compteur[0]_i_1_n_0 ));
  CARRY4 \s_compteur_reg[4]_i_1 
       (.CI(\s_compteur_reg[0]_i_2_n_0 ),
        .CO({\s_compteur_reg[4]_i_1_n_0 ,\s_compteur_reg[4]_i_1_n_1 ,\s_compteur_reg[4]_i_1_n_2 ,\s_compteur_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\s_compteur_reg[4]_i_1_n_4 ,\s_compteur_reg[4]_i_1_n_5 ,\s_compteur_reg[4]_i_1_n_6 ,\s_compteur_reg[4]_i_1_n_7 }),
        .S(s_compteur_reg[7:4]));
  FDRE \s_compteur_reg[5] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[4]_i_1_n_6 ),
        .Q(s_compteur_reg[5]),
        .R(\s_compteur[0]_i_1_n_0 ));
  FDRE \s_compteur_reg[6] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[4]_i_1_n_5 ),
        .Q(s_compteur_reg[6]),
        .R(\s_compteur[0]_i_1_n_0 ));
  FDRE \s_compteur_reg[7] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[4]_i_1_n_4 ),
        .Q(s_compteur_reg[7]),
        .R(\s_compteur[0]_i_1_n_0 ));
  FDRE \s_compteur_reg[8] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[8]_i_1_n_7 ),
        .Q(s_compteur_reg[8]),
        .R(\s_compteur[0]_i_1_n_0 ));
  CARRY4 \s_compteur_reg[8]_i_1 
       (.CI(\s_compteur_reg[4]_i_1_n_0 ),
        .CO({\s_compteur_reg[8]_i_1_n_0 ,\s_compteur_reg[8]_i_1_n_1 ,\s_compteur_reg[8]_i_1_n_2 ,\s_compteur_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\s_compteur_reg[8]_i_1_n_4 ,\s_compteur_reg[8]_i_1_n_5 ,\s_compteur_reg[8]_i_1_n_6 ,\s_compteur_reg[8]_i_1_n_7 }),
        .S(s_compteur_reg[11:8]));
  FDRE \s_compteur_reg[9] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\s_compteur_reg[8]_i_1_n_6 ),
        .Q(s_compteur_reg[9]),
        .R(\s_compteur[0]_i_1_n_0 ));
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
