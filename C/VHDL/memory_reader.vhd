library IEEE;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity memory_reader_IP is 
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
        bram_dout  : out std_logic_vector(31 downto 0);  -- jamais utilisé ici
        bram_en    : out std_logic;
        bram_rst   : out std_logic;
        bram_we    : out std_logic_vector(3 downto 0)
    );
end entity;

architecture rtl_memory_reader of memory_reader_IP is

    type sending_state is (IDLE, WAIT_READ, READING, SENDING);
    signal send_state     : sending_state := IDLE;
    signal s_count_addr   : std_logic_vector(31 downto 0);

begin

    -- Signaux BRAM fixes
    bram_clk <= i_clk;
    bram_en  <= '1';  -- BRAM toujours activée
    bram_rst <= '0';
    bram_we  <= (others => '0');
    bram_dout <= (others => '0');  -- inutilisé
    bram_addr <= s_count_addr;

    -- FSM principale
    process(i_clk)
    begin
        if rising_edge(i_clk) then
            if i_rst = '0' then
                send_state <= IDLE;
                s_count_addr <= (others => '0');
                o_cmd <= (others => '0');
                o_new <= '0';
            else
                case send_state is
                    when IDLE =>
                        o_cmd <= (others => '0');
                        o_new <= '0';
                        if i_go = '1' then
                            s_count_addr <= (others => '0');
                            o_new <= '1';
                            send_state <= WAIT_READ;
                        end if;

                    when WAIT_READ =>
                        send_state <= READING;
                        s_count_addr <= s_count_addr;
                        o_new <= '1';

                    when READING =>
                        if bram_din = x"4C415354" then  -- "LAST" en ASCII
                            send_state <= IDLE;
                            o_cmd <= (others => '0');
                            o_new <= '0';
                        else
                            o_cmd <= bram_din(3 downto 0);
                            o_new <= '0';
                            send_state <= SENDING;
                        end if;

                    when SENDING =>
                        if i_done = '1' then
                            s_count_addr <= s_count_addr + 4;
                            send_state <= WAIT_READ;
                            o_new <= '1';
                        else
                            o_new <= '0';
                            s_count_addr <= s_count_addr;
                            send_state <= send_state;
                        end if;
                end case;
            end if;
        end if;
    end process;

end architecture;
