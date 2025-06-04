-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Sun May 18 19:00:42 2025
-- Host        : LAPTOP-N4P3CLBG running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design1_rubik_resolver_0_0_sim_netlist.vhdl
-- Design      : design1_rubik_resolver_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rubik_resolver is
  port (
    o_m1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    o_m2 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    o_m3 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    o_m4 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    o_m5 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    o_m6 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    o_done : out STD_LOGIC;
    i_new : in STD_LOGIC;
    i_clk : in STD_LOGIC;
    i_cmd : in STD_LOGIC_VECTOR ( 3 downto 0 );
    i_rst : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rubik_resolver;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rubik_resolver is
  signal \FSM_sequential_s_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_state[0]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_state[0]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_state[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_state[2]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_state[2]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_state[2]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_state[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_state[3]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_state[3]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_state[3]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_state[3]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_state[4]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_state[4]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_state[4]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_state[4]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_state[4]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_state[4]_i_6_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_state[4]_i_7_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_state[4]_i_8_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_state[4]_i_9_n_0\ : STD_LOGIC;
  signal \^o_done\ : STD_LOGIC;
  signal \o_m1[0]_i_1_n_0\ : STD_LOGIC;
  signal \o_m1[2]_i_1_n_0\ : STD_LOGIC;
  signal \o_m1[3]_i_1_n_0\ : STD_LOGIC;
  signal \o_m1[3]_i_2_n_0\ : STD_LOGIC;
  signal \o_m2[0]_i_1_n_0\ : STD_LOGIC;
  signal \o_m2[2]_i_1_n_0\ : STD_LOGIC;
  signal \o_m2[3]_i_1_n_0\ : STD_LOGIC;
  signal \o_m2[3]_i_2_n_0\ : STD_LOGIC;
  signal \o_m3[0]_i_1_n_0\ : STD_LOGIC;
  signal \o_m3[2]_i_1_n_0\ : STD_LOGIC;
  signal \o_m3[3]_i_1_n_0\ : STD_LOGIC;
  signal \o_m3[3]_i_2_n_0\ : STD_LOGIC;
  signal \o_m4[0]_i_1_n_0\ : STD_LOGIC;
  signal \o_m4[1]_i_1_n_0\ : STD_LOGIC;
  signal \o_m4[2]_i_1_n_0\ : STD_LOGIC;
  signal \o_m4[3]_i_1_n_0\ : STD_LOGIC;
  signal \o_m4[3]_i_2_n_0\ : STD_LOGIC;
  signal \o_m5[0]_i_1_n_0\ : STD_LOGIC;
  signal \o_m5[3]_i_1_n_0\ : STD_LOGIC;
  signal \o_m5[3]_i_2_n_0\ : STD_LOGIC;
  signal \o_m6[0]_i_1_n_0\ : STD_LOGIC;
  signal \o_m6[1]_i_1_n_0\ : STD_LOGIC;
  signal \o_m6[2]_i_1_n_0\ : STD_LOGIC;
  signal \o_m6[3]_i_1_n_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal \s_cmd_d_reg_n_0_[0]\ : STD_LOGIC;
  signal \s_cmd_d_reg_n_0_[1]\ : STD_LOGIC;
  signal \s_cmd_d_reg_n_0_[2]\ : STD_LOGIC;
  signal s_cpt_loop : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \s_cpt_loop[3]_i_3_n_0\ : STD_LOGIC;
  signal \s_cpt_loop[3]_i_4_n_0\ : STD_LOGIC;
  signal \s_cpt_loop[3]_i_5_n_0\ : STD_LOGIC;
  signal \s_cpt_loop[3]_i_6_n_0\ : STD_LOGIC;
  signal \s_cpt_loop[3]_i_7_n_0\ : STD_LOGIC;
  signal \s_cpt_loop[3]_i_8_n_0\ : STD_LOGIC;
  signal \s_cpt_loop[3]_i_9_n_0\ : STD_LOGIC;
  signal s_cpt_loop_0 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \s_cpt_loop_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \s_cpt_phase[0]_i_10_n_0\ : STD_LOGIC;
  signal \s_cpt_phase[0]_i_11_n_0\ : STD_LOGIC;
  signal \s_cpt_phase[0]_i_1_n_0\ : STD_LOGIC;
  signal \s_cpt_phase[0]_i_3_n_0\ : STD_LOGIC;
  signal \s_cpt_phase[0]_i_4_n_0\ : STD_LOGIC;
  signal \s_cpt_phase[0]_i_5_n_0\ : STD_LOGIC;
  signal \s_cpt_phase[0]_i_6_n_0\ : STD_LOGIC;
  signal \s_cpt_phase[0]_i_7_n_0\ : STD_LOGIC;
  signal \s_cpt_phase[0]_i_8_n_0\ : STD_LOGIC;
  signal \s_cpt_phase[0]_i_9_n_0\ : STD_LOGIC;
  signal s_cpt_phase_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \s_cpt_phase_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \s_cpt_phase_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \s_cpt_phase_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \s_cpt_phase_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \s_cpt_phase_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \s_cpt_phase_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \s_cpt_phase_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \s_cpt_phase_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \s_cpt_phase_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \s_cpt_phase_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \s_cpt_phase_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \s_cpt_phase_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \s_cpt_phase_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \s_cpt_phase_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \s_cpt_phase_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \s_cpt_phase_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \s_cpt_phase_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \s_cpt_phase_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \s_cpt_phase_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \s_cpt_phase_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \s_cpt_phase_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \s_cpt_phase_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \s_cpt_phase_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \s_cpt_phase_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \s_cpt_phase_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \s_cpt_phase_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \s_cpt_phase_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \s_cpt_phase_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \s_cpt_phase_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \s_cpt_phase_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \s_cpt_phase_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \s_cpt_phase_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \s_cpt_phase_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \s_cpt_phase_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \s_cpt_phase_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \s_cpt_phase_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \s_cpt_phase_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \s_cpt_phase_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \s_cpt_phase_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \s_cpt_phase_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \s_cpt_phase_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \s_cpt_phase_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \s_cpt_phase_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \s_cpt_phase_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \s_cpt_phase_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \s_cpt_phase_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \s_cpt_phase_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \s_cpt_phase_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \s_cpt_phase_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \s_cpt_phase_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \s_cpt_phase_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \s_cpt_phase_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \s_cpt_phase_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \s_cpt_phase_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \s_cpt_phase_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \s_cpt_phase_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \s_cpt_phase_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \s_cpt_phase_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \s_cpt_phase_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \s_cpt_phase_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \s_cpt_phase_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \s_cpt_phase_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \s_cpt_phase_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal s_done_i_1_n_0 : STD_LOGIC;
  signal s_done_i_2_n_0 : STD_LOGIC;
  signal s_done_i_3_n_0 : STD_LOGIC;
  signal s_done_i_4_n_0 : STD_LOGIC;
  signal s_done_i_5_n_0 : STD_LOGIC;
  signal s_done_i_6_n_0 : STD_LOGIC;
  signal s_done_i_7_n_0 : STD_LOGIC;
  signal s_next_phase : STD_LOGIC;
  signal s_next_phase_i_1_n_0 : STD_LOGIC;
  signal s_start_cnt_phase : STD_LOGIC;
  signal s_start_cnt_phase_i_1_n_0 : STD_LOGIC;
  signal s_start_cnt_phase_reg_n_0 : STD_LOGIC;
  signal s_state : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_s_cpt_phase_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_s_state[0]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \FSM_sequential_s_state[0]_i_3\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \FSM_sequential_s_state[2]_i_3\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \FSM_sequential_s_state[2]_i_4\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \FSM_sequential_s_state[3]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \FSM_sequential_s_state[3]_i_3\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \FSM_sequential_s_state[3]_i_4\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \FSM_sequential_s_state[4]_i_4\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \FSM_sequential_s_state[4]_i_5\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \FSM_sequential_s_state[4]_i_7\ : label is "soft_lutpair11";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_s_state_reg[0]\ : label is "m4_p2:01111,m4_p1:10000,m3_p4:01001,m5_p3:10010,m5_p2:10011,m1_p3:00010,m5_p1:10100,m1_p2:00011,m4_p4:01101,m1_p1:00100,m6_p3:10110,m3_p3:01010,m6_p2:10111,idle:00000,m3_p2:01011,m2_p3:00110,m6_p4:10101,m2_p2:00111,m6_p1:11000,m5_p4:10001,m3_p1:01100,m2_p4:00101,m2_p1:01000,m4_p3:01110,m1_p4:00001";
  attribute FSM_ENCODED_STATES of \FSM_sequential_s_state_reg[1]\ : label is "m4_p2:01111,m4_p1:10000,m3_p4:01001,m5_p3:10010,m5_p2:10011,m1_p3:00010,m5_p1:10100,m1_p2:00011,m4_p4:01101,m1_p1:00100,m6_p3:10110,m3_p3:01010,m6_p2:10111,idle:00000,m3_p2:01011,m2_p3:00110,m6_p4:10101,m2_p2:00111,m6_p1:11000,m5_p4:10001,m3_p1:01100,m2_p4:00101,m2_p1:01000,m4_p3:01110,m1_p4:00001";
  attribute FSM_ENCODED_STATES of \FSM_sequential_s_state_reg[2]\ : label is "m4_p2:01111,m4_p1:10000,m3_p4:01001,m5_p3:10010,m5_p2:10011,m1_p3:00010,m5_p1:10100,m1_p2:00011,m4_p4:01101,m1_p1:00100,m6_p3:10110,m3_p3:01010,m6_p2:10111,idle:00000,m3_p2:01011,m2_p3:00110,m6_p4:10101,m2_p2:00111,m6_p1:11000,m5_p4:10001,m3_p1:01100,m2_p4:00101,m2_p1:01000,m4_p3:01110,m1_p4:00001";
  attribute FSM_ENCODED_STATES of \FSM_sequential_s_state_reg[3]\ : label is "m4_p2:01111,m4_p1:10000,m3_p4:01001,m5_p3:10010,m5_p2:10011,m1_p3:00010,m5_p1:10100,m1_p2:00011,m4_p4:01101,m1_p1:00100,m6_p3:10110,m3_p3:01010,m6_p2:10111,idle:00000,m3_p2:01011,m2_p3:00110,m6_p4:10101,m2_p2:00111,m6_p1:11000,m5_p4:10001,m3_p1:01100,m2_p4:00101,m2_p1:01000,m4_p3:01110,m1_p4:00001";
  attribute FSM_ENCODED_STATES of \FSM_sequential_s_state_reg[4]\ : label is "m4_p2:01111,m4_p1:10000,m3_p4:01001,m5_p3:10010,m5_p2:10011,m1_p3:00010,m5_p1:10100,m1_p2:00011,m4_p4:01101,m1_p1:00100,m6_p3:10110,m3_p3:01010,m6_p2:10111,idle:00000,m3_p2:01011,m2_p3:00110,m6_p4:10101,m2_p2:00111,m6_p1:11000,m5_p4:10001,m3_p1:01100,m2_p4:00101,m2_p1:01000,m4_p3:01110,m1_p4:00001";
  attribute SOFT_HLUTNM of \o_m1[0]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \o_m1[2]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \o_m1[3]_i_2\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \o_m2[0]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \o_m2[2]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \o_m2[3]_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \o_m3[2]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \o_m3[3]_i_2\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \o_m4[0]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \o_m4[1]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \o_m4[2]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \o_m4[3]_i_2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \o_m5[3]_i_2\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \o_m6[0]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \o_m6[2]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \s_cpt_loop[3]_i_5\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \s_cpt_loop[3]_i_6\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \s_cpt_loop[3]_i_7\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \s_cpt_loop[3]_i_8\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \s_cpt_loop[3]_i_9\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of s_done_i_3 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of s_done_i_4 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of s_done_i_6 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of s_done_i_7 : label is "soft_lutpair10";
begin
  o_done <= \^o_done\;
\FSM_sequential_s_state[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEC2"
    )
        port map (
      I0 => \FSM_sequential_s_state[0]_i_2_n_0\,
      I1 => s_state(3),
      I2 => s_state(4),
      I3 => \FSM_sequential_s_state[0]_i_3_n_0\,
      O => \FSM_sequential_s_state[0]_i_1_n_0\
    );
\FSM_sequential_s_state[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00F355FF00F300AA"
    )
        port map (
      I0 => s_state(2),
      I1 => s_done_i_4_n_0,
      I2 => p_0_in,
      I3 => s_state(0),
      I4 => s_state(1),
      I5 => \FSM_sequential_s_state[0]_i_4_n_0\,
      O => \FSM_sequential_s_state[0]_i_2_n_0\
    );
\FSM_sequential_s_state[0]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00DF"
    )
        port map (
      I0 => s_done_i_4_n_0,
      I1 => p_0_in,
      I2 => s_state(1),
      I3 => s_state(0),
      O => \FSM_sequential_s_state[0]_i_3_n_0\
    );
\FSM_sequential_s_state[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000002AA80000"
    )
        port map (
      I0 => p_0_in,
      I1 => \s_cmd_d_reg_n_0_[1]\,
      I2 => \s_cmd_d_reg_n_0_[2]\,
      I3 => \s_cmd_d_reg_n_0_[0]\,
      I4 => i_new,
      I5 => s_state(0),
      O => \FSM_sequential_s_state[0]_i_4_n_0\
    );
\FSM_sequential_s_state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"003FFFC03F00C0FE"
    )
        port map (
      I0 => s_state(2),
      I1 => s_state(3),
      I2 => s_state(4),
      I3 => s_state(1),
      I4 => p_0_in,
      I5 => s_state(0),
      O => \FSM_sequential_s_state[1]_i_1_n_0\
    );
\FSM_sequential_s_state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEC2FEFEFEC2C2C2"
    )
        port map (
      I0 => \FSM_sequential_s_state[2]_i_2_n_0\,
      I1 => s_state(3),
      I2 => s_state(4),
      I3 => \FSM_sequential_s_state[2]_i_3_n_0\,
      I4 => s_state(2),
      I5 => \FSM_sequential_s_state[2]_i_4_n_0\,
      O => \FSM_sequential_s_state[2]_i_1_n_0\
    );
