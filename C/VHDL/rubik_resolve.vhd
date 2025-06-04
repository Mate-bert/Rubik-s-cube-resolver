library IEEE;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity rubik_resolver is
	port(
		i_clk	: in std_logic;
		i_rst   : in std_logic;
		i_cmd	: in std_logic_vector(3 downto 0);
		i_new	: in std_logic;
		
		o_done	: out std_logic;
		o_m1	: out std_logic_vector(3 downto 0);
		o_m2	: out std_logic_vector(3 downto 0);
		o_m3	: out std_logic_vector(3 downto 0);
		o_m4 	: out std_logic_vector(3 downto 0);
		o_m5	: out std_logic_vector(3 downto 0);
		o_m6 	: out std_logic_vector(3 downto 0);
		o_leds  : out std_logic_vector(3 downto 0)
	);
end entity;

architecture rtl_rubik of rubik_resolver is
	type state is (IDLE, M1_P1, M1_P2, M1_P3, M1_P4, M2_P1, M2_P2, M2_P3, M2_P4, M3_P1, M3_P2, M3_P3, M3_P4, M4_P1, M4_P2, M4_P3, M4_P4, 
			       M5_P1, M5_P2, M5_P3, M5_P4, M6_P1, M6_P2, M6_P3, M6_P4);
	signal s_state : state;
	signal s_cmd_d : std_logic_vector(3 downto 0);
	signal s_done  : std_logic := '0';

    signal s_start_cnt_phase : std_logic;
	signal s_cpt_phase 	: std_logic_vector(31 downto 0);
	signal s_next_phase	: std_logic;
	signal s_cpt_loop	: std_logic_vector(3 downto 0);

