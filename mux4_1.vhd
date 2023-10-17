----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2023 08:18:34 AM
-- Design Name: 
-- Module Name: mux4_1 - Behavioral
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

entity Mux4_1 is
port(Sel : in bit_vector(1 downto 0);
    A, B, C, D : in bit;
    S : out bit);
end Mux4_1;

--Architecture avec When-Else
architecture flow_when of Mux4_1 is
begin
    S <= A when (Sel = "00") else
    B when (Sel = "01") else
    C when (Sel = "10") else
    D;
end flow_when;

--Architecture avec With-Select
architecture flow_with of Mux4_1 is
begin
    with Sel select
        S <= A when "00",
        B when "01",
        C when "10",
        D when others;
end flow_with;