----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/04/2023 06:36:40 PM
-- Design Name: 
-- Module Name: testbench - sim
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

entity testbench is
end testbench;

architecture sim of testbench is
component additionneur is
    generic(Tps,Tpc : time := 0ns);
    port(A, B : in std_logic ;
        Cin : in std_logic := '0';
        diff_Sout : out std_logic;
        diff_Cout : out std_logic);
end component;

--Les signaux (fils) a declarer
signal A_i, B_i, Cin_i : std_logic ;

signal Sout_f_i, Cout_f_i : std_logic ;
signal Sout_s_i, Cout_s_i : std_logic ;
signal Sout_b_i, Cout_b_i : std_logic ;
signal diff_sout, diff_cout : std_logic;

--Preciser quelle structure a utiliser
for inst_flow: additionneur
    use entity work.additionneur(flow);

for inst_structural: additionneur
    use entity work.additionneur(structural); 
        
for inst_behavior: additionneur
    use entity work.additionneur(behavior);    
    
begin

diff_sout <= Sout_f_i XOR Sout_s_i XOR Sout_b_i;
diff_cout <= cout_f_i XOR cout_s_i XOR cout_b_i;

--Instancier mon composant a tester
inst_flow: additionneur

    port map (A => A_i,
              B => B_i,
              Cin => Cin_i,
              diff_Cout => Cout_f_i,
              diff_Sout => Sout_f_i);

--Pour entity structural
inst_structural: additionneur

    port map (A => A_i,
              B => B_i,
              Cin => Cin_i,
              diff_Cout => Cout_s_i,
              diff_Sout => Sout_s_i);
                  
--Pour entity behavior
inst_behavior: additionneur

    port map (A => A_i,
              B => B_i,
              Cin => Cin_i,
              diff_Cout => Cout_b_i,
              diff_Sout => Sout_b_i);            
--Generer les stimuli
Cin_i <= '0', '1' after 30 ns;
A_i <= '0', '1' after 5ns, '0' after 20ns;
B_i <= '0', '1' after 5ns, '0' after 10ns, '1' after 40ns, '0' after 45ns;

end sim;