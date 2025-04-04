-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Sat Mar 29 13:29:47 2025
-- Host        : LAPTOP-N4P3CLBG running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design1_memory_reader_0_0_sim_netlist.vhdl
-- Design      : design1_memory_reader_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_memory_reader is
  port (
    bram_addr : out STD_LOGIC_VECTOR ( 30 downto 0 );
    o_cmd : out STD_LOGIC_VECTOR ( 3 downto 0 );
    o_new : out STD_LOGIC;
    bram_en : out STD_LOGIC;
    i_go : in STD_LOGIC;
    i_rst : in STD_LOGIC;
    i_done : in STD_LOGIC;
    i_clk : in STD_LOGIC;
    bram_din : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_memory_reader;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_memory_reader is
  signal \FSM_onehot_send_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_send_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_send_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_send_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_send_state[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_send_state[2]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_onehot_send_state[2]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_onehot_send_state[2]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_onehot_send_state_reg_n_0_[0]\ : STD_LOGIC;
  signal \FSM_onehot_send_state_reg_n_0_[1]\ : STD_LOGIC;
  signal \FSM_onehot_send_state_reg_n_0_[2]\ : STD_LOGIC;
  signal \^bram_addr\ : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal \^bram_en\ : STD_LOGIC;
  signal bram_en_i_1_n_0 : STD_LOGIC;
  signal in5 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal \o_cmd[3]_i_10_n_0\ : STD_LOGIC;
  signal \o_cmd[3]_i_1_n_0\ : STD_LOGIC;
  signal \o_cmd[3]_i_2_n_0\ : STD_LOGIC;
  signal \o_cmd[3]_i_3_n_0\ : STD_LOGIC;
  signal \o_cmd[3]_i_4_n_0\ : STD_LOGIC;
  signal \o_cmd[3]_i_5_n_0\ : STD_LOGIC;
  signal \o_cmd[3]_i_6_n_0\ : STD_LOGIC;
  signal \o_cmd[3]_i_7_n_0\ : STD_LOGIC;
  signal \o_cmd[3]_i_8_n_0\ : STD_LOGIC;
  signal \o_cmd[3]_i_9_n_0\ : STD_LOGIC;
  signal \^o_new\ : STD_LOGIC;
  signal o_new_i_1_n_0 : STD_LOGIC;
  signal \plusOp_carry__0_n_0\ : STD_LOGIC;
  signal \plusOp_carry__0_n_1\ : STD_LOGIC;
  signal \plusOp_carry__0_n_2\ : STD_LOGIC;
  signal \plusOp_carry__0_n_3\ : STD_LOGIC;
  signal \plusOp_carry__1_n_0\ : STD_LOGIC;
  signal \plusOp_carry__1_n_1\ : STD_LOGIC;
  signal \plusOp_carry__1_n_2\ : STD_LOGIC;
  signal \plusOp_carry__1_n_3\ : STD_LOGIC;
  signal \plusOp_carry__2_n_0\ : STD_LOGIC;
  signal \plusOp_carry__2_n_1\ : STD_LOGIC;
  signal \plusOp_carry__2_n_2\ : STD_LOGIC;
  signal \plusOp_carry__2_n_3\ : STD_LOGIC;
  signal \plusOp_carry__3_n_0\ : STD_LOGIC;
  signal \plusOp_carry__3_n_1\ : STD_LOGIC;
  signal \plusOp_carry__3_n_2\ : STD_LOGIC;
  signal \plusOp_carry__3_n_3\ : STD_LOGIC;
  signal \plusOp_carry__4_n_0\ : STD_LOGIC;
  signal \plusOp_carry__4_n_1\ : STD_LOGIC;
  signal \plusOp_carry__4_n_2\ : STD_LOGIC;
  signal \plusOp_carry__4_n_3\ : STD_LOGIC;
  signal \plusOp_carry__5_n_0\ : STD_LOGIC;
  signal \plusOp_carry__5_n_1\ : STD_LOGIC;
  signal \plusOp_carry__5_n_2\ : STD_LOGIC;
  signal \plusOp_carry__5_n_3\ : STD_LOGIC;
  signal \plusOp_carry__6_n_2\ : STD_LOGIC;
  signal \plusOp_carry__6_n_3\ : STD_LOGIC;
  signal plusOp_carry_i_1_n_0 : STD_LOGIC;
  signal plusOp_carry_n_0 : STD_LOGIC;
  signal plusOp_carry_n_1 : STD_LOGIC;
  signal plusOp_carry_n_2 : STD_LOGIC;
  signal plusOp_carry_n_3 : STD_LOGIC;
  signal \s_count_addr[31]_i_1_n_0\ : STD_LOGIC;
  signal \s_count_addr[31]_i_2_n_0\ : STD_LOGIC;
  signal \NLW_plusOp_carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_plusOp_carry__6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_send_state[0]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \FSM_onehot_send_state[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \FSM_onehot_send_state[2]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \FSM_onehot_send_state[2]_i_4\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \FSM_onehot_send_state[2]_i_5\ : label is "soft_lutpair2";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_send_state_reg[0]\ : label is "idle:001,sending:100,reading:010";
  attribute FSM_ENCODED_STATES of \FSM_onehot_send_state_reg[1]\ : label is "idle:001,sending:100,reading:010";
  attribute FSM_ENCODED_STATES of \FSM_onehot_send_state_reg[2]\ : label is "idle:001,sending:100,reading:010";
  attribute SOFT_HLUTNM of bram_en_i_1 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \o_cmd[3]_i_3\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \o_cmd[3]_i_4\ : label is "soft_lutpair2";
begin
  bram_addr(30 downto 0) <= \^bram_addr\(30 downto 0);
  bram_en <= \^bram_en\;
  o_new <= \^o_new\;
\FSM_onehot_send_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0020FFFFFFFF"
    )
        port map (
      I0 => \FSM_onehot_send_state_reg_n_0_[1]\,
      I1 => \FSM_onehot_send_state[2]_i_3_n_0\,
      I2 => \o_cmd[3]_i_5_n_0\,
      I3 => \o_cmd[3]_i_6_n_0\,
      I4 => \FSM_onehot_send_state[0]_i_2_n_0\,
      I5 => i_rst,
      O => \FSM_onehot_send_state[0]_i_1_n_0\
    );
\FSM_onehot_send_state[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \FSM_onehot_send_state_reg_n_0_[0]\,
      I1 => i_go,
      O => \FSM_onehot_send_state[0]_i_2_n_0\
    );
\FSM_onehot_send_state[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F8880000"
    )
        port map (
      I0 => \FSM_onehot_send_state_reg_n_0_[2]\,
      I1 => i_done,
      I2 => \FSM_onehot_send_state_reg_n_0_[0]\,
      I3 => i_go,
      I4 => i_rst,
      O => \FSM_onehot_send_state[1]_i_1_n_0\
    );
\FSM_onehot_send_state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEEAEE00000000"
    )
        port map (
      I0 => \FSM_onehot_send_state[2]_i_2_n_0\,
      I1 => \FSM_onehot_send_state_reg_n_0_[1]\,
      I2 => \FSM_onehot_send_state[2]_i_3_n_0\,
      I3 => \o_cmd[3]_i_5_n_0\,
      I4 => \o_cmd[3]_i_6_n_0\,
      I5 => i_rst,
      O => \FSM_onehot_send_state[2]_i_1_n_0\
    );
\FSM_onehot_send_state[2]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \FSM_onehot_send_state_reg_n_0_[2]\,
      I1 => i_done,
      O => \FSM_onehot_send_state[2]_i_2_n_0\
    );
