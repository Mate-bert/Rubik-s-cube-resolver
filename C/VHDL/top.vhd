library IEEE;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity top is
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
end entity;

architecture rtl of top is

    signal s_done   : std_logic;
    signal s_new    : std_logic;
    signal s_cmd    : std_logic_vector(3 downto 0);

    signal s_bram_addr  : std_logic_vector(31 downto 0);
    signal s_bram_clk   : std_logic;
    signal s_bram_din   : std_logic_vector(31 downto 0);
    signal s_bram_dout  : std_logic_vector(31 downto 0);
    signal s_bram_en    : std_logic;
    signal s_bram_rst   : std_logic;
    signal s_bram_we    : std_logic_vector(3 downto 0);


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

    component memory_reader 
    port(
        -- Système
        i_clk   : in std_logic;
        i_rst   : in std_logic;

        -- Interface rubik solver
        i_go    : in std_logic;
        i_done  : in std_logic;
        o_cmd   : out std_logic_vector(3 downto 0);
        o_new   : out std_logic;
        
        -- Interface BRAM
        bram_addr  : out std_logic_vector(31 downto 0);
        bram_clk   : out std_logic;
        bram_din   : in  std_logic_vector(31 downto 0);
        bram_dout  : out std_logic_vector(31 downto 0);
        bram_en    : out std_logic;
        bram_rst   : out std_logic;
        bram_we    : out std_logic_vector(3 downto 0)
 
    );
    end component;

begin

    memory_reader_inst : memory_reader
    port map(
        i_clk   => i_clk,
        i_rst   => i_rst,
        i_go    => i_go,
        i_done  => s_done,
        o_cmd   => s_cmd,
        o_new   => s_new,
        bram_addr => s_bram_addr,
        bram_clk  => s_bram_clk,
        bram_din  => s_bram_din,
        bram_dout => s_bram_dout,
        bram_en   => s_bram_en,
        bram_rst  => s_bram_rst,
        bram_we   => s_bram_we
    );

    rubik_resolve_inst : rubik_resolver
    port map(
        i_clk   => i_clk,
        i_rst   => i_rst,
        i_cmd   => "1001",--s_cmd,
        i_new   => s_new,
        o_done  => s_done,
        o_m1    => o_m1,
        o_m2    => o_m2,
        o_m3    => o_m3,
        o_m4    => o_m4,
        o_m5    => o_m5,
        o_m6    => o_m6,
        o_leds  => o_leds
    );

end architecture;



