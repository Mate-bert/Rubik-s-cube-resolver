-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Sat Mar 29 13:29:47 2025
-- Host        : LAPTOP-N4P3CLBG running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design1_memory_reader_0_0_stub.vhdl
-- Design      : design1_memory_reader_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    i_clk : in STD_LOGIC;
    i_rst : in STD_LOGIC;
    i_go : in STD_LOGIC;
    i_done : in STD_LOGIC;
    o_cmd : out STD_LOGIC_VECTOR ( 3 downto 0 );
    o_new : out STD_LOGIC;
    bram_addr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    bram_clk : out STD_LOGIC;
    bram_din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    bram_dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    bram_en : out STD_LOGIC;
    bram_rst : out STD_LOGIC;
    bram_we : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "i_clk,i_rst,i_go,i_done,o_cmd[3:0],o_new,bram_addr[31:0],bram_clk,bram_din[31:0],bram_dout[31:0],bram_en,bram_rst,bram_we[3:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "memory_reader,Vivado 2019.1";
begin
end;
