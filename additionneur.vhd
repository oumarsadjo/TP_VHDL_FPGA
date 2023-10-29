library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Additionneur is
    generic(Tps,Tpc : time := 0ns);
    port(A, B : in std_logic ;
        Cin : in std_logic := '0';
        Sout : out std_logic;
        Cout : out std_logic);
end Additionneur;

architecture flow of Additionneur is
begin
    Sout <= A xor B xor Cin after Tps;
    Cout <= (A and B) or (Cin and (A xor B)) after Tpc;
end flow;

architecture structural of Additionneur is
    component Demi_Additionneur
    generic(Tp : time := 10 ns);
        port(A, B : in std_logic;
            Cout : out std_logic;
            Sout : out std_logic);
end component;

signal S0,S1,S2 : std_logic;
begin
    inst1: Demi_Additionneur
            generic map (Tp => 0 ns)
            port map (A, B, S0, S1);
    inst3: Demi_Additionneur
        port map (A => S1,
            B => Cin,
            Cout => S2,
            Sout => Sout);
    inst2: Cout <= S0 or S2;
end structural;

--Structure avec Process
architecture behavior of Additionneur is
begin
    process_additionneur: process
    variable N : integer range 0 to 3;
    --Decclaration de constantes
    constant sumvecteur : std_logic_vector(0 to 3) := "0101";
    
    constant coutvecteur : std_logic_vector(0 to 3) := "0011";
    begin
        N := 0;
        --Declaration d'un vecteur de 4 bits
        if A='1' then
            N := N + 1;
        end if;
        if B='1' then
            N := N + 1;
        end if;
        if Cin='1' then
            N := N + 1;
        end if;
        Sout <= sumvecteur(N) after Tps;
        Cout <= coutvecteur(N) after Tpc;
        wait on A, B, Cin;
    end process process_additionneur;
end behavior;