----------------------------------------------------------------------------------
-- Create Date: 02/05/2024 09:40:21 AM
-- Author Name: Oumar Sadjo Barry / oumar-sadjo.barry@etu.univ-cotedazur.fr
-- Module Name: CommandeMoteur - archi_CommandeMoteur
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CommandeMoteur is
  Port ( CLK : in std_logic;
         reset: in std_logic;
         sens : in std_logic;
         S    : out std_logic_vector(3 downto 0) );
end CommandeMoteur;

architecture archi_CommandeMoteur of CommandeMoteur is
type defEtat is (E1, E2, E3, E4);
signal etat, etat_nxt : defEtat;

begin
--Premier process
    process_CLK: process(CLK, reset)
        begin
            if reset = '1' then
                etat <= E1;
            elsif CLK 'event and CLK = '1' then
                etat <= etat_nxt;
            end if;
        end process process_CLK;
--Deuxieme process du programme
    process_prog: process(etat, sens)
        begin
            etat_nxt <= etat;
            S <= "1001";
            
            case etat is
                when E1 =>
                    if sens = '1' then
                        etat_nxt <= E2;
                        S <= "1010";
                    else
                        etat_nxt <= E4;
                        S <= "0101";
                    end if;
                 when E2 =>
                    if sens = '1' then
                        etat_nxt <= E3;
                        S <= "0110";
                    else
                        etat_nxt <= E1;
                        S <= "1001";
                    end if;
                when E3 =>
                    if sens = '1' then
                        etat_nxt <= E4;
                        S <= "0101";
                    else
                        etat_nxt <= E2;
                        S <= "1010";
                    end if;
                when E4 =>
                    if sens = '1' then
                        etat_nxt <= E1;
                        S <= "1001";
                    else
                        etat_nxt <= E3;
                        S <= "0110";
                    end if;
                end case;
            end process process_prog;
end archi_CommandeMoteur;