\FSM_sequential_s_state[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"268ADD55268A8800"
    )
        port map (
      I0 => s_state(2),
      I1 => s_state(0),
      I2 => s_done_i_4_n_0,
      I3 => p_0_in,
      I4 => s_state(1),
      I5 => \FSM_sequential_s_state[2]_i_5_n_0\,
      O => \FSM_sequential_s_state[2]_i_2_n_0\
    );
\FSM_sequential_s_state[2]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3CC4"
    )
        port map (
      I0 => s_done_i_4_n_0,
      I1 => s_state(1),
      I2 => s_state(0),
      I3 => p_0_in,
      O => \FSM_sequential_s_state[2]_i_3_n_0\
    );
\FSM_sequential_s_state[2]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4333"
    )
        port map (
      I0 => s_done_i_4_n_0,
      I1 => s_state(1),
      I2 => p_0_in,
      I3 => s_state(0),
      O => \FSM_sequential_s_state[2]_i_4_n_0\
    );
\FSM_sequential_s_state[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00004440AEEEAAAA"
    )
        port map (
      I0 => s_state(0),
      I1 => i_new,
      I2 => \s_cmd_d_reg_n_0_[1]\,
      I3 => \s_cmd_d_reg_n_0_[2]\,
      I4 => \s_cmd_d_reg_n_0_[0]\,
      I5 => p_0_in,
      O => \FSM_sequential_s_state[2]_i_5_n_0\
    );
