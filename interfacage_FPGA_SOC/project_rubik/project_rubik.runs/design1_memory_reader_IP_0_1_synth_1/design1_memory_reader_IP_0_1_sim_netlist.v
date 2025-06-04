// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Sun May 18 18:29:30 2025
// Host        : LAPTOP-N4P3CLBG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design1_memory_reader_IP_0_1_sim_netlist.v
// Design      : design1_memory_reader_IP_0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design1_memory_reader_IP_0_1,memory_reader_IP,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "memory_reader_IP,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (i_clk,
    i_rst,
    i_go,
    i_done,
    o_cmd,
    o_new,
    bram_addr,
    bram_clk,
    bram_din,
    bram_dout,
    bram_en,
    bram_rst,
    bram_we);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 i_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME i_clk, ASSOCIATED_RESET i_rst, FREQ_HZ 50000000, PHASE 0.000, CLK_DOMAIN design1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input i_clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 i_rst RST" *) (* x_interface_parameter = "XIL_INTERFACENAME i_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input i_rst;
  input i_go;
  input i_done;
  output [3:0]o_cmd;
  output o_new;
  output [31:0]bram_addr;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 bram_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME bram_clk, ASSOCIATED_RESET bram_rst, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design1_memory_reader_IP_0_1_bram_clk, INSERT_VIP 0" *) output bram_clk;
  input [31:0]bram_din;
  output [31:0]bram_dout;
  output bram_en;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 bram_rst RST" *) (* x_interface_parameter = "XIL_INTERFACENAME bram_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) output bram_rst;
  output [3:0]bram_we;

  wire \<const0> ;
  wire \<const1> ;
  wire [31:1]\^bram_addr ;
  wire [31:0]bram_din;
  wire i_clk;
  wire i_done;
  wire i_go;
  wire i_rst;
  wire [3:0]o_cmd;
  wire o_new;

  assign bram_addr[31:1] = \^bram_addr [31:1];
  assign bram_addr[0] = \<const0> ;
  assign bram_clk = i_clk;
  assign bram_dout[31] = \<const0> ;
  assign bram_dout[30] = \<const0> ;
  assign bram_dout[29] = \<const0> ;
  assign bram_dout[28] = \<const0> ;
  assign bram_dout[27] = \<const0> ;
  assign bram_dout[26] = \<const0> ;
  assign bram_dout[25] = \<const0> ;
  assign bram_dout[24] = \<const0> ;
  assign bram_dout[23] = \<const0> ;
  assign bram_dout[22] = \<const0> ;
  assign bram_dout[21] = \<const0> ;
  assign bram_dout[20] = \<const0> ;
  assign bram_dout[19] = \<const0> ;
  assign bram_dout[18] = \<const0> ;
  assign bram_dout[17] = \<const0> ;
  assign bram_dout[16] = \<const0> ;
  assign bram_dout[15] = \<const0> ;
  assign bram_dout[14] = \<const0> ;
  assign bram_dout[13] = \<const0> ;
  assign bram_dout[12] = \<const0> ;
  assign bram_dout[11] = \<const0> ;
  assign bram_dout[10] = \<const0> ;
  assign bram_dout[9] = \<const0> ;
  assign bram_dout[8] = \<const0> ;
  assign bram_dout[7] = \<const0> ;
  assign bram_dout[6] = \<const0> ;
  assign bram_dout[5] = \<const0> ;
  assign bram_dout[4] = \<const0> ;
  assign bram_dout[3] = \<const0> ;
  assign bram_dout[2] = \<const0> ;
  assign bram_dout[1] = \<const0> ;
  assign bram_dout[0] = \<const0> ;
  assign bram_en = \<const1> ;
  assign bram_rst = \<const0> ;
  assign bram_we[3] = \<const0> ;
  assign bram_we[2] = \<const0> ;
  assign bram_we[1] = \<const0> ;
  assign bram_we[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_memory_reader_IP U0
       (.bram_addr(\^bram_addr ),
        .bram_din(bram_din),
        .i_clk(i_clk),
        .i_done(i_done),
        .i_go(i_go),
        .i_rst(i_rst),
        .o_cmd(o_cmd),
        .o_new(o_new));
  VCC VCC
       (.P(\<const1> ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_memory_reader_IP
   (bram_addr,
    o_cmd,
    o_new,
    i_rst,
    i_clk,
    i_go,
    i_done,
    bram_din);
  output [30:0]bram_addr;
  output [3:0]o_cmd;
  output o_new;
  input i_rst;
  input i_clk;
  input i_go;
  input i_done;
  input [31:0]bram_din;

  wire \FSM_sequential_send_state[0]_i_1_n_0 ;
  wire \FSM_sequential_send_state[1]_i_1_n_0 ;
  wire \FSM_sequential_send_state[1]_i_2_n_0 ;
  wire \FSM_sequential_send_state[1]_i_3_n_0 ;
  wire \FSM_sequential_send_state[1]_i_4_n_0 ;
  wire \FSM_sequential_send_state[1]_i_5_n_0 ;
  wire \FSM_sequential_send_state[1]_i_6_n_0 ;
  wire \FSM_sequential_send_state[1]_i_7_n_0 ;
  wire \FSM_sequential_send_state[1]_i_8_n_0 ;
  wire [30:0]bram_addr;
  wire [31:0]bram_din;
  wire i_clk;
  wire i_done;
  wire i_go;
  wire i_rst;
  wire [31:1]in6;
  wire [3:0]o_cmd;
  wire \o_cmd[0]_i_1_n_0 ;
  wire \o_cmd[1]_i_1_n_0 ;
  wire \o_cmd[2]_i_1_n_0 ;
  wire \o_cmd[3]_i_10_n_0 ;
  wire \o_cmd[3]_i_11_n_0 ;
  wire \o_cmd[3]_i_1_n_0 ;
  wire \o_cmd[3]_i_2_n_0 ;
  wire \o_cmd[3]_i_3_n_0 ;
  wire \o_cmd[3]_i_4_n_0 ;
  wire \o_cmd[3]_i_5_n_0 ;
  wire \o_cmd[3]_i_6_n_0 ;
  wire \o_cmd[3]_i_7_n_0 ;
  wire \o_cmd[3]_i_8_n_0 ;
  wire \o_cmd[3]_i_9_n_0 ;
  wire o_new;
  wire o_new_i_1_n_0;
  wire plusOp_carry__0_n_0;
  wire plusOp_carry__0_n_1;
  wire plusOp_carry__0_n_2;
  wire plusOp_carry__0_n_3;
  wire plusOp_carry__1_n_0;
  wire plusOp_carry__1_n_1;
  wire plusOp_carry__1_n_2;
  wire plusOp_carry__1_n_3;
  wire plusOp_carry__2_n_0;
  wire plusOp_carry__2_n_1;
  wire plusOp_carry__2_n_2;
  wire plusOp_carry__2_n_3;
  wire plusOp_carry__3_n_0;
  wire plusOp_carry__3_n_1;
  wire plusOp_carry__3_n_2;
  wire plusOp_carry__3_n_3;
  wire plusOp_carry__4_n_0;
  wire plusOp_carry__4_n_1;
  wire plusOp_carry__4_n_2;
  wire plusOp_carry__4_n_3;
  wire plusOp_carry__5_n_0;
  wire plusOp_carry__5_n_1;
  wire plusOp_carry__5_n_2;
  wire plusOp_carry__5_n_3;
  wire plusOp_carry__6_n_2;
  wire plusOp_carry__6_n_3;
  wire plusOp_carry_i_1_n_0;
  wire plusOp_carry_n_0;
  wire plusOp_carry_n_1;
  wire plusOp_carry_n_2;
  wire plusOp_carry_n_3;
  wire s_count_addr;
  wire \s_count_addr[10]_i_1_n_0 ;
  wire \s_count_addr[11]_i_1_n_0 ;
  wire \s_count_addr[12]_i_1_n_0 ;
  wire \s_count_addr[13]_i_1_n_0 ;
  wire \s_count_addr[14]_i_1_n_0 ;
  wire \s_count_addr[15]_i_1_n_0 ;
  wire \s_count_addr[16]_i_1_n_0 ;
  wire \s_count_addr[17]_i_1_n_0 ;
  wire \s_count_addr[18]_i_1_n_0 ;
  wire \s_count_addr[19]_i_1_n_0 ;
  wire \s_count_addr[1]_i_1_n_0 ;
  wire \s_count_addr[20]_i_1_n_0 ;
  wire \s_count_addr[21]_i_1_n_0 ;
  wire \s_count_addr[22]_i_1_n_0 ;
  wire \s_count_addr[23]_i_1_n_0 ;
  wire \s_count_addr[24]_i_1_n_0 ;
  wire \s_count_addr[25]_i_1_n_0 ;
  wire \s_count_addr[26]_i_1_n_0 ;
  wire \s_count_addr[27]_i_1_n_0 ;
  wire \s_count_addr[28]_i_1_n_0 ;
  wire \s_count_addr[29]_i_1_n_0 ;
  wire \s_count_addr[2]_i_1_n_0 ;
  wire \s_count_addr[30]_i_1_n_0 ;
  wire \s_count_addr[31]_i_2_n_0 ;
  wire \s_count_addr[3]_i_1_n_0 ;
  wire \s_count_addr[4]_i_1_n_0 ;
  wire \s_count_addr[5]_i_1_n_0 ;
  wire \s_count_addr[6]_i_1_n_0 ;
  wire \s_count_addr[7]_i_1_n_0 ;
  wire \s_count_addr[8]_i_1_n_0 ;
  wire \s_count_addr[9]_i_1_n_0 ;
  wire [1:0]send_state;
  wire [3:2]NLW_plusOp_carry__6_CO_UNCONNECTED;
  wire [3:3]NLW_plusOp_carry__6_O_UNCONNECTED;

  LUT6 #(
    .INIT(64'hE6A6E6E600000000)) 
    \FSM_sequential_send_state[0]_i_1 
       (.I0(send_state[0]),
        .I1(\FSM_sequential_send_state[1]_i_2_n_0 ),
        .I2(send_state[1]),
        .I3(\FSM_sequential_send_state[1]_i_3_n_0 ),
        .I4(\FSM_sequential_send_state[1]_i_4_n_0 ),
        .I5(i_rst),
        .O(\FSM_sequential_send_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6666A2AA00000000)) 
    \FSM_sequential_send_state[1]_i_1 
       (.I0(send_state[1]),
        .I1(\FSM_sequential_send_state[1]_i_2_n_0 ),
        .I2(\FSM_sequential_send_state[1]_i_3_n_0 ),
        .I3(\FSM_sequential_send_state[1]_i_4_n_0 ),
        .I4(send_state[0]),
        .I5(i_rst),
        .O(\FSM_sequential_send_state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hFE5E)) 
    \FSM_sequential_send_state[1]_i_2 
       (.I0(send_state[0]),
        .I1(i_go),
        .I2(send_state[1]),
        .I3(i_done),
        .O(\FSM_sequential_send_state[1]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFBFF)) 
    \FSM_sequential_send_state[1]_i_3 
       (.I0(\o_cmd[3]_i_11_n_0 ),
        .I1(\FSM_sequential_send_state[1]_i_5_n_0 ),
        .I2(\o_cmd[3]_i_10_n_0 ),
        .I3(\FSM_sequential_send_state[1]_i_6_n_0 ),
        .O(\FSM_sequential_send_state[1]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \FSM_sequential_send_state[1]_i_4 
       (.I0(\o_cmd[3]_i_9_n_0 ),
        .I1(\FSM_sequential_send_state[1]_i_7_n_0 ),
        .I2(\o_cmd[3]_i_8_n_0 ),
        .I3(\FSM_sequential_send_state[1]_i_8_n_0 ),
        .O(\FSM_sequential_send_state[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \FSM_sequential_send_state[1]_i_5 
       (.I0(bram_din[12]),
        .I1(bram_din[9]),
        .I2(bram_din[16]),
        .I3(bram_din[14]),
        .O(\FSM_sequential_send_state[1]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_sequential_send_state[1]_i_6 
       (.I0(bram_din[5]),
        .I1(bram_din[3]),
        .I2(bram_din[1]),
        .I3(bram_din[0]),
        .O(\FSM_sequential_send_state[1]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_sequential_send_state[1]_i_7 
       (.I0(bram_din[31]),
        .I1(bram_din[29]),
        .I2(bram_din[28]),
        .I3(bram_din[25]),
        .O(\FSM_sequential_send_state[1]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_sequential_send_state[1]_i_8 
       (.I0(bram_din[13]),
        .I1(bram_din[11]),
        .I2(bram_din[10]),
        .I3(bram_din[7]),
        .O(\FSM_sequential_send_state[1]_i_8_n_0 ));
  (* FSM_ENCODED_STATES = "wait_read:01,reading:10,sending:11,idle:00" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_send_state_reg[0] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_sequential_send_state[0]_i_1_n_0 ),
        .Q(send_state[0]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "wait_read:01,reading:10,sending:11,idle:00" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_send_state_reg[1] 
       (.C(i_clk),
        .CE(1'b1),
        .D(\FSM_sequential_send_state[1]_i_1_n_0 ),
        .Q(send_state[1]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h8AAAAAAA00000000)) 
    \o_cmd[0]_i_1 
       (.I0(send_state[1]),
        .I1(\o_cmd[3]_i_4_n_0 ),
        .I2(\o_cmd[3]_i_5_n_0 ),
        .I3(\o_cmd[3]_i_6_n_0 ),
        .I4(\o_cmd[3]_i_7_n_0 ),
        .I5(bram_din[0]),
        .O(\o_cmd[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8AAAAAAA00000000)) 
    \o_cmd[1]_i_1 
       (.I0(send_state[1]),
        .I1(\o_cmd[3]_i_4_n_0 ),
        .I2(\o_cmd[3]_i_5_n_0 ),
        .I3(\o_cmd[3]_i_6_n_0 ),
        .I4(\o_cmd[3]_i_7_n_0 ),
        .I5(bram_din[1]),
        .O(\o_cmd[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8AAAAAAA00000000)) 
    \o_cmd[2]_i_1 
       (.I0(send_state[1]),
        .I1(\o_cmd[3]_i_4_n_0 ),
        .I2(\o_cmd[3]_i_5_n_0 ),
        .I3(\o_cmd[3]_i_6_n_0 ),
        .I4(\o_cmd[3]_i_7_n_0 ),
        .I5(bram_din[2]),
        .O(\o_cmd[2]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \o_cmd[3]_i_1 
       (.I0(i_rst),
        .O(\o_cmd[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \o_cmd[3]_i_10 
       (.I0(bram_din[26]),
        .I1(bram_din[22]),
        .I2(bram_din[30]),
        .I3(bram_din[27]),
        .O(\o_cmd[3]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \o_cmd[3]_i_11 
       (.I0(bram_din[4]),
        .I1(bram_din[2]),
        .I2(bram_din[8]),
        .I3(bram_din[6]),
        .O(\o_cmd[3]_i_11_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \o_cmd[3]_i_2 
       (.I0(send_state[0]),
        .O(\o_cmd[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8AAAAAAA00000000)) 
    \o_cmd[3]_i_3 
       (.I0(send_state[1]),
        .I1(\o_cmd[3]_i_4_n_0 ),
        .I2(\o_cmd[3]_i_5_n_0 ),
        .I3(\o_cmd[3]_i_6_n_0 ),
        .I4(\o_cmd[3]_i_7_n_0 ),
        .I5(bram_din[3]),
        .O(\o_cmd[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hFFFEFFFF)) 
    \o_cmd[3]_i_4 
       (.I0(bram_din[7]),
        .I1(bram_din[10]),
        .I2(bram_din[11]),
        .I3(bram_din[13]),
        .I4(\o_cmd[3]_i_8_n_0 ),
        .O(\o_cmd[3]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \o_cmd[3]_i_5 
       (.I0(bram_din[25]),
        .I1(bram_din[28]),
        .I2(bram_din[29]),
        .I3(bram_din[31]),
        .I4(\o_cmd[3]_i_9_n_0 ),
        .O(\o_cmd[3]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \o_cmd[3]_i_6 
       (.I0(bram_din[0]),
        .I1(bram_din[1]),
        .I2(bram_din[3]),
        .I3(bram_din[5]),
        .I4(\o_cmd[3]_i_10_n_0 ),
        .O(\o_cmd[3]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00008000)) 
    \o_cmd[3]_i_7 
       (.I0(bram_din[14]),
        .I1(bram_din[16]),
        .I2(bram_din[9]),
        .I3(bram_din[12]),
        .I4(\o_cmd[3]_i_11_n_0 ),
        .O(\o_cmd[3]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \o_cmd[3]_i_8 
       (.I0(bram_din[19]),
        .I1(bram_din[18]),
        .I2(bram_din[17]),
        .I3(bram_din[15]),
        .O(\o_cmd[3]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \o_cmd[3]_i_9 
       (.I0(bram_din[21]),
        .I1(bram_din[20]),
        .I2(bram_din[24]),
        .I3(bram_din[23]),
        .O(\o_cmd[3]_i_9_n_0 ));
  FDRE \o_cmd_reg[0] 
       (.C(i_clk),
        .CE(\o_cmd[3]_i_2_n_0 ),
        .D(\o_cmd[0]_i_1_n_0 ),
        .Q(o_cmd[0]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \o_cmd_reg[1] 
       (.C(i_clk),
        .CE(\o_cmd[3]_i_2_n_0 ),
        .D(\o_cmd[1]_i_1_n_0 ),
        .Q(o_cmd[1]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \o_cmd_reg[2] 
       (.C(i_clk),
        .CE(\o_cmd[3]_i_2_n_0 ),
        .D(\o_cmd[2]_i_1_n_0 ),
        .Q(o_cmd[2]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \o_cmd_reg[3] 
       (.C(i_clk),
        .CE(\o_cmd[3]_i_2_n_0 ),
        .D(\o_cmd[3]_i_3_n_0 ),
        .Q(o_cmd[3]),
        .R(\o_cmd[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hB3A20000)) 
    o_new_i_1
       (.I0(send_state[0]),
        .I1(send_state[1]),
        .I2(i_done),
        .I3(i_go),
        .I4(i_rst),
        .O(o_new_i_1_n_0));
  FDRE o_new_reg
       (.C(i_clk),
        .CE(1'b1),
        .D(o_new_i_1_n_0),
        .Q(o_new),
        .R(1'b0));
  CARRY4 plusOp_carry
       (.CI(1'b0),
        .CO({plusOp_carry_n_0,plusOp_carry_n_1,plusOp_carry_n_2,plusOp_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,bram_addr[1],1'b0}),
        .O(in6[4:1]),
        .S({bram_addr[3:2],plusOp_carry_i_1_n_0,bram_addr[0]}));
  CARRY4 plusOp_carry__0
       (.CI(plusOp_carry_n_0),
        .CO({plusOp_carry__0_n_0,plusOp_carry__0_n_1,plusOp_carry__0_n_2,plusOp_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(in6[8:5]),
        .S(bram_addr[7:4]));
  CARRY4 plusOp_carry__1
       (.CI(plusOp_carry__0_n_0),
        .CO({plusOp_carry__1_n_0,plusOp_carry__1_n_1,plusOp_carry__1_n_2,plusOp_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(in6[12:9]),
        .S(bram_addr[11:8]));
  CARRY4 plusOp_carry__2
       (.CI(plusOp_carry__1_n_0),
        .CO({plusOp_carry__2_n_0,plusOp_carry__2_n_1,plusOp_carry__2_n_2,plusOp_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(in6[16:13]),
        .S(bram_addr[15:12]));
  CARRY4 plusOp_carry__3
       (.CI(plusOp_carry__2_n_0),
        .CO({plusOp_carry__3_n_0,plusOp_carry__3_n_1,plusOp_carry__3_n_2,plusOp_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(in6[20:17]),
        .S(bram_addr[19:16]));
  CARRY4 plusOp_carry__4
       (.CI(plusOp_carry__3_n_0),
        .CO({plusOp_carry__4_n_0,plusOp_carry__4_n_1,plusOp_carry__4_n_2,plusOp_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(in6[24:21]),
        .S(bram_addr[23:20]));
  CARRY4 plusOp_carry__5
       (.CI(plusOp_carry__4_n_0),
        .CO({plusOp_carry__5_n_0,plusOp_carry__5_n_1,plusOp_carry__5_n_2,plusOp_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(in6[28:25]),
        .S(bram_addr[27:24]));
  CARRY4 plusOp_carry__6
       (.CI(plusOp_carry__5_n_0),
        .CO({NLW_plusOp_carry__6_CO_UNCONNECTED[3:2],plusOp_carry__6_n_2,plusOp_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_plusOp_carry__6_O_UNCONNECTED[3],in6[31:29]}),
        .S({1'b0,bram_addr[30:28]}));
  LUT1 #(
    .INIT(2'h1)) 
    plusOp_carry_i_1
       (.I0(bram_addr[1]),
        .O(plusOp_carry_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[10]_i_1 
       (.I0(send_state[1]),
        .I1(in6[10]),
        .O(\s_count_addr[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[11]_i_1 
       (.I0(send_state[1]),
        .I1(in6[11]),
        .O(\s_count_addr[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[12]_i_1 
       (.I0(send_state[1]),
        .I1(in6[12]),
        .O(\s_count_addr[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[13]_i_1 
       (.I0(send_state[1]),
        .I1(in6[13]),
        .O(\s_count_addr[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[14]_i_1 
       (.I0(send_state[1]),
        .I1(in6[14]),
        .O(\s_count_addr[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[15]_i_1 
       (.I0(send_state[1]),
        .I1(in6[15]),
        .O(\s_count_addr[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[16]_i_1 
       (.I0(send_state[1]),
        .I1(in6[16]),
        .O(\s_count_addr[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[17]_i_1 
       (.I0(send_state[1]),
        .I1(in6[17]),
        .O(\s_count_addr[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[18]_i_1 
       (.I0(send_state[1]),
        .I1(in6[18]),
        .O(\s_count_addr[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[19]_i_1 
       (.I0(send_state[1]),
        .I1(in6[19]),
        .O(\s_count_addr[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[1]_i_1 
       (.I0(send_state[1]),
        .I1(in6[1]),
        .O(\s_count_addr[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[20]_i_1 
       (.I0(send_state[1]),
        .I1(in6[20]),
        .O(\s_count_addr[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[21]_i_1 
       (.I0(send_state[1]),
        .I1(in6[21]),
        .O(\s_count_addr[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[22]_i_1 
       (.I0(send_state[1]),
        .I1(in6[22]),
        .O(\s_count_addr[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[23]_i_1 
       (.I0(send_state[1]),
        .I1(in6[23]),
        .O(\s_count_addr[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[24]_i_1 
       (.I0(send_state[1]),
        .I1(in6[24]),
        .O(\s_count_addr[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[25]_i_1 
       (.I0(send_state[1]),
        .I1(in6[25]),
        .O(\s_count_addr[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[26]_i_1 
       (.I0(send_state[1]),
        .I1(in6[26]),
        .O(\s_count_addr[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[27]_i_1 
       (.I0(send_state[1]),
        .I1(in6[27]),
        .O(\s_count_addr[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[28]_i_1 
       (.I0(send_state[1]),
        .I1(in6[28]),
        .O(\s_count_addr[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[29]_i_1 
       (.I0(send_state[1]),
        .I1(in6[29]),
        .O(\s_count_addr[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[2]_i_1 
       (.I0(send_state[1]),
        .I1(in6[2]),
        .O(\s_count_addr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[30]_i_1 
       (.I0(send_state[1]),
        .I1(in6[30]),
        .O(\s_count_addr[30]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8830)) 
    \s_count_addr[31]_i_1 
       (.I0(i_done),
        .I1(send_state[0]),
        .I2(i_go),
        .I3(send_state[1]),
        .O(s_count_addr));
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[31]_i_2 
       (.I0(send_state[1]),
        .I1(in6[31]),
        .O(\s_count_addr[31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[3]_i_1 
       (.I0(send_state[1]),
        .I1(in6[3]),
        .O(\s_count_addr[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[4]_i_1 
       (.I0(send_state[1]),
        .I1(in6[4]),
        .O(\s_count_addr[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[5]_i_1 
       (.I0(send_state[1]),
        .I1(in6[5]),
        .O(\s_count_addr[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[6]_i_1 
       (.I0(send_state[1]),
        .I1(in6[6]),
        .O(\s_count_addr[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[7]_i_1 
       (.I0(send_state[1]),
        .I1(in6[7]),
        .O(\s_count_addr[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[8]_i_1 
       (.I0(send_state[1]),
        .I1(in6[8]),
        .O(\s_count_addr[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \s_count_addr[9]_i_1 
       (.I0(send_state[1]),
        .I1(in6[9]),
        .O(\s_count_addr[9]_i_1_n_0 ));
  FDRE \s_count_addr_reg[10] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[10]_i_1_n_0 ),
        .Q(bram_addr[9]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[11] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[11]_i_1_n_0 ),
        .Q(bram_addr[10]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[12] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[12]_i_1_n_0 ),
        .Q(bram_addr[11]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[13] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[13]_i_1_n_0 ),
        .Q(bram_addr[12]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[14] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[14]_i_1_n_0 ),
        .Q(bram_addr[13]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[15] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[15]_i_1_n_0 ),
        .Q(bram_addr[14]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[16] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[16]_i_1_n_0 ),
        .Q(bram_addr[15]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[17] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[17]_i_1_n_0 ),
        .Q(bram_addr[16]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[18] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[18]_i_1_n_0 ),
        .Q(bram_addr[17]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[19] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[19]_i_1_n_0 ),
        .Q(bram_addr[18]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[1] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[1]_i_1_n_0 ),
        .Q(bram_addr[0]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[20] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[20]_i_1_n_0 ),
        .Q(bram_addr[19]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[21] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[21]_i_1_n_0 ),
        .Q(bram_addr[20]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[22] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[22]_i_1_n_0 ),
        .Q(bram_addr[21]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[23] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[23]_i_1_n_0 ),
        .Q(bram_addr[22]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[24] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[24]_i_1_n_0 ),
        .Q(bram_addr[23]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[25] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[25]_i_1_n_0 ),
        .Q(bram_addr[24]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[26] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[26]_i_1_n_0 ),
        .Q(bram_addr[25]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[27] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[27]_i_1_n_0 ),
        .Q(bram_addr[26]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[28] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[28]_i_1_n_0 ),
        .Q(bram_addr[27]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[29] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[29]_i_1_n_0 ),
        .Q(bram_addr[28]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[2] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[2]_i_1_n_0 ),
        .Q(bram_addr[1]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[30] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[30]_i_1_n_0 ),
        .Q(bram_addr[29]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[31] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[31]_i_2_n_0 ),
        .Q(bram_addr[30]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[3] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[3]_i_1_n_0 ),
        .Q(bram_addr[2]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[4] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[4]_i_1_n_0 ),
        .Q(bram_addr[3]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[5] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[5]_i_1_n_0 ),
        .Q(bram_addr[4]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[6] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[6]_i_1_n_0 ),
        .Q(bram_addr[5]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[7] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[7]_i_1_n_0 ),
        .Q(bram_addr[6]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[8] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[8]_i_1_n_0 ),
        .Q(bram_addr[7]),
        .R(\o_cmd[3]_i_1_n_0 ));
  FDRE \s_count_addr_reg[9] 
       (.C(i_clk),
        .CE(s_count_addr),
        .D(\s_count_addr[9]_i_1_n_0 ),
        .Q(bram_addr[8]),
        .R(\o_cmd[3]_i_1_n_0 ));
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
