----------------------------------------------------------------------------------
-- Create Date: 02/05/2024 09:58:14 AM
-- Author Name: Oumar Sadjo Barry / oumar-sadjo.barry@etu.univ-cotedazur.fr
-- Module Name: testbench_commandeMoteur - archi_testbench_commandeMoteur
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench_commandeMoteur is
--  Port ( );
end testbench_commandeMoteur;

architecture archi_testbench_commandeMoteur of testbench_commandeMoteur is
--Declaration du compoenent
component CommandeMoteur is
  Port ( CLK : in std_logic;
         reset: in std_logic;
         sens : in std_logic;
         S    : out std_logic_vector(3 downto 0) );
end component;

--Preciser l'architecture a utiliser
--C'est facultatif si on a une seule architecture
for inst_test: CommandeMoteur
    use entity work.CommandeMoteur(archi_CommandeMoteur);

--Declaration des fils
signal CLK_i : std_logic :='0'; --Toujours initialise les entrees
signal reset_i : std_logic;
signal sens_i : std_logic :='0';    --Toujours initialise les entrees
signal S_i : std_logic_vector(3 downto 0);

begin
    --Soudage
    inst_test: CommandeMoteur
    port map(
              CLK => CLK_i,
              reset => reset_i,
              sens => sens_i,
              S => S_i);
    --process de test
    process_test: process
        begin
            reset_i <= '1';
            wait for 5 ns;
            
            reset_i <= '0';
            
            sens_i <= '0';
            wait for 100 ns;
            
            sens_i <= '1';
            wait for 100ns;
        end process process_test;
        
        --L'horloge
        CLK_i <= not CLK_i after 5 ns;
end archi_testbench_commandeMoteur;