\FSM_sequential_s_state[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0FCA00CA"
    )
        port map (
      I0 => \FSM_sequential_s_state[3]_i_2_n_0\,
      I1 => \FSM_sequential_s_state[3]_i_3_n_0\,
      I2 => s_state(3),
      I3 => s_state(4),
      I4 => \FSM_sequential_s_state[3]_i_4_n_0\,
      O => \FSM_sequential_s_state[3]_i_1_n_0\
    );
\FSM_sequential_s_state[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"400040000CFF0C00"
    )
        port map (
      I0 => s_done_i_4_n_0,
      I1 => s_state(0),
      I2 => p_0_in,
      I3 => s_state(2),
      I4 => \FSM_sequential_s_state[3]_i_5_n_0\,
      I5 => s_state(1),
      O => \FSM_sequential_s_state[3]_i_2_n_0\
    );
\FSM_sequential_s_state[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"37DDCFAA"
    )
        port map (
      I0 => s_state(2),
      I1 => p_0_in,
      I2 => s_done_i_4_n_0,
      I3 => s_state(1),
      I4 => s_state(0),
      O => \FSM_sequential_s_state[3]_i_3_n_0\
    );
\FSM_sequential_s_state[3]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4030000F"
    )
        port map (
      I0 => s_done_i_4_n_0,
      I1 => p_0_in,
      I2 => \FSM_sequential_s_state[4]_i_5_n_0\,
      I3 => s_state(1),
      I4 => s_state(0),
      O => \FSM_sequential_s_state[3]_i_4_n_0\
    );
\FSM_sequential_s_state[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000C640000"
    )
        port map (
      I0 => p_0_in,
      I1 => \s_cmd_d_reg_n_0_[1]\,
      I2 => \s_cmd_d_reg_n_0_[2]\,
      I3 => \s_cmd_d_reg_n_0_[0]\,
      I4 => i_new,
      I5 => s_state(0),
      O => \FSM_sequential_s_state[3]_i_5_n_0\
    );
\FSM_sequential_s_state[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F003F003F007F01"
    )
        port map (
      I0 => s_state(1),
      I1 => s_state(3),
      I2 => s_state(4),
      I3 => s_next_phase,
      I4 => s_state(2),
      I5 => s_state(0),
      O => \FSM_sequential_s_state[4]_i_1_n_0\
    );
\FSM_sequential_s_state[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BF8CBFBFBF8CBCBC"
    )
        port map (
      I0 => \FSM_sequential_s_state[4]_i_3_n_0\,
      I1 => \FSM_sequential_s_state[4]_i_4_n_0\,
      I2 => \FSM_sequential_s_state[4]_i_5_n_0\,
      I3 => \FSM_sequential_s_state[4]_i_6_n_0\,
      I4 => s_state(1),
      I5 => s_state(0),
      O => \FSM_sequential_s_state[4]_i_2_n_0\
    );
\FSM_sequential_s_state[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C0A0C0A0000F0000"
    )
        port map (
      I0 => \FSM_sequential_s_state[4]_i_7_n_0\,
      I1 => \FSM_sequential_s_state[4]_i_8_n_0\,
      I2 => s_state(3),
      I3 => s_state(1),
      I4 => \FSM_sequential_s_state[4]_i_9_n_0\,
      I5 => s_state(2),
      O => \FSM_sequential_s_state[4]_i_3_n_0\
    );
\FSM_sequential_s_state[4]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => s_state(3),
      I1 => s_state(4),
      O => \FSM_sequential_s_state[4]_i_4_n_0\
    );
\FSM_sequential_s_state[4]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5D"
    )
        port map (
      I0 => s_state(4),
      I1 => s_state(2),
      I2 => s_state(3),
      O => \FSM_sequential_s_state[4]_i_5_n_0\
    );
\FSM_sequential_s_state[4]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF6FFF"
    )
        port map (
      I0 => s_state(0),
      I1 => p_0_in,
      I2 => s_cpt_loop(3),
      I3 => s_cpt_loop(2),
      I4 => s_cpt_loop(0),
      I5 => s_cpt_loop(1),
      O => \FSM_sequential_s_state[4]_i_6_n_0\
    );
\FSM_sequential_s_state[4]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s_state(0),
      I1 => p_0_in,
      O => \FSM_sequential_s_state[4]_i_7_n_0\
    );
