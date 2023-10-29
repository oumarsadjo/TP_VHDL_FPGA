----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/29/2023 10:35:37 AM
-- Design Name: 
-- Module Name: multiplexeur - archi_multiplexeur
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

entity multiplexeur is
    --generic(Tps : time:=0ns);
  Port ( E3, E2, E1, E0 : in std_logic;
  Sel : in std_logic_vector(1 downto 0);
  Sout : out std_logic
  );
end multiplexeur;

architecture archi_multiplexeur of multiplexeur is
signal S3, S2, S1, S0 : std_logic;
begin
--l'affectation inconditionnelle
    S0 <= E0 and not Sel(1) and not Sel(0);
    S1 <= E1 and Sel(1) and not Sel(0);
    S2 <= E2 and not Sel(1) and Sel(0);
    S3 <= E3 and Sel(1) and Sel(0);
    
    Sout <= S0 or S1 or S2 or S3;
end archi_multiplexeur;

architecture when_multiplexeur of multiplexeur is
begin
    Sout <= E0 when (Sel ="00") else
            E1 when (Sel ="01") else
            E2 when (Sel ="10") else
            E3 ;
end when_multiplexeur;

architecture with_multiplexeur of multiplexeur is
begin
    with Sel select
    Sout <= E0 when "00",
            E1 when "01", 
            E2 when "10" ,
            E3 when others;
end with_multiplexeur;

architecture caseWhen_multiplexeur of multiplexeur is
begin
    p1: process(Sel)
        begin
            case Sel is
                when "00" => Sout<= E0;
                when "01" => Sout<= E1;
                when "10" => Sout<= E2;
            when others => Sout<= E3;
        end case;
    end process;
end caseWhen_multiplexeur;

architecture ifthen_multiplexeur of multiplexeur is
begin
    p2: process(Sel)
        begin
            if (Sel = "00") then
            Sout <= E0;
            elsif (Sel ="01") then
            Sout <= E1;
            elsif (Sel ="10") then
            Sout <= E2;
            else
                Sout <= E3;
            end if;
     end process p2;
end ifthen_multiplexeur;