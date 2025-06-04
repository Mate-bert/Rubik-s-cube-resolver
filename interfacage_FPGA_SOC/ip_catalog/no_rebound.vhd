library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity no_rebound is
  Port (
        i_clk   : in std_logic;
        i_rst   : in std_logic;
        i_go  : in std_logic;
        o_go  : out std_logic
         );
end no_rebound;

architecture Behavioral of no_rebound is

    signal s_done_d : std_logic;
    signal s_done_dd : std_logic;
    signal s_done_ddd : std_logic;
    
    
begin

    process(i_clk, i_rst)
    begin
        if rising_edge(i_clk) then
            if i_rst = '0' then
                s_done_d <= '0';
                s_done_dd <= '0';
                s_done_ddd <= '0';
            else
                s_done_d <= i_go;
                s_done_dd <= s_done_d;
                s_done_ddd <= s_done_dd;
            end if;
        end if;
    end process;
    
    o_go <= '1' when (s_done_ddd = '1' and s_done_dd = '0' and s_done_d = '0' and i_go = '0') else
              '0';
   

end Behavioral;