\FSM_sequential_s_state[4]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A8AAAAAA00000000"
    )
        port map (
      I0 => s_state(0),
      I1 => s_cpt_loop(1),
      I2 => s_cpt_loop(0),
      I3 => s_cpt_loop(2),
      I4 => s_cpt_loop(3),
      I5 => p_0_in,
      O => \FSM_sequential_s_state[4]_i_8_n_0\
    );
\FSM_sequential_s_state[4]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000CC40000"
    )
        port map (
      I0 => p_0_in,
      I1 => \s_cmd_d_reg_n_0_[2]\,
      I2 => \s_cmd_d_reg_n_0_[1]\,
      I3 => \s_cmd_d_reg_n_0_[0]\,
      I4 => i_new,
      I5 => s_state(0),
      O => \FSM_sequential_s_state[4]_i_9_n_0\
    );
\FSM_sequential_s_state_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \FSM_sequential_s_state[4]_i_1_n_0\,
      D => \FSM_sequential_s_state[0]_i_1_n_0\,
      Q => s_state(0),
      R => s_done_i_1_n_0
    );
\FSM_sequential_s_state_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \FSM_sequential_s_state[4]_i_1_n_0\,
      D => \FSM_sequential_s_state[1]_i_1_n_0\,
      Q => s_state(1),
      R => s_done_i_1_n_0
    );
\FSM_sequential_s_state_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \FSM_sequential_s_state[4]_i_1_n_0\,
      D => \FSM_sequential_s_state[2]_i_1_n_0\,
      Q => s_state(2),
      R => s_done_i_1_n_0
    );
\FSM_sequential_s_state_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \FSM_sequential_s_state[4]_i_1_n_0\,
      D => \FSM_sequential_s_state[3]_i_1_n_0\,
      Q => s_state(3),
      R => s_done_i_1_n_0
    );
\FSM_sequential_s_state_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \FSM_sequential_s_state[4]_i_1_n_0\,
      D => \FSM_sequential_s_state[4]_i_2_n_0\,
      Q => s_state(4),
      R => s_done_i_1_n_0
    );
\o_m1[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0E"
    )
        port map (
      I0 => s_state(2),
      I1 => s_state(0),
      I2 => s_state(1),
      O => \o_m1[0]_i_1_n_0\
    );
\o_m1[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5540"
    )
        port map (
      I0 => s_state(3),
      I1 => s_state(0),
      I2 => s_state(1),
      I3 => s_state(2),
      O => \o_m1[2]_i_1_n_0\
    );
\o_m1[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000001F"
    )
        port map (
      I0 => s_state(0),
      I1 => s_state(1),
      I2 => s_state(2),
      I3 => s_state(4),
      I4 => s_state(3),
      O => \o_m1[3]_i_1_n_0\
    );
\o_m1[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => s_state(1),
      I1 => s_state(0),
      O => \o_m1[3]_i_2_n_0\
    );
\o_m1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \o_m1[3]_i_1_n_0\,
      D => \o_m1[0]_i_1_n_0\,
      Q => o_m1(0),
      R => s_done_i_1_n_0
    );
\o_m1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \o_m1[3]_i_1_n_0\,
      D => s_state(1),
      Q => o_m1(1),
      R => s_done_i_1_n_0
    );
\o_m1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \o_m1[3]_i_1_n_0\,
      D => \o_m1[2]_i_1_n_0\,
      Q => o_m1(2),
      R => s_done_i_1_n_0
    );
\o_m1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \o_m1[3]_i_1_n_0\,
      D => \o_m1[3]_i_2_n_0\,
      Q => o_m1(3),
      R => s_done_i_1_n_0
    );
\o_m2[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"54"
    )
        port map (
      I0 => s_state(1),
      I1 => s_state(3),
      I2 => s_state(2),
      O => \o_m2[0]_i_1_n_0\
    );
\o_m2[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9990"
    )
        port map (
      I0 => s_state(0),
      I1 => s_state(1),
      I2 => s_state(2),
      I3 => s_state(3),
      O => \o_m2[2]_i_1_n_0\
    );
\o_m2[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00014441"
    )
        port map (
      I0 => s_state(4),
      I1 => s_state(2),
      I2 => s_state(1),
      I3 => s_state(0),
      I4 => s_state(3),
      O => \o_m2[3]_i_1_n_0\
    );
\o_m2[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0444"
    )
        port map (
      I0 => s_state(3),
      I1 => s_state(2),
      I2 => s_state(0),
      I3 => s_state(1),
      O => \o_m2[3]_i_2_n_0\
    );
\o_m2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \o_m2[3]_i_1_n_0\,
      D => \o_m2[0]_i_1_n_0\,
      Q => o_m2(0),
      R => s_done_i_1_n_0
    );
\o_m2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \o_m2[3]_i_1_n_0\,
      D => s_state(1),
      Q => o_m2(1),
      R => s_done_i_1_n_0
    );
\o_m2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \o_m2[3]_i_1_n_0\,
      D => \o_m2[2]_i_1_n_0\,
      Q => o_m2(2),
      R => s_done_i_1_n_0
    );
\o_m2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \o_m2[3]_i_1_n_0\,
      D => \o_m2[3]_i_2_n_0\,
      Q => o_m2(3),
      R => s_done_i_1_n_0
    );
\o_m3[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s_state(3),
      I1 => s_state(1),
      O => \o_m3[0]_i_1_n_0\
    );
\o_m3[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => s_state(0),
      I1 => s_state(1),
      I2 => s_state(2),
      O => \o_m3[2]_i_1_n_0\
    );
\o_m3[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04040441"
    )
        port map (
      I0 => s_state(4),
      I1 => s_state(3),
      I2 => s_state(2),
      I3 => s_state(1),
      I4 => s_state(0),
      O => \o_m3[3]_i_1_n_0\
    );
\o_m3[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0444"
    )
        port map (
      I0 => s_state(2),
      I1 => s_state(3),
      I2 => s_state(0),
      I3 => s_state(1),
      O => \o_m3[3]_i_2_n_0\
    );
\o_m3_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \o_m3[3]_i_1_n_0\,
      D => \o_m3[0]_i_1_n_0\,
      Q => o_m3(0),
      R => s_done_i_1_n_0
    );
\o_m3_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \o_m3[3]_i_1_n_0\,
      D => s_state(1),
      Q => o_m3(1),
      R => s_done_i_1_n_0
    );
\o_m3_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \o_m3[3]_i_1_n_0\,
      D => \o_m3[2]_i_1_n_0\,
      Q => o_m3(2),
      R => s_done_i_1_n_0
    );
\o_m3_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \o_m3[3]_i_1_n_0\,
      D => \o_m3[3]_i_2_n_0\,
      Q => o_m3(3),
      R => s_done_i_1_n_0
    );
