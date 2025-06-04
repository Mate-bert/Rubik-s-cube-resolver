library IEEE;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity top_tb is
end entity;

architecture rtl of top_tb is

    signal s_clk    : std_logic := '1';
    signal s_rst    : std_logic;
    signal s_go     : std_logic;

    signal s_m1     : std_logic_vector(3 downto 0);
    signal s_m2     : std_logic_vector(3 downto 0);
    signal s_m3     : std_logic_vector(3 downto 0);
    signal s_m4     : std_logic_vector(3 downto 0);
    signal s_m5     : std_logic_vector(3 downto 0);
    signal s_m6     : std_logic_vector(3 downto 0);
    signal s_leds   : std_logic_vector(3 downto 0);

    component top
    port(
        i_clk   : in std_logic;
        i_rst   : in std_logic;
        i_go    : in std_logic;

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

    UUT : top
    port map(
        i_clk   => s_clk,
        i_rst   => s_rst,
        i_go    => s_go,

        o_m1    => s_m1,
        o_m2    => s_m2,
        o_m3    => s_m3,
        o_m4    => s_m4,
        o_m5    => s_m5,
        o_m6    => s_m6,
        o_leds  => s_leds
    );

    s_clk <= not s_clk after 10 ns;

    prc_tb : process
    begin 
        s_rst <= '0';
        s_go <= '0';

        wait for 20 ns;

        s_rst <= '1';

        wait for 20 ns;

        s_go <= '1';

        wait for 1000000000 ns;

    end process;


end architecture;