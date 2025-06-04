library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

entity accu is
generic (NWORDS : natural := 10; NBITS : natural := 8) ;
    port (
        clk : in std_logic;
        -- start a 1 == > declenche la somme des elements de "table"
        start : in std_logic;
        somme : out std_logic_vector (NBITS-1 downto 0)
    ); 
end entity;

architecture behav of accu is
    signal buf : std_logic_vector (NBITS-1 downto 0);
    type array_accu is array (0 to NWORDS-1) of integer;
    signal table : array_accu := (1,2,5,7,11,-12, 8, 13, 27,-43) ;

    -- etats de la machine
    type etat is (Repos, Calcul, Fin) ;
    signal present : etat := Repos;

begin

    proc : process ( clk, start)
    variable i : integer range 0 to NWORDS;
    begin
        if rising_edge(clk) then
            if (start = 'l') then
                i := 0;
                buf <= (others => '0');
                present <= Repos;
            else
                case (present) is
                    when Repos =>
                        buf <= unsigned(to_integer(table(i)))
                        i := 1;
                        present <= Calcul;
                    
                    when Calcul =>
                        buf <= unsigned(to_integer(table(i))) + buf;
                        i := i + 1;
                        if (i < NWORDS) then
                            present <= Calcul;
                        else
                            present <= Fin;
                        end if;

                    when Fin =>
                        present <= Fin;
                    
                    end case;
                end if;
            end if;
        end process;

    somme <= buf;

    end architecture;