\o_m4[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"06"
    )
        port map (
      I0 => s_state(4),
      I1 => s_state(3),
      I2 => s_state(1),
      O => \o_m4[0]_i_1_n_0\
    );
\o_m4[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s_state(1),
      I1 => s_state(4),
      O => \o_m4[1]_i_1_n_0\
    );
\o_m4[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6006"
    )
        port map (
      I0 => s_state(4),
      I1 => s_state(3),
      I2 => s_state(1),
      I3 => s_state(0),
      O => \o_m4[2]_i_1_n_0\
    );
\o_m4[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40404003"
    )
        port map (
      I0 => s_state(4),
      I1 => s_state(3),
      I2 => s_state(2),
      I3 => s_state(1),
      I4 => s_state(0),
      O => \o_m4[3]_i_1_n_0\
    );
\o_m4[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0444"
    )
        port map (
      I0 => s_state(4),
      I1 => s_state(2),
      I2 => s_state(0),
      I3 => s_state(1),
      O => \o_m4[3]_i_2_n_0\
    );
\o_m4_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \o_m4[3]_i_1_n_0\,
      D => \o_m4[0]_i_1_n_0\,
      Q => o_m4(0),
      R => s_done_i_1_n_0
    );
\o_m4_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \o_m4[3]_i_1_n_0\,
      D => \o_m4[1]_i_1_n_0\,
      Q => o_m4(1),
      R => s_done_i_1_n_0
    );
\o_m4_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \o_m4[3]_i_1_n_0\,
      D => \o_m4[2]_i_1_n_0\,
      Q => o_m4(2),
      R => s_done_i_1_n_0
    );
\o_m4_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \o_m4[3]_i_1_n_0\,
      D => \o_m4[3]_i_2_n_0\,
      Q => o_m4(3),
      R => s_done_i_1_n_0
    );
\o_m5[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s_state(4),
      I1 => s_state(1),
      O => \o_m5[0]_i_1_n_0\
    );
\o_m5[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04040441"
    )
        port map (
      I0 => s_state(3),
      I1 => s_state(4),
      I2 => s_state(2),
      I3 => s_state(1),
      I4 => s_state(0),
      O => \o_m5[3]_i_1_n_0\
    );
\o_m5[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0444"
    )
        port map (
      I0 => s_state(2),
      I1 => s_state(4),
      I2 => s_state(0),
      I3 => s_state(1),
      O => \o_m5[3]_i_2_n_0\
    );
\o_m5_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \o_m5[3]_i_1_n_0\,
      D => \o_m5[0]_i_1_n_0\,
      Q => o_m5(0),
      R => s_done_i_1_n_0
    );
\o_m5_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \o_m5[3]_i_1_n_0\,
      D => s_state(1),
      Q => o_m5(1),
      R => s_done_i_1_n_0
    );
\o_m5_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \o_m5[3]_i_1_n_0\,
      D => \o_m1[2]_i_1_n_0\,
      Q => o_m5(2),
      R => s_done_i_1_n_0
    );
\o_m5_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \o_m5[3]_i_1_n_0\,
      D => \o_m5[3]_i_2_n_0\,
      Q => o_m5(3),
      R => s_done_i_1_n_0
    );
\o_m6[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0414"
    )
        port map (
      I0 => s_state(1),
      I1 => s_state(2),
      I2 => s_state(3),
      I3 => s_state(0),
      O => \o_m6[0]_i_1_n_0\
    );
\o_m6[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s_state(1),
      I1 => s_state(3),
      O => \o_m6[1]_i_1_n_0\
    );
\o_m6[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4102"
    )
        port map (
      I0 => s_state(3),
      I1 => s_state(1),
      I2 => s_state(0),
      I3 => s_state(2),
      O => \o_m6[2]_i_1_n_0\
    );
\o_m6[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0100E001"
    )
        port map (
      I0 => s_state(0),
      I1 => s_state(1),
      I2 => s_state(2),
      I3 => s_state(4),
      I4 => s_state(3),
      O => \o_m6[3]_i_1_n_0\
    );
\o_m6_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \o_m6[3]_i_1_n_0\,
      D => \o_m6[0]_i_1_n_0\,
      Q => o_m6(0),
      R => s_done_i_1_n_0
    );
\o_m6_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \o_m6[3]_i_1_n_0\,
      D => \o_m6[1]_i_1_n_0\,
      Q => o_m6(1),
      R => s_done_i_1_n_0
    );
\o_m6_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \o_m6[3]_i_1_n_0\,
      D => \o_m6[2]_i_1_n_0\,
      Q => o_m6(2),
      R => s_done_i_1_n_0
    );
\o_m6_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \o_m6[3]_i_1_n_0\,
      D => \o_m2[3]_i_2_n_0\,
      Q => o_m6(3),
      R => s_done_i_1_n_0
    );
\s_cmd_d_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => i_cmd(0),
      Q => \s_cmd_d_reg_n_0_[0]\,
      R => s_done_i_1_n_0
    );
\s_cmd_d_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => i_cmd(1),
      Q => \s_cmd_d_reg_n_0_[1]\,
      R => s_done_i_1_n_0
    );
\s_cmd_d_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => i_cmd(2),
      Q => \s_cmd_d_reg_n_0_[2]\,
      R => s_done_i_1_n_0
    );
\s_cmd_d_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => i_cmd(3),
      Q => p_0_in,
      R => s_done_i_1_n_0
    );
\s_cpt_loop[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"080800003B3B0003"
    )
        port map (
      I0 => p_0_in,
      I1 => s_state(1),
      I2 => s_state(0),
      I3 => s_state(2),
      I4 => s_done_i_3_n_0,
      I5 => s_cpt_loop(0),
      O => s_cpt_loop_0(0)
    );
\s_cpt_loop[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8BB88888"
    )
        port map (
      I0 => \s_cpt_loop[3]_i_5_n_0\,
      I1 => s_state(1),
      I2 => s_cpt_loop(1),
      I3 => s_cpt_loop(0),
      I4 => \s_cpt_loop[3]_i_7_n_0\,
      O => s_cpt_loop_0(1)
    );
\s_cpt_loop[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8BB8B8B888888888"
    )
        port map (
      I0 => \s_cpt_loop[3]_i_5_n_0\,
      I1 => s_state(1),
      I2 => s_cpt_loop(2),
      I3 => s_cpt_loop(1),
      I4 => s_cpt_loop(0),
      I5 => \s_cpt_loop[3]_i_7_n_0\,
      O => s_cpt_loop_0(2)
    );
