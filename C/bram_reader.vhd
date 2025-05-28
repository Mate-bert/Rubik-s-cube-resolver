library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bram_to_leds is
    Port (
        clk     : in  STD_LOGIC;
        start   : in std_logic;
        data_in : in  STD_LOGIC_VECTOR(31 downto 0);  -- sortie de la BRAM
        bram_addr : out std_logic_vector(31 downto 0);
        leds    : out STD_LOGIC_VECTOR(7 downto 0)    -- vers LEDs
    );
end bram_to_leds;

architecture Behavioral of bram_to_leds is
begin

    bram_addr <= (others => '0');


    process(clk)
    begin
        if rising_edge(clk) then
            if start = '1' then
                leds <= data_in(7 downto 0);
            else   
                leds <= (others => '0');
            end if;
        end if;
    end process;

end architecture;