\FSM_onehot_send_state[2]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FBFF"
    )
        port map (
      I0 => \o_cmd[3]_i_7_n_0\,
      I1 => \FSM_onehot_send_state[2]_i_4_n_0\,
      I2 => \o_cmd[3]_i_8_n_0\,
      I3 => \FSM_onehot_send_state[2]_i_5_n_0\,
      O => \FSM_onehot_send_state[2]_i_3_n_0\
    );
\FSM_onehot_send_state[2]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => bram_din(12),
      I1 => bram_din(9),
      I2 => bram_din(16),
      I3 => bram_din(14),
      O => \FSM_onehot_send_state[2]_i_4_n_0\
    );
\FSM_onehot_send_state[2]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => bram_din(5),
      I1 => bram_din(3),
      I2 => bram_din(1),
      I3 => bram_din(0),
      O => \FSM_onehot_send_state[2]_i_5_n_0\
    );
\FSM_onehot_send_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => \FSM_onehot_send_state[0]_i_1_n_0\,
      Q => \FSM_onehot_send_state_reg_n_0_[0]\,
      R => '0'
    );
\FSM_onehot_send_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => \FSM_onehot_send_state[1]_i_1_n_0\,
      Q => \FSM_onehot_send_state_reg_n_0_[1]\,
      R => '0'
    );