\s_cpt_loop[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8BB8B8B888888888"
    )
        port map (
      I0 => \s_cpt_loop[3]_i_5_n_0\,
      I1 => s_state(1),
      I2 => s_cpt_loop(3),
      I3 => s_cpt_loop(2),
      I4 => \s_cpt_loop[3]_i_6_n_0\,
      I5 => \s_cpt_loop[3]_i_7_n_0\,
      O => s_cpt_loop_0(3)
    );
\s_cpt_loop[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0444FFFF04440000"
    )
        port map (
      I0 => \s_cpt_loop[3]_i_8_n_0\,
      I1 => s_next_phase,
      I2 => s_state(4),
      I3 => s_state(3),
      I4 => s_state(1),
      I5 => \s_cpt_loop[3]_i_9_n_0\,
      O => \s_cpt_loop[3]_i_3_n_0\
    );
\s_cpt_loop[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7000070000000700"
    )
        port map (
      I0 => s_state(4),
      I1 => s_state(3),
      I2 => p_0_in,
      I3 => s_next_phase,
      I4 => s_state(1),
      I5 => s_done_i_4_n_0,
      O => \s_cpt_loop[3]_i_4_n_0\
    );
\s_cpt_loop[3]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1500"
    )
        port map (
      I0 => s_state(0),
      I1 => s_state(3),
      I2 => s_state(4),
      I3 => p_0_in,
      O => \s_cpt_loop[3]_i_5_n_0\
    );
\s_cpt_loop[3]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_cpt_loop(1),
      I1 => s_cpt_loop(0),
      O => \s_cpt_loop[3]_i_6_n_0\
    );
\s_cpt_loop[3]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"777F"
    )
        port map (
      I0 => s_state(4),
      I1 => s_state(3),
      I2 => s_state(2),
      I3 => s_state(0),
      O => \s_cpt_loop[3]_i_7_n_0\
    );
\s_cpt_loop[3]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFBF"
    )
        port map (
      I0 => p_0_in,
      I1 => s_cpt_loop(3),
      I2 => s_cpt_loop(2),
      I3 => s_cpt_loop(0),
      I4 => s_cpt_loop(1),
      O => \s_cpt_loop[3]_i_8_n_0\
    );
\s_cpt_loop[3]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08888880"
    )
        port map (
      I0 => p_0_in,
      I1 => s_next_phase,
      I2 => s_state(3),
      I3 => s_state(4),
      I4 => s_state(2),
      O => \s_cpt_loop[3]_i_9_n_0\
    );
\s_cpt_loop_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_cpt_loop_reg[3]_i_1_n_0\,
      D => s_cpt_loop_0(0),
      Q => s_cpt_loop(0),
      R => s_done_i_1_n_0
    );
\s_cpt_loop_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_cpt_loop_reg[3]_i_1_n_0\,
      D => s_cpt_loop_0(1),
      Q => s_cpt_loop(1),
      R => s_done_i_1_n_0
    );
\s_cpt_loop_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_cpt_loop_reg[3]_i_1_n_0\,
      D => s_cpt_loop_0(2),
      Q => s_cpt_loop(2),
      R => s_done_i_1_n_0
    );
\s_cpt_loop_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_cpt_loop_reg[3]_i_1_n_0\,
      D => s_cpt_loop_0(3),
      Q => s_cpt_loop(3),
      R => s_done_i_1_n_0
    );
\s_cpt_loop_reg[3]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \s_cpt_loop[3]_i_3_n_0\,
      I1 => \s_cpt_loop[3]_i_4_n_0\,
      O => \s_cpt_loop_reg[3]_i_1_n_0\,
      S => s_state(0)
    );
\s_cpt_phase[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"75555555FFFFFFFF"
    )
        port map (
      I0 => s_start_cnt_phase_reg_n_0,
      I1 => \s_cpt_phase[0]_i_3_n_0\,
      I2 => \s_cpt_phase[0]_i_4_n_0\,
      I3 => \s_cpt_phase[0]_i_5_n_0\,
      I4 => \s_cpt_phase[0]_i_6_n_0\,
      I5 => i_rst,
      O => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase[0]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => s_cpt_phase_reg(9),
      I1 => s_cpt_phase_reg(8),
      I2 => s_cpt_phase_reg(11),
      I3 => s_cpt_phase_reg(10),
      O => \s_cpt_phase[0]_i_10_n_0\
    );
\s_cpt_phase[0]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => s_cpt_phase_reg(1),
      I1 => s_cpt_phase_reg(0),
      I2 => s_cpt_phase_reg(3),
      I3 => s_cpt_phase_reg(2),
      O => \s_cpt_phase[0]_i_11_n_0\
    );
\s_cpt_phase[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF7FFFFF"
    )
        port map (
      I0 => s_cpt_phase_reg(16),
      I1 => s_cpt_phase_reg(17),
      I2 => s_cpt_phase_reg(18),
      I3 => s_cpt_phase_reg(19),
      I4 => \s_cpt_phase[0]_i_8_n_0\,
      O => \s_cpt_phase[0]_i_3_n_0\
    );
\s_cpt_phase[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => s_cpt_phase_reg(28),
      I1 => s_cpt_phase_reg(29),
      I2 => s_cpt_phase_reg(31),
      I3 => s_cpt_phase_reg(30),
      I4 => \s_cpt_phase[0]_i_9_n_0\,
      O => \s_cpt_phase[0]_i_4_n_0\
    );
\s_cpt_phase[0]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => s_cpt_phase_reg(14),
      I1 => s_cpt_phase_reg(15),
      I2 => s_cpt_phase_reg(12),
      I3 => s_cpt_phase_reg(13),
      I4 => \s_cpt_phase[0]_i_10_n_0\,
      O => \s_cpt_phase[0]_i_5_n_0\
    );
\s_cpt_phase[0]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => s_cpt_phase_reg(6),
      I1 => s_cpt_phase_reg(7),
      I2 => s_cpt_phase_reg(4),
      I3 => s_cpt_phase_reg(5),
      I4 => \s_cpt_phase[0]_i_11_n_0\,
      O => \s_cpt_phase[0]_i_6_n_0\
    );
\s_cpt_phase[0]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_cpt_phase_reg(0),
      O => \s_cpt_phase[0]_i_7_n_0\
    );
\s_cpt_phase[0]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => s_cpt_phase_reg(23),
      I1 => s_cpt_phase_reg(22),
      I2 => s_cpt_phase_reg(21),
      I3 => s_cpt_phase_reg(20),
      O => \s_cpt_phase[0]_i_8_n_0\
    );
\s_cpt_phase[0]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => s_cpt_phase_reg(25),
      I1 => s_cpt_phase_reg(24),
      I2 => s_cpt_phase_reg(27),
      I3 => s_cpt_phase_reg(26),
      O => \s_cpt_phase[0]_i_9_n_0\
    );
