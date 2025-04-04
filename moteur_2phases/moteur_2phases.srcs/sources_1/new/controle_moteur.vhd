----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.04.2025 09:42:51
-- Design Name: 
-- Module Name: controle_moteur - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library ieee;
--! use logic elements
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity controle_moteur is
  Port ( 
        clk : in std_logic;
        rst : in std_logic;
        
        start : in std_logic;
        sens  : in std_logic;
        restart : in std_logic;
        leds  : out std_logic_vector(3 downto 0);
        phase : out std_logic_vector(3 downto 0)
  );
end controle_moteur;

architecture Behavioral of controle_moteur is

signal s_cpt    : std_logic_vector(31 downto 0);
signal cpt_go   : std_logic;
signal cpt_loop : std_logic_vector(3 downto 0);
signal s_phase : std_logic_vector(3 downto 0);

type SM is (IDLE, PH1, PH2, PH3, PH4, WAITING);
signal s_state : SM;

begin

phase <= s_phase;
leds <= s_phase;


    prc_cpt : process(clk, rst)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                s_cpt <= (others => '0');
            else
                if start = '1' then
                    if s_cpt = x"000FFFFF" then
                        s_cpt <= (others => '0');
                        cpt_go <= '1';
                    else
                        s_cpt <= s_cpt + 1;
                        cpt_go <= '0';
                    end if;
                else
                    s_cpt <= (others => '0');
                    cpt_go <= '0';
                end if;             
           end if;
        end if;
     end process;
     
     state_machine : process(clk, rst)
     begin
        if rising_edge(clk) then
            if rst = '1' then
                s_state <= IDLE;
                s_phase <= "0000";
            else
                case s_state is 
                    when IDLE =>
                        if start = '1' then
                            if sens = '0' then
                                s_state <= PH1;
                                s_phase <= "0101";
                            else
                                s_state <= PH4;
                                s_phase <= "1001";
                            end if;
                        else
                            s_state <= IDLE;
                            s_phase <= "0000";
                        end if;
                      
                    when PH1 =>
                        if start = '1' then
                            if cpt_go = '1' then
                                if sens = '0' then
                                    s_state <= PH2;
                                    s_phase <= "0110";
                                else
                                    s_state <= PH4;
                                    s_phase <= "1001";
                                    cpt_loop <= cpt_loop + 1;
                                end if;
                             
                            else
                                s_state <= PH1;
                                s_phase <= "0101";
                            end if;
                       else
                            s_state <= IDLE;
                            s_phase <= "0000";
                       end if;
                       
                    when PH2 =>
                        if start = '1' then
                            if cpt_go = '1' then
                                if sens = '0' then
                                    s_state <= PH3;
                                    s_phase <= "1010";
                                else
                                    if cpt_loop = 12 then
                                        s_state <= WAITING;
                                        s_phase <= "0000";
                                        cpt_loop <= (others => '0');
                                    else
                                        s_state <= PH1;
                                        s_phase <= "0101";
                                    end if;
                                end if;
                            else
                                s_state <= PH2;
                                s_phase <= "0110";
                            end if;
                        else
                            s_state <= IDLE;
                            s_phase <= "0000";
                        end if;
                        
                    when PH3 =>
                        if start = '1' then
                            if cpt_go = '1' then
                                if sens = '0' then
                                    if cpt_loop = 12 then
                                        s_state <= WAITING;
                                        s_phase <= "0000";
                                        cpt_loop <= (others => '0');
                                    else
                                        s_state <= PH4;
                                        s_phase <= "1001";
                                    end if;
                                else
                                    s_state <= PH2;
                                    s_phase <= "0110";
                                end if;
                            else
                                s_state <= PH3;
                                s_phase <= "1010";
                            end if;
                        else
                            s_state <= IDLE;
                            s_phase <= "0000";
                        end if;
                        
                    when PH4 => 
                        if start = '1' then
                            if cpt_go = '1' then
                                if sens = '0' then             
                                    s_state <= PH1;
                                    s_phase <= "0101";
                                    cpt_loop <= cpt_loop + 1;
                                else
                                    s_state <= PH3;
                                    s_phase <= "1010";
                                end if;
                            else
                                s_state <= PH4;
                                s_phase <= "1001";
                            end if;
                        else
                            s_state <= IDLE;
                            s_phase <= "0000";
                        end if;
                        
                    when WAITING =>
                        if start = '1' then
                            if restart = '1' then 
                                if sens = '0' then
                                    s_state <= PH1;
                                    s_phase <= "0101";
                                else
                                    s_state <= PH4;
                                    s_phase <= "1001";
                                end if;
                            else
                                s_state <= WAITING;
                                s_phase <= "0000";
                            end if;
                       else
                            s_state <= IDLE;
                            s_phase <= "0000";
                       end if;
                    end case;
               end if;
           end if;
       end process;
                    
end Behavioral;
