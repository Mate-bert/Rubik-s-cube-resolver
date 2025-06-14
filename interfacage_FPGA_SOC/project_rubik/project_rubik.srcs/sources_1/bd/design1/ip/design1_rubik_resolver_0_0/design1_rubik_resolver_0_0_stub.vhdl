-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Sun May 18 19:00:42 2025
-- Host        : LAPTOP-N4P3CLBG running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/workspace/rubik/project_rubik/project_rubik.srcs/sources_1/bd/design1/ip/design1_rubik_resolver_0_0/design1_rubik_resolver_0_0_stub.vhdl
-- Design      : design1_rubik_resolver_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design1_rubik_resolver_0_0 is
  Port ( 
    i_clk : in STD_LOGIC;
    i_rst : in STD_LOGIC;
    i_cmd : in STD_LOGIC_VECTOR ( 3 downto 0 );
    i_new : in STD_LOGIC;
    o_done : out STD_LOGIC;
    o_m1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    o_m2 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    o_m3 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    o_m4 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    o_m5 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    o_m6 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    o_leds : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );

end design1_rubik_resolver_0_0;

architecture stub of design1_rubik_resolver_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "i_clk,i_rst,i_cmd[3:0],i_new,o_done,o_m1[3:0],o_m2[3:0],o_m3[3:0],o_m4[3:0],o_m5[3:0],o_m6[3:0],o_leds[3:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "rubik_resolver,Vivado 2019.1";
begin
end;