\s_cpt_phase_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[0]_i_2_n_7\,
      Q => s_cpt_phase_reg(0),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \s_cpt_phase_reg[0]_i_2_n_0\,
      CO(2) => \s_cpt_phase_reg[0]_i_2_n_1\,
      CO(1) => \s_cpt_phase_reg[0]_i_2_n_2\,
      CO(0) => \s_cpt_phase_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \s_cpt_phase_reg[0]_i_2_n_4\,
      O(2) => \s_cpt_phase_reg[0]_i_2_n_5\,
      O(1) => \s_cpt_phase_reg[0]_i_2_n_6\,
      O(0) => \s_cpt_phase_reg[0]_i_2_n_7\,
      S(3 downto 1) => s_cpt_phase_reg(3 downto 1),
      S(0) => \s_cpt_phase[0]_i_7_n_0\
    );
\s_cpt_phase_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[8]_i_1_n_5\,
      Q => s_cpt_phase_reg(10),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[8]_i_1_n_4\,
      Q => s_cpt_phase_reg(11),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[12]_i_1_n_7\,
      Q => s_cpt_phase_reg(12),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s_cpt_phase_reg[8]_i_1_n_0\,
      CO(3) => \s_cpt_phase_reg[12]_i_1_n_0\,
      CO(2) => \s_cpt_phase_reg[12]_i_1_n_1\,
      CO(1) => \s_cpt_phase_reg[12]_i_1_n_2\,
      CO(0) => \s_cpt_phase_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \s_cpt_phase_reg[12]_i_1_n_4\,
      O(2) => \s_cpt_phase_reg[12]_i_1_n_5\,
      O(1) => \s_cpt_phase_reg[12]_i_1_n_6\,
      O(0) => \s_cpt_phase_reg[12]_i_1_n_7\,
      S(3 downto 0) => s_cpt_phase_reg(15 downto 12)
    );
\s_cpt_phase_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[12]_i_1_n_6\,
      Q => s_cpt_phase_reg(13),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[12]_i_1_n_5\,
      Q => s_cpt_phase_reg(14),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[12]_i_1_n_4\,
      Q => s_cpt_phase_reg(15),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[16]_i_1_n_7\,
      Q => s_cpt_phase_reg(16),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s_cpt_phase_reg[12]_i_1_n_0\,
      CO(3) => \s_cpt_phase_reg[16]_i_1_n_0\,
      CO(2) => \s_cpt_phase_reg[16]_i_1_n_1\,
      CO(1) => \s_cpt_phase_reg[16]_i_1_n_2\,
      CO(0) => \s_cpt_phase_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \s_cpt_phase_reg[16]_i_1_n_4\,
      O(2) => \s_cpt_phase_reg[16]_i_1_n_5\,
      O(1) => \s_cpt_phase_reg[16]_i_1_n_6\,
      O(0) => \s_cpt_phase_reg[16]_i_1_n_7\,
      S(3 downto 0) => s_cpt_phase_reg(19 downto 16)
    );
\s_cpt_phase_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[16]_i_1_n_6\,
      Q => s_cpt_phase_reg(17),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[16]_i_1_n_5\,
      Q => s_cpt_phase_reg(18),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[16]_i_1_n_4\,
      Q => s_cpt_phase_reg(19),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[0]_i_2_n_6\,
      Q => s_cpt_phase_reg(1),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[20]_i_1_n_7\,
      Q => s_cpt_phase_reg(20),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s_cpt_phase_reg[16]_i_1_n_0\,
      CO(3) => \s_cpt_phase_reg[20]_i_1_n_0\,
      CO(2) => \s_cpt_phase_reg[20]_i_1_n_1\,
      CO(1) => \s_cpt_phase_reg[20]_i_1_n_2\,
      CO(0) => \s_cpt_phase_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \s_cpt_phase_reg[20]_i_1_n_4\,
      O(2) => \s_cpt_phase_reg[20]_i_1_n_5\,
      O(1) => \s_cpt_phase_reg[20]_i_1_n_6\,
      O(0) => \s_cpt_phase_reg[20]_i_1_n_7\,
      S(3 downto 0) => s_cpt_phase_reg(23 downto 20)
    );
\s_cpt_phase_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[20]_i_1_n_6\,
      Q => s_cpt_phase_reg(21),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[20]_i_1_n_5\,
      Q => s_cpt_phase_reg(22),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[20]_i_1_n_4\,
      Q => s_cpt_phase_reg(23),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[24]_i_1_n_7\,
      Q => s_cpt_phase_reg(24),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s_cpt_phase_reg[20]_i_1_n_0\,
      CO(3) => \s_cpt_phase_reg[24]_i_1_n_0\,
      CO(2) => \s_cpt_phase_reg[24]_i_1_n_1\,
      CO(1) => \s_cpt_phase_reg[24]_i_1_n_2\,
      CO(0) => \s_cpt_phase_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \s_cpt_phase_reg[24]_i_1_n_4\,
      O(2) => \s_cpt_phase_reg[24]_i_1_n_5\,
      O(1) => \s_cpt_phase_reg[24]_i_1_n_6\,
      O(0) => \s_cpt_phase_reg[24]_i_1_n_7\,
      S(3 downto 0) => s_cpt_phase_reg(27 downto 24)
    );
\s_cpt_phase_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[24]_i_1_n_6\,
      Q => s_cpt_phase_reg(25),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[24]_i_1_n_5\,
      Q => s_cpt_phase_reg(26),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[24]_i_1_n_4\,
      Q => s_cpt_phase_reg(27),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[28]_i_1_n_7\,
      Q => s_cpt_phase_reg(28),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s_cpt_phase_reg[24]_i_1_n_0\,
      CO(3) => \NLW_s_cpt_phase_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \s_cpt_phase_reg[28]_i_1_n_1\,
      CO(1) => \s_cpt_phase_reg[28]_i_1_n_2\,
      CO(0) => \s_cpt_phase_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \s_cpt_phase_reg[28]_i_1_n_4\,
      O(2) => \s_cpt_phase_reg[28]_i_1_n_5\,
      O(1) => \s_cpt_phase_reg[28]_i_1_n_6\,
      O(0) => \s_cpt_phase_reg[28]_i_1_n_7\,
      S(3 downto 0) => s_cpt_phase_reg(31 downto 28)
    );