\FSM_onehot_send_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk,
      CE => '1',
      D => \FSM_onehot_send_state[2]_i_1_n_0\,
      Q => \FSM_onehot_send_state_reg_n_0_[2]\,
      R => '0'
    );
bram_en_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => i_go,
      I1 => i_rst,
      I2 => \FSM_onehot_send_state_reg_n_0_[0]\,
      I3 => \^bram_en\,
      O => bram_en_i_1_n_0
    );
bram_en_reg: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => bram_en_i_1_n_0,
      Q => \^bram_en\,
      R => '0'
    );
\o_cmd[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080000000000000"
    )
        port map (
      I0 => \o_cmd[3]_i_3_n_0\,
      I1 => \o_cmd[3]_i_4_n_0\,
      I2 => \o_cmd[3]_i_5_n_0\,
      I3 => \o_cmd[3]_i_6_n_0\,
      I4 => \FSM_onehot_send_state_reg_n_0_[1]\,
      I5 => i_rst,
      O => \o_cmd[3]_i_1_n_0\
    );
\o_cmd[3]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => bram_din(19),
      I1 => bram_din(18),
      I2 => bram_din(17),
      I3 => bram_din(15),
      O => \o_cmd[3]_i_10_n_0\
    );
\o_cmd[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => i_rst,
      I1 => \FSM_onehot_send_state_reg_n_0_[1]\,
      O => \o_cmd[3]_i_2_n_0\
    );
\o_cmd[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => bram_din(14),
      I1 => bram_din(16),
      I2 => bram_din(9),
      I3 => bram_din(12),
      I4 => \o_cmd[3]_i_7_n_0\,
      O => \o_cmd[3]_i_3_n_0\
    );
\o_cmd[3]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => bram_din(0),
      I1 => bram_din(1),
      I2 => bram_din(3),
      I3 => bram_din(5),
      I4 => \o_cmd[3]_i_8_n_0\,
      O => \o_cmd[3]_i_4_n_0\
    );
\o_cmd[3]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => bram_din(25),
      I1 => bram_din(28),
      I2 => bram_din(29),
      I3 => bram_din(31),
      I4 => \o_cmd[3]_i_9_n_0\,
      O => \o_cmd[3]_i_5_n_0\
    );
\o_cmd[3]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEFFFF"
    )
        port map (
      I0 => bram_din(7),
      I1 => bram_din(10),
      I2 => bram_din(11),
      I3 => bram_din(13),
      I4 => \o_cmd[3]_i_10_n_0\,
      O => \o_cmd[3]_i_6_n_0\
    );
\o_cmd[3]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => bram_din(4),
      I1 => bram_din(2),
      I2 => bram_din(8),
      I3 => bram_din(6),
      O => \o_cmd[3]_i_7_n_0\
    );
\o_cmd[3]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => bram_din(26),
      I1 => bram_din(22),
      I2 => bram_din(30),
      I3 => bram_din(27),
      O => \o_cmd[3]_i_8_n_0\
    );
\o_cmd[3]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => bram_din(21),
      I1 => bram_din(20),
      I2 => bram_din(24),
      I3 => bram_din(23),
      O => \o_cmd[3]_i_9_n_0\
    );
\o_cmd_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \o_cmd[3]_i_2_n_0\,
      D => bram_din(0),
      Q => o_cmd(0),
      R => \o_cmd[3]_i_1_n_0\
    );
\o_cmd_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \o_cmd[3]_i_2_n_0\,
      D => bram_din(1),
      Q => o_cmd(1),
      R => \o_cmd[3]_i_1_n_0\
    );
\o_cmd_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \o_cmd[3]_i_2_n_0\,
      D => bram_din(2),
      Q => o_cmd(2),
      R => \o_cmd[3]_i_1_n_0\
    );
\o_cmd_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \o_cmd[3]_i_2_n_0\,
      D => bram_din(3),
      Q => o_cmd(3),
      R => \o_cmd[3]_i_1_n_0\
    );
o_new_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F40"
    )
        port map (
      I0 => i_done,
      I1 => i_rst,
      I2 => \FSM_onehot_send_state_reg_n_0_[2]\,
      I3 => \^o_new\,
      O => o_new_i_1_n_0
    );
o_new_reg: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => '1',
      D => o_new_i_1_n_0,
      Q => \^o_new\,
      R => '0'
    );
plusOp_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => plusOp_carry_n_0,
      CO(2) => plusOp_carry_n_1,
      CO(1) => plusOp_carry_n_2,
      CO(0) => plusOp_carry_n_3,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => \^bram_addr\(1),
      DI(0) => '0',
      O(3 downto 0) => in5(4 downto 1),
      S(3 downto 2) => \^bram_addr\(3 downto 2),
      S(1) => plusOp_carry_i_1_n_0,
      S(0) => \^bram_addr\(0)
    );
