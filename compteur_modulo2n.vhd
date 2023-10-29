----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/29/2023 09:06:22 PM
-- Design Name: 
-- Module Name: compteur_modulo2n - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity compteur_modulo2n is
generic( N: natural :=4);
  Port ( clk : in std_logic;
         reset_n : in std_logic;
         Sout : out std_logic_vector (N-1 downto 0) );
end compteur_modulo2n;

architecture Behavioral of compteur_modulo2n is
--Signaux internes
signal S_i : std_logic_vector(N-1 downto 0);

begin
    Sout <= S_i;
    compteur: process(reset_n,clk)
        begin
            if (reset_n = '0') then
            for i in 0 to N-1 loop
            S_i (i) <='0';
            end loop;
            
            elsif clk'event and clk ='1' then
                S_i <= S_i +1;
            end if;
    end process compteur;
end Behavioral;