\s_cpt_phase_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[28]_i_1_n_6\,
      Q => s_cpt_phase_reg(29),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[0]_i_2_n_5\,
      Q => s_cpt_phase_reg(2),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[28]_i_1_n_5\,
      Q => s_cpt_phase_reg(30),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[28]_i_1_n_4\,
      Q => s_cpt_phase_reg(31),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[0]_i_2_n_4\,
      Q => s_cpt_phase_reg(3),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[4]_i_1_n_7\,
      Q => s_cpt_phase_reg(4),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s_cpt_phase_reg[0]_i_2_n_0\,
      CO(3) => \s_cpt_phase_reg[4]_i_1_n_0\,
      CO(2) => \s_cpt_phase_reg[4]_i_1_n_1\,
      CO(1) => \s_cpt_phase_reg[4]_i_1_n_2\,
      CO(0) => \s_cpt_phase_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \s_cpt_phase_reg[4]_i_1_n_4\,
      O(2) => \s_cpt_phase_reg[4]_i_1_n_5\,
      O(1) => \s_cpt_phase_reg[4]_i_1_n_6\,
      O(0) => \s_cpt_phase_reg[4]_i_1_n_7\,
      S(3 downto 0) => s_cpt_phase_reg(7 downto 4)
    );
\s_cpt_phase_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[4]_i_1_n_6\,
      Q => s_cpt_phase_reg(5),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[4]_i_1_n_5\,
      Q => s_cpt_phase_reg(6),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[4]_i_1_n_4\,
      Q => s_cpt_phase_reg(7),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[8]_i_1_n_7\,
      Q => s_cpt_phase_reg(8),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
\s_cpt_phase_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s_cpt_phase_reg[4]_i_1_n_0\,
      CO(3) => \s_cpt_phase_reg[8]_i_1_n_0\,
      CO(2) => \s_cpt_phase_reg[8]_i_1_n_1\,
      CO(1) => \s_cpt_phase_reg[8]_i_1_n_2\,
      CO(0) => \s_cpt_phase_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \s_cpt_phase_reg[8]_i_1_n_4\,
      O(2) => \s_cpt_phase_reg[8]_i_1_n_5\,
      O(1) => \s_cpt_phase_reg[8]_i_1_n_6\,
      O(0) => \s_cpt_phase_reg[8]_i_1_n_7\,
      S(3 downto 0) => s_cpt_phase_reg(11 downto 8)
    );
\s_cpt_phase_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => \s_cpt_phase_reg[8]_i_1_n_6\,
      Q => s_cpt_phase_reg(9),
      R => \s_cpt_phase[0]_i_1_n_0\
    );
s_done_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => i_rst,
      O => s_done_i_1_n_0
    );
s_done_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A202FFFFA2020000"
    )
        port map (
      I0 => s_done_i_3_n_0,
      I1 => i_new,
      I2 => s_state(1),
      I3 => s_done_i_4_n_0,
      I4 => s_done_i_5_n_0,
      I5 => \^o_done\,
      O => s_done_i_2_n_0
    );
s_done_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => s_state(3),
      I1 => s_state(4),
      O => s_done_i_3_n_0
    );
s_done_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => s_cpt_loop(1),
      I1 => s_cpt_loop(0),
      I2 => s_cpt_loop(2),
      I3 => s_cpt_loop(3),
      O => s_done_i_4_n_0
    );
s_done_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8200222200000000"
    )
        port map (
      I0 => s_done_i_3_n_0,
      I1 => s_state(0),
      I2 => p_0_in,
      I3 => s_done_i_6_n_0,
      I4 => s_state(1),
      I5 => s_done_i_7_n_0,
      O => s_done_i_5_n_0
    );
s_done_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => s_next_phase,
      I1 => s_cpt_loop(3),
      I2 => s_cpt_loop(2),
      I3 => s_cpt_loop(0),
      I4 => s_cpt_loop(1),
      O => s_done_i_6_n_0
    );
s_done_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAAB"
    )
        port map (
      I0 => s_state(1),
      I1 => s_state(4),
      I2 => s_state(2),
      I3 => s_state(3),
      O => s_done_i_7_n_0
    );
s_done_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => s_done_i_2_n_0,
      Q => \^o_done\,
      R => s_done_i_1_n_0
    );
s_next_phase_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080000000000000"
    )
        port map (
      I0 => \s_cpt_phase[0]_i_6_n_0\,
      I1 => \s_cpt_phase[0]_i_5_n_0\,
      I2 => \s_cpt_phase[0]_i_4_n_0\,
      I3 => \s_cpt_phase[0]_i_3_n_0\,
      I4 => s_start_cnt_phase_reg_n_0,
      I5 => i_rst,
      O => s_next_phase_i_1_n_0
    );
s_next_phase_reg: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => s_next_phase_i_1_n_0,
      Q => s_next_phase,
      R => '0'
    );
s_start_cnt_phase_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_start_cnt_phase,
      I1 => s_done_i_5_n_0,
      I2 => s_start_cnt_phase_reg_n_0,
      O => s_start_cnt_phase_i_1_n_0
    );
s_start_cnt_phase_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1515150000001500"
    )
        port map (
      I0 => s_state(0),
      I1 => s_state(3),
      I2 => s_state(4),
      I3 => i_new,
      I4 => s_state(1),
      I5 => p_0_in,
      O => s_start_cnt_phase
    );
s_start_cnt_phase_reg: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => s_start_cnt_phase_i_1_n_0,
      Q => s_start_cnt_phase_reg_n_0,
      R => s_done_i_1_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design1_rubik_resolver_0_0,rubik_resolver,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "rubik_resolver,Vivado 2019.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \^i_cmd\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute x_interface_info : string;
  attribute x_interface_info of i_clk : signal is "xilinx.com:signal:clock:1.0 i_clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of i_clk : signal is "XIL_INTERFACENAME i_clk, ASSOCIATED_RESET i_rst, FREQ_HZ 50000000, PHASE 0.000, CLK_DOMAIN design1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute x_interface_info of i_rst : signal is "xilinx.com:signal:reset:1.0 i_rst RST";
  attribute x_interface_parameter of i_rst : signal is "XIL_INTERFACENAME i_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
  \^i_cmd\(3 downto 0) <= i_cmd(3 downto 0);
  o_leds(3 downto 0) <= \^i_cmd\(3 downto 0);
U0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rubik_resolver
     port map (
      i_clk => i_clk,
      i_cmd(3 downto 0) => \^i_cmd\(3 downto 0),
      i_new => i_new,
      i_rst => i_rst,
      o_done => o_done,
      o_m1(3 downto 0) => o_m1(3 downto 0),
      o_m2(3 downto 0) => o_m2(3 downto 0),
      o_m3(3 downto 0) => o_m3(3 downto 0),
      o_m4(3 downto 0) => o_m4(3 downto 0),
      o_m5(3 downto 0) => o_m5(3 downto 0),
      o_m6(3 downto 0) => o_m6(3 downto 0)
    );
end STRUCTURE;
