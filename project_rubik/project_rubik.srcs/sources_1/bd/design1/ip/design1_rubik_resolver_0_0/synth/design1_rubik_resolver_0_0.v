// (c) Copyright 1995-2025 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:rubik_resolver:1.0
// IP Revision: 1

(* X_CORE_INFO = "rubik_resolver,Vivado 2019.1" *)
(* CHECK_LICENSE_TYPE = "design1_rubik_resolver_0_0,rubik_resolver,{}" *)
(* CORE_GENERATION_INFO = "design1_rubik_resolver_0_0,rubik_resolver,{x_ipProduct=Vivado 2019.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=rubik_resolver,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design1_rubik_resolver_0_0 (
  i_clk,
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
  o_leds
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME i_clk, ASSOCIATED_RESET i_rst, FREQ_HZ 50000000, PHASE 0.000, CLK_DOMAIN design1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 i_clk CLK" *)
input wire i_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME i_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 i_rst RST" *)
input wire i_rst;
input wire [3 : 0] i_cmd;
input wire i_new;
output wire o_done;
output wire o_done_temp;
output wire [3 : 0] o_m1;
output wire [3 : 0] o_m2;
output wire [3 : 0] o_m3;
output wire [3 : 0] o_m4;
output wire [3 : 0] o_m5;
output wire [3 : 0] o_m6;
output wire [3 : 0] o_leds;

  rubik_resolver inst (
    .i_clk(i_clk),
    .i_rst(i_rst),
    .i_cmd(i_cmd),
    .i_new(i_new),
    .o_done(o_done),
    .o_done_temp(o_done_temp),
    .o_m1(o_m1),
    .o_m2(o_m2),
    .o_m3(o_m3),
    .o_m4(o_m4),
    .o_m5(o_m5),
    .o_m6(o_m6),
    .o_leds(o_leds)
  );
endmodule
