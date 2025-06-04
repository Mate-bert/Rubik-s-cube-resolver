library IEEE;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity rubik_resolve_tb is
end entity;

architecture behavioral of rubik_resolve_tb is

    signal s_clk        : std_logic := '1';
    signal s_rst        : std_logic;
    signal s_cmd        : std_logic_vector(3 downto 0);
    signal s_new        : std_logic;

    signal s_done       : std_logic;
    signal s_m1         : std_logic_vector(3 downto 0);
    signal s_m2         : std_logic_vector(3 downto 0);
    signal s_m3         : std_logic_vector(3 downto 0);
    signal s_m4         : std_logic_vector(3 downto 0);
    signal s_m5         : std_logic_vector(3 downto 0);
    signal s_m6         : std_logic_vector(3 downto 0);
    signal s_leds       : std_logic_vector(3 downto 0);

    component rubik_resolver
    port (
        i_clk   : in  std_logic;
        i_rst   : in  std_logic;
        i_cmd   : in  std_logic_vector(3 downto 0);
        i_new   : in  std_logic;
        o_done  : out std_logic;
        o_m1    : out std_logic_vector(3 downto 0);
        o_m2    : out std_logic_vector(3 downto 0);
        o_m3    : out std_logic_vector(3 downto 0);
        o_m4    : out std_logic_vector(3 downto 0);
        o_m5    : out std_logic_vector(3 downto 0);
        o_m6    : out std_logic_vector(3 downto 0);
        o_leds  : out std_logic_vector(3 downto 0)
    );
    end component;

begin

    UUT : rubik_resolver
    port map (
        i_clk  => s_clk,
        i_rst  => s_rst,
        i_cmd  => s_cmd,
        i_new  => s_new,
        o_done => s_done,
        o_m1   => s_m1,
        o_m2   => s_m2,
        o_m3   => s_m3,
        o_m4   => s_m4,
        o_m5   => s_m5,
        o_m6   => s_m6,
        o_leds => s_leds
    );


    s_clk <= not s_clk after 10 ns;

    tb_prc : process
    begin
        s_rst <= '0';
        s_new <= '0';

        wait for 20 ns;

        s_rst <= '1';
        s_new <= '1';
        s_cmd <= "0110";

        wait for 40 ns;

        s_new <= '0';


        wait until s_done = '1';

        s_new <= '1';
        s_cmd <= "1001";

        wait for 20 ns;

        s_new <= '0';

        wait for 400 ns;

    end process;
end architecture;