\plusOp_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => plusOp_carry_n_0,
      CO(3) => \plusOp_carry__0_n_0\,
      CO(2) => \plusOp_carry__0_n_1\,
      CO(1) => \plusOp_carry__0_n_2\,
      CO(0) => \plusOp_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => in5(8 downto 5),
      S(3 downto 0) => \^bram_addr\(7 downto 4)
    );
\plusOp_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \plusOp_carry__0_n_0\,
      CO(3) => \plusOp_carry__1_n_0\,
      CO(2) => \plusOp_carry__1_n_1\,
      CO(1) => \plusOp_carry__1_n_2\,
      CO(0) => \plusOp_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => in5(12 downto 9),
      S(3 downto 0) => \^bram_addr\(11 downto 8)
    );
\plusOp_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \plusOp_carry__1_n_0\,
      CO(3) => \plusOp_carry__2_n_0\,
      CO(2) => \plusOp_carry__2_n_1\,
      CO(1) => \plusOp_carry__2_n_2\,
      CO(0) => \plusOp_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => in5(16 downto 13),
      S(3 downto 0) => \^bram_addr\(15 downto 12)
    );
\plusOp_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \plusOp_carry__2_n_0\,
      CO(3) => \plusOp_carry__3_n_0\,
      CO(2) => \plusOp_carry__3_n_1\,
      CO(1) => \plusOp_carry__3_n_2\,
      CO(0) => \plusOp_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => in5(20 downto 17),
      S(3 downto 0) => \^bram_addr\(19 downto 16)
    );
\plusOp_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \plusOp_carry__3_n_0\,
      CO(3) => \plusOp_carry__4_n_0\,
      CO(2) => \plusOp_carry__4_n_1\,
      CO(1) => \plusOp_carry__4_n_2\,
      CO(0) => \plusOp_carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => in5(24 downto 21),
      S(3 downto 0) => \^bram_addr\(23 downto 20)
    );
\plusOp_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \plusOp_carry__4_n_0\,
      CO(3) => \plusOp_carry__5_n_0\,
      CO(2) => \plusOp_carry__5_n_1\,
      CO(1) => \plusOp_carry__5_n_2\,
      CO(0) => \plusOp_carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => in5(28 downto 25),
      S(3 downto 0) => \^bram_addr\(27 downto 24)
    );
\plusOp_carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \plusOp_carry__5_n_0\,
      CO(3 downto 2) => \NLW_plusOp_carry__6_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \plusOp_carry__6_n_2\,
      CO(0) => \plusOp_carry__6_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_plusOp_carry__6_O_UNCONNECTED\(3),
      O(2 downto 0) => in5(31 downto 29),
      S(3) => '0',
      S(2 downto 0) => \^bram_addr\(30 downto 28)
    );
plusOp_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^bram_addr\(1),
      O => plusOp_carry_i_1_n_0
    );
\s_count_addr[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => i_go,
      I1 => \FSM_onehot_send_state_reg_n_0_[0]\,
      I2 => i_rst,
      I3 => \FSM_onehot_send_state_reg_n_0_[2]\,
      O => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8080AA80"
    )
        port map (
      I0 => i_rst,
      I1 => \FSM_onehot_send_state_reg_n_0_[2]\,
      I2 => i_done,
      I3 => \FSM_onehot_send_state_reg_n_0_[0]\,
      I4 => i_go,
      O => \s_count_addr[31]_i_2_n_0\
    );
\s_count_addr_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(10),
      Q => \^bram_addr\(9),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(11),
      Q => \^bram_addr\(10),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(12),
      Q => \^bram_addr\(11),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(13),
      Q => \^bram_addr\(12),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(14),
      Q => \^bram_addr\(13),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(15),
      Q => \^bram_addr\(14),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(16),
      Q => \^bram_addr\(15),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(17),
      Q => \^bram_addr\(16),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(18),
      Q => \^bram_addr\(17),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(19),
      Q => \^bram_addr\(18),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(1),
      Q => \^bram_addr\(0),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(20),
      Q => \^bram_addr\(19),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(21),
      Q => \^bram_addr\(20),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(22),
      Q => \^bram_addr\(21),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(23),
      Q => \^bram_addr\(22),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(24),
      Q => \^bram_addr\(23),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(25),
      Q => \^bram_addr\(24),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(26),
      Q => \^bram_addr\(25),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(27),
      Q => \^bram_addr\(26),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(28),
      Q => \^bram_addr\(27),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(29),
      Q => \^bram_addr\(28),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(2),
      Q => \^bram_addr\(1),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(30),
      Q => \^bram_addr\(29),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(31),
      Q => \^bram_addr\(30),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(3),
      Q => \^bram_addr\(2),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(4),
      Q => \^bram_addr\(3),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(5),
      Q => \^bram_addr\(4),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(6),
      Q => \^bram_addr\(5),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(7),
      Q => \^bram_addr\(6),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(8),
      Q => \^bram_addr\(7),
      R => \s_count_addr[31]_i_1_n_0\
    );
