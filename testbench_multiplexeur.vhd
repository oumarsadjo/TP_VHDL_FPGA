----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/29/2023 10:52:24 AM
-- Design Name: 
-- Module Name: testbench_multiplexeur - archi_testbench
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

entity testbench_multiplexeur is
--  Port ( );
end testbench_multiplexeur;

architecture archi_testbench of testbench_multiplexeur is
--Fils
signal E3_i, E2_i, E1_i, E0_i : std_logic;
signal A_i, B_i : std_logic;
signal Sout_i : std_logic;

--Declaration du component
component multiplexeur is
    generic(Tps : time:=0ns);
  Port ( E3, E2, E1, E0 : in std_logic;
  A, B : in std_logic;
  Sout : out std_logic
  );
end component;
begin
    instance : multiplexeur
    port map(
    A => A_i,
    B => B_i,
    E3 => E3_i,
    E2 => E2_i,
    E1 => E1_i,
    E0 => E0_i,
    Sout => Sout_i);
--Phase de tests
E0_i <= '0';
E1_i <= '1';
E2_i <= '0';
E3_i <= '1';

A_i <= '0','1' after 30ns, '0','1' after 40ns, '0','1' after 45ns, '0','1' after 50ns, '0','1' after 60ns;
B_i <= '0','1' after 10ns, '0','1' after 20ns, '0','1' after 30ns, '0','1' after 40ns, '0','1' after 50ns;

end archi_testbench;
