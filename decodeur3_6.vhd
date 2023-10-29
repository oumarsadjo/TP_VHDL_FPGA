----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/29/2023 03:48:25 PM
-- Design Name: 
-- Module Name: decodeur3_6 - archi_decodeur3_6
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

entity decodeur3_6 is
generic (Tps : time:=0ns);
  Port ( E2, E1, E0 : in std_logic_vector(3 downto 0);
        S5, S4, S3, S2, S1, S0 : out std_logic_vector (3 downto 0));
end decodeur3_6;

--Decription structurelle du composant

architecture archi_structurel of decodeur3_6 is

begin
    S0<= not E2 and not E1 and not E0 after Tps;
    S1<= not E2 and not E1 and E0 after Tps;
    S2<= not E2 and E1 and not E0 after Tps;
    S3<= E2 and not E1 and not E0 after Tps;
    S4<= E2 and not E1 and E0 after Tps;
    S5<= E2 and E1 and not E0 after Tps;
end archi_structurel;