\s_count_addr_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => i_clk,
      CE => \s_count_addr[31]_i_2_n_0\,
      D => in5(9),
      Q => \^bram_addr\(8),
      R => \s_count_addr[31]_i_1_n_0\
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design1_memory_reader_0_0,memory_reader,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "memory_reader,Vivado 2019.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \<const0>\ : STD_LOGIC;
  signal \^bram_addr\ : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal \^i_clk\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of bram_clk : signal is "xilinx.com:signal:clock:1.0 bram_clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of bram_clk : signal is "XIL_INTERFACENAME bram_clk, ASSOCIATED_RESET bram_rst, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design1_memory_reader_0_0_bram_clk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of bram_rst : signal is "xilinx.com:signal:reset:1.0 bram_rst RST";
  attribute X_INTERFACE_PARAMETER of bram_rst : signal is "XIL_INTERFACENAME bram_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of i_clk : signal is "xilinx.com:signal:clock:1.0 i_clk CLK";
  attribute X_INTERFACE_PARAMETER of i_clk : signal is "XIL_INTERFACENAME i_clk, ASSOCIATED_RESET i_rst, FREQ_HZ 50000000, PHASE 0.000, CLK_DOMAIN design1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of i_rst : signal is "xilinx.com:signal:reset:1.0 i_rst RST";
  attribute X_INTERFACE_PARAMETER of i_rst : signal is "XIL_INTERFACENAME i_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
  \^i_clk\ <= i_clk;
  bram_addr(31 downto 1) <= \^bram_addr\(31 downto 1);
  bram_addr(0) <= \<const0>\;
  bram_clk <= \^i_clk\;
  bram_dout(31) <= \<const0>\;
  bram_dout(30) <= \<const0>\;
  bram_dout(29) <= \<const0>\;
  bram_dout(28) <= \<const0>\;
  bram_dout(27) <= \<const0>\;
  bram_dout(26) <= \<const0>\;
  bram_dout(25) <= \<const0>\;
  bram_dout(24) <= \<const0>\;
  bram_dout(23) <= \<const0>\;
  bram_dout(22) <= \<const0>\;
  bram_dout(21) <= \<const0>\;
  bram_dout(20) <= \<const0>\;
  bram_dout(19) <= \<const0>\;
  bram_dout(18) <= \<const0>\;
  bram_dout(17) <= \<const0>\;
  bram_dout(16) <= \<const0>\;
  bram_dout(15) <= \<const0>\;
  bram_dout(14) <= \<const0>\;
  bram_dout(13) <= \<const0>\;
  bram_dout(12) <= \<const0>\;
  bram_dout(11) <= \<const0>\;
  bram_dout(10) <= \<const0>\;
  bram_dout(9) <= \<const0>\;
  bram_dout(8) <= \<const0>\;
  bram_dout(7) <= \<const0>\;
  bram_dout(6) <= \<const0>\;
  bram_dout(5) <= \<const0>\;
  bram_dout(4) <= \<const0>\;
  bram_dout(3) <= \<const0>\;
  bram_dout(2) <= \<const0>\;
  bram_dout(1) <= \<const0>\;
  bram_dout(0) <= \<const0>\;
  bram_rst <= \<const0>\;
  bram_we(3) <= \<const0>\;
  bram_we(2) <= \<const0>\;
  bram_we(1) <= \<const0>\;
  bram_we(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_memory_reader
     port map (
      bram_addr(30 downto 0) => \^bram_addr\(31 downto 1),
      bram_din(31 downto 0) => bram_din(31 downto 0),
      bram_en => bram_en,
      i_clk => \^i_clk\,
      i_done => i_done,
      i_go => i_go,
      i_rst => i_rst,
      o_cmd(3 downto 0) => o_cmd(3 downto 0),
      o_new => o_new
    );
end STRUCTURE;
