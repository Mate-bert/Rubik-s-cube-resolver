-- (c) Copyright 1995-2025 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:module_ref:memory_reader_IP:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design1_memory_reader_IP_0_1 IS
  PORT (
    i_clk : IN STD_LOGIC;
    i_rst : IN STD_LOGIC;
    i_go : IN STD_LOGIC;
    i_done : IN STD_LOGIC;
    o_cmd : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    o_new : OUT STD_LOGIC;
    bram_addr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    bram_clk : OUT STD_LOGIC;
    bram_din : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    bram_dout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    bram_en : OUT STD_LOGIC;
    bram_rst : OUT STD_LOGIC;
    bram_we : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END design1_memory_reader_IP_0_1;

ARCHITECTURE design1_memory_reader_IP_0_1_arch OF design1_memory_reader_IP_0_1 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design1_memory_reader_IP_0_1_arch: ARCHITECTURE IS "yes";
  COMPONENT memory_reader_IP IS
    PORT (
      i_clk : IN STD_LOGIC;
      i_rst : IN STD_LOGIC;
      i_go : IN STD_LOGIC;
      i_done : IN STD_LOGIC;
      o_cmd : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      o_new : OUT STD_LOGIC;
      bram_addr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      bram_clk : OUT STD_LOGIC;
      bram_din : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      bram_dout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      bram_en : OUT STD_LOGIC;
      bram_rst : OUT STD_LOGIC;
      bram_we : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
  END COMPONENT memory_reader_IP;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF design1_memory_reader_IP_0_1_arch: ARCHITECTURE IS "memory_reader_IP,Vivado 2019.1";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF design1_memory_reader_IP_0_1_arch : ARCHITECTURE IS "design1_memory_reader_IP_0_1,memory_reader_IP,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF design1_memory_reader_IP_0_1_arch: ARCHITECTURE IS "design1_memory_reader_IP_0_1,memory_reader_IP,{x_ipProduct=Vivado 2019.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=memory_reader_IP,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED}";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF design1_memory_reader_IP_0_1_arch: ARCHITECTURE IS "module_ref";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF bram_rst: SIGNAL IS "XIL_INTERFACENAME bram_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF bram_rst: SIGNAL IS "xilinx.com:signal:reset:1.0 bram_rst RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF bram_clk: SIGNAL IS "XIL_INTERFACENAME bram_clk, ASSOCIATED_RESET bram_rst, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design1_memory_reader_IP_0_1_bram_clk, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF bram_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 bram_clk CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF i_rst: SIGNAL IS "XIL_INTERFACENAME i_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF i_rst: SIGNAL IS "xilinx.com:signal:reset:1.0 i_rst RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF i_clk: SIGNAL IS "XIL_INTERFACENAME i_clk, ASSOCIATED_RESET i_rst, FREQ_HZ 50000000, PHASE 0.000, CLK_DOMAIN design1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF i_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 i_clk CLK";
BEGIN
  U0 : memory_reader_IP
    PORT MAP (
      i_clk => i_clk,
      i_rst => i_rst,
      i_go => i_go,
      i_done => i_done,
      o_cmd => o_cmd,
      o_new => o_new,
      bram_addr => bram_addr,
      bram_clk => bram_clk,
      bram_din => bram_din,
      bram_dout => bram_dout,
      bram_en => bram_en,
      bram_rst => bram_rst,
      bram_we => bram_we
    );
END design1_memory_reader_IP_0_1_arch;
