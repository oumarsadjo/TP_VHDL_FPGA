----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/29/2023 04:10:58 PM
-- Design Name: 
-- Module Name: tesbench_decodeur3_6 - archi_tesbench_decodeur3_6
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tesbench_decodeur3_6 is
--  Port ( );
end tesbench_decodeur3_6;

architecture archi_tesbench of tesbench_decodeur3_6 is
--Declarations du composant
component decodeur3_6 is
generic (Tps : time:=0ns);
  Port ( E2, E1, E0 : in std_logic_vector(3 downto 0);
        S5, S4, S3, S2, S1, S0 : out std_logic_vector(3 downto 0));
end component;

--Declaration des files
signal E2_i, E1_i, E0_i : std_logic_vector(3 downto 0);
signal S5_i, S4_i, S3_i, S2_i, S1_i, S0_i : std_logic_vector(3 downto 0);

--Precision de l'architecture a utiliser
for inst_structurel: decodeur3_6
    use entity work.decodeur3_6(archi_structurel);

--for ints_comportemental: decodeur3_6
--    use entity work.decodeur3_6(archi_structurel);

begin
inst_structurel: decodeur3_6
--Soudage des files
    port map(
    E2 => E2_i,
    E1 => E1_i,
    E0 => E0_i,
    
    S5 => S5_i,
    S4 => S4_i,
    S3 => S3_i,
    S2 => S2_i,
    S1 => S1_i,
    S0 => S0_i
    );

--Entree les valeurs a tester
E2_i <= "0000","0011" after 10ns; -- valeur 3
E1_i <= "0000","0011" after 10ns, "0001" after 50ns; -- valeur 1
E0_i <= "0000","0011" after 10ns, "0001" after 50ns, "0101" after 35ns ; -- valeur 5

ints_comportemental : decodeur3_6
--Soudage des files
    port map(
    E2 => E2_i,
    E1 => E1_i,
    E0 => E0_i,
    
    S5 => S5_i,
    S4 => S4_i,
    S3 => S3_i,
    S2 => S2_i,
    S1 => S1_i,
    S0 => S0_i
    );
--Phase de test en style comportemental : wait for 10 ns
p1: process
    begin
        E2_i <="0011"; --Chargement de 3
        wait for 10ns;
        E1_i<="0001"; --Chargement de 1
        wait for 50ns;
        E0_i <="0101"; --Chargement de 5
        wait for 35ns;
    end process;
end archi_tesbench;
