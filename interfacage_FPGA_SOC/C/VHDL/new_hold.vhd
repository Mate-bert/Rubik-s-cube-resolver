library IEEE;
use ieee.std_logic_1164.all;

entity new_hold is
    port(
        i_clk    : in  std_logic;
        i_rst    : in  std_logic;
        i_new    : in  std_logic;
        o_hold   : out std_logic
    );
end entity;

architecture rtl of new_hold is
    signal s_hold    : std_logic := '0';
    signal s_new_reg : std_logic := '0';
begin
    -- Registre pour détecter le front montant
    prc_reg : process(i_clk, i_rst)
    begin
        if i_rst = '0' then
            s_new_reg <= '0';
        elsif rising_edge(i_clk) then
            s_new_reg <= i_new;
        end if;
    end process;

    -- Processus de maintien du signal
    prc_hold : process(i_clk, i_rst)
    begin
        if i_rst = '0' then
            s_hold <= '0';
        elsif rising_edge(i_clk) then
            if i_new = '1' and s_new_reg = '0' then  -- Détection du front montant
                s_hold <= '1';
            end if;
        end if;
    end process;

    -- Sortie
    o_hold <= s_hold;

end architecture;