begin
	o_leds <= i_cmd;

	prc_cmd_reg : process(i_clk, i_rst)
	begin
		if rising_edge(i_clk) then
			if i_rst = '0' then
				s_cmd_d <= (others => '0');
			else
				s_cmd_d <= i_cmd;
			end if;
		end if;
	end process;

	prc_cpt_phase : process(i_clk, i_rst)
    begin
        if rising_edge(i_clk) then
            if i_rst = '0' then
                s_cpt_phase <= (others => '0');
				s_next_phase <= '0';
            else
                if s_start_cnt_phase = '1' then
                    if s_cpt_phase = x"0007FFFF" then --x"000FFFFF" = 1.6A , x"000AFFFF" = 1.3A --x"0007FFFF = 1.1A
                        s_cpt_phase <= (others => '0');
                        s_next_phase <= '1';
                    else
                        s_cpt_phase <= s_cpt_phase + 1;
                        s_next_phase <= '0';
                    end if;
                else
                    s_cpt_phase <= (others => '0');
                    s_next_phase  <= '0';
                end if;             
           end if;
        end if;
     end process;

	prc_SM : process(i_clk, i_rst)
	begin
		if rising_edge(i_clk) then
			if i_rst = '0' then
				s_state <= IDLE;
				o_m1 <= (others => '0'); o_m2 <= (others => '0'); o_m3 <= (others => '0');
				o_m4 <= (others => '0'); o_m5 <= (others => '0'); o_m6 <= (others => '0');
				s_cpt_loop <= (others => '0');
				s_done <= '0';
				s_start_cnt_phase <= '0';
			else
				s_done <= '0';  -- Par défaut, done est à 0
				case s_state is
					when IDLE =>
						o_m1 <= (others => '0'); o_m2 <= (others => '0'); o_m3 <= (others => '0');
						o_m4 <= (others => '0'); o_m5 <= (others => '0'); o_m6 <= (others => '0');
						s_start_cnt_phase <= '0';  -- Réinitialisation à chaque entrée dans IDLE
						if i_new = '1' then
							s_start_cnt_phase <= '1';
							if s_cmd_d(3) = '0' then
								case s_cmd_d(2 downto 0) is
									when "001" => s_state <= M1_P1;
									when "010" => s_state <= M2_P1;
									when "011" => s_state <= M3_P1;
									when "100" => s_state <= M4_P1;
									when "101" => s_state <= M5_P1;
									when "110" => s_state <= M6_P1;
									when others => s_state <= IDLE;
								end case;
							else
								case s_cmd_d(2 downto 0) is
									when "001" => s_state <= M1_P4;
									when "010" => s_state <= M2_P4;
									when "011" => s_state <= M3_P4;
									when "100" => s_state <= M4_P4;
									when "101" => s_state <= M5_P4;
									when "110" => s_state <= M6_P4;
									when others => s_state <= IDLE;
								end case;
							end if;
						else
						    s_state <= IDLE;
						    s_start_cnt_phase <= '0';
						end if;

					-- MOTEUR 1
					when M1_P1 => 
						o_m1 <= "0101"; 
						if s_next_phase = '1' then 
							if s_cmd_d(3) = '0' then 
								s_state <= M1_P2; 
							else 
								s_state <= M1_P4; 
								s_cpt_loop <= s_cpt_loop + 1;
							end if;
						end if;

					when M1_P2 => 
						o_m1 <= "0110"; 
						if s_next_phase = '1' then
							if s_cmd_d(3) = '0' then 
								s_state <= M1_P3; 
							else 
								if s_cpt_loop = 12 then
									s_state <= IDLE; 
									s_cpt_loop <= (others => '0');
									s_done <= '1';
									s_start_cnt_phase <= '0';
								else
									s_state <= M1_P1;
								end if;
							end if;
						end if;

					when M1_P3 => 
						o_m1 <= "1010"; 
						if s_next_phase = '1' then
							if s_cmd_d(3) = '0' then 
								if s_cpt_loop = 12 then
									s_state <= IDLE;
									s_cpt_loop <= (others => '0');
									s_done <= '1';
									s_start_cnt_phase <= '0';
								else
									s_state <= M1_P4; 
								end if;
							else 
								s_state <= M1_P2; 
							end if;
						end if;

					when M1_P4 => 
						o_m1 <= "1001"; 
						if s_next_phase = '1' then
							if s_cmd_d(3) = '0' then
								s_state <= M1_P1;
								s_cpt_loop <= s_cpt_loop + 1;
							else 
								s_state <= M1_P3;
							end if;
						end if;
						

					-- MOTEUR 2
					when M2_P1 => 
						o_m2 <= "0101"; 
						if s_next_phase = '1' then 
							if s_cmd_d(3) = '0' then 
								s_state <= M2_P2; 
							else 
								s_state <= M2_P4; 
								s_cpt_loop <= s_cpt_loop + 1;
							end if;
						end if;

					when M2_P2 => 
						o_m2 <= "0110"; 
						if s_next_phase = '1' then
							if s_cmd_d(3) = '0' then 
								s_state <= M2_P3; 
							else 
								if s_cpt_loop = 12 then
									s_state <= IDLE; 
									s_cpt_loop <= (others => '0');
									s_done <= '1';
									s_start_cnt_phase <= '0';
								else
									s_state <= M2_P1;
								end if;
							end if;
						end if;

					when M2_P3 => 
						o_m2 <= "1010"; 
						if s_next_phase = '1' then
							if s_cmd_d(3) = '0' then 
								if s_cpt_loop = 12 then
									s_state <= IDLE;
									s_cpt_loop <= (others => '0');
									s_done <= '1';
									s_start_cnt_phase <= '0';
								else
									s_state <= M2_P4; 
								end if;
							else 
								s_state <= M2_P2; 
							end if;
						end if;

					when M2_P4 => 
						o_m2 <= "1001"; 
						if s_next_phase = '1' then
							if s_cmd_d(3) = '0' then
								s_state <= M2_P1;
								s_cpt_loop <= s_cpt_loop + 1;
							else 
								s_state <= M2_P3;
							end if;
						end if;

					-- MOTEUR 3
					when M3_P1 => 
						o_m3 <= "0101"; 
						if s_next_phase = '1' then 
							if s_cmd_d(3) = '0' then 
								s_state <= M3_P2; 
							else 
								s_state <= M3_P4; 
								s_cpt_loop <= s_cpt_loop + 1;
							end if;
						end if;

					when M3_P2 => 
						o_m3 <= "0110"; 
						if s_next_phase = '1' then
							if s_cmd_d(3) = '0' then 
								s_state <= M3_P3; 
							else 
								if s_cpt_loop = 12 then
									s_state <= IDLE; 
									s_cpt_loop <= (others => '0');
									s_done <= '1';
									s_start_cnt_phase <= '0';
								else
									s_state <= M3_P1;
								end if;
							end if;
						end if;

					when M3_P3 => 
						o_m3 <= "1010"; 
						if s_next_phase = '1' then
							if s_cmd_d(3) = '0' then 
								if s_cpt_loop = 12 then
									s_state <= IDLE;
									s_cpt_loop <= (others => '0');
									s_done <= '1';
									s_start_cnt_phase <= '0';
								else
									s_state <= M3_P4; 
								end if;
							else 
								s_state <= M3_P2; 
							end if;
						end if;

					when M3_P4 => 
						o_m3 <= "1001"; 
						if s_next_phase = '1' then
							if s_cmd_d(3) = '0' then
								s_state <= M3_P1;
								s_cpt_loop <= s_cpt_loop + 1;
							else 
								s_state <= M3_P3;
							end if;
						end if;

					-- MOTEUR 4
					when M4_P1 => 
						o_m4 <= "0101"; 
						if s_next_phase = '1' then 
							if s_cmd_d(3) = '0' then 
								s_state <= M4_P2; 
							else 
								s_state <= M4_P4; 
								s_cpt_loop <= s_cpt_loop + 1;
							end if;
						end if;

					when M4_P2 => 
						o_m4 <= "0110"; 
						if s_next_phase = '1' then
							if s_cmd_d(3) = '0' then 
								s_state <= M4_P3; 
							else 
								if s_cpt_loop = 12 then
									s_state <= IDLE; 
									s_cpt_loop <= (others => '0');
									s_done <= '1';
									s_start_cnt_phase <= '0';
								else
									s_state <= M4_P1;
								end if;
							end if;
						end if;

					when M4_P3 => 
						o_m4 <= "1010"; 
						if s_next_phase = '1' then
							if s_cmd_d(3) = '0' then 
								if s_cpt_loop = 12 then
									s_state <= IDLE;
									s_cpt_loop <= (others => '0');
									s_done <= '1';
									s_start_cnt_phase <= '0';
								else
									s_state <= M4_P4; 
								end if;
							else 
								s_state <= M4_P2; 
							end if;
						end if;

					when M4_P4 => 
						o_m4 <= "1001"; 
						if s_next_phase = '1' then
							if s_cmd_d(3) = '0' then
								s_state <= M4_P1;
								s_cpt_loop <= s_cpt_loop + 1;
							else 
								s_state <= M4_P3;
							end if;
						end if;

					-- MOTEUR 5
					when M5_P1 => 
						o_m5 <= "0101"; 
						if s_next_phase = '1' then 
							if s_cmd_d(3) = '0' then 
								s_state <= M5_P2; 
							else 
								s_state <= M5_P4; 
								s_cpt_loop <= s_cpt_loop + 1;
							end if;
						end if;

					when M5_P2 => 
						o_m5 <= "0110"; 
						if s_next_phase = '1' then
							if s_cmd_d(3) = '0' then 
								s_state <= M5_P3; 
							else 
								if s_cpt_loop = 12 then
									s_state <= IDLE; 
									s_cpt_loop <= (others => '0');
									s_done <= '1';
									s_start_cnt_phase <= '0';
								else
									s_state <= M5_P1;
								end if;
							end if;
						end if;

					when M5_P3 => 
						o_m5 <= "1010"; 
						if s_next_phase = '1' then
							if s_cmd_d(3) = '0' then 
								if s_cpt_loop = 12 then
									s_state <= IDLE;
									s_cpt_loop <= (others => '0');
									s_done <= '1';
									s_start_cnt_phase <= '0';
								else
									s_state <= M5_P4; 
								end if;
							else 
								s_state <= M5_P2; 
							end if;
						end if;

					when M5_P4 => 
						o_m5 <= "1001"; 
						if s_next_phase = '1' then
							if s_cmd_d(3) = '0' then
								s_state <= M5_P1;
								s_cpt_loop <= s_cpt_loop + 1;
							else 
								s_state <= M5_P3;
							end if;
						end if;

					-- MOTEUR 6
					when M6_P1 => 
						o_m6 <= "0101"; 
						if s_next_phase = '1' then 
							if s_cmd_d(3) = '0' then 
								s_state <= M6_P2; 
							else 
								s_state <= M6_P4; 
								s_cpt_loop <= s_cpt_loop + 1;
							end if;
						end if;

					when M6_P2 => 
						o_m6 <= "0110"; 
						if s_next_phase = '1' then
							if s_cmd_d(3) = '0' then 
								s_state <= M6_P3; 
							else 
								if s_cpt_loop = 12 then
									s_state <= IDLE; 
									s_cpt_loop <= (others => '0');
									s_done <= '1';
									s_start_cnt_phase <= '0';
								else
									s_state <= M6_P1;
								end if;
							end if;
						end if;

					when M6_P3 => 
						o_m6 <= "1010"; 
						if s_next_phase = '1' then
							if s_cmd_d(3) = '0' then 
								if s_cpt_loop = 12 then
									s_state <= IDLE;
									s_cpt_loop <= (others => '0');
									s_done <= '1';
									s_start_cnt_phase <= '0';
								else
									s_state <= M6_P4; 
								end if;
							else 
								s_state <= M6_P2; 
							end if;
						end if;

					when M6_P4 => 
						o_m6 <= "1001"; 
						if s_next_phase = '1' then
							if s_cmd_d(3) = '0' then
								s_state <= M6_P1;
								s_cpt_loop <= s_cpt_loop + 1;
							else 
								s_state <= M6_P3;
							end if;
						end if;
				end case;
			end if;
		end if;
	end process;

	o_done <= s_done;

end architecture;
