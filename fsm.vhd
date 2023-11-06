library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM is
  Port (clk, a, b, rst : in std_logic;
  s : out std_logic );
end FSM;

--Premiere description avec variable
architecture synth_1Process of FSM is

begin
fsm : process(rst, clk)
        type defEtat is(E0, E1, E2);
variable etat : defEtat;
begin if rst = '1' then
  etat := E0;
    s <= '1';
    elsif clk'event and clk = '1' then case etat is
          when E0 => s <= '1';
        if a = '1' and b = '1' then
            etat := E1;
        end if;
        when E1 => s <= '0';
        if a
          = '0' then
            etat := E2;
        end if;
        when E2 => s <= '1';
        if b
          = '0' then
            etat := E0;
        end if;
    end case;
    end if;
end process;
end synth_1Process;

--Deuxieme description avec signal
architecture synth_1Process_sig of FSM is
type defEtat is(E0, E1, E2);
signal etat : defEtat;

begin
p1 : process(rst, clk)    
begin
    if rst = '1' then
  etat <= E0;
    s <= '1';
    elsif clk'event and clk = '1' then case etat is
          when E0 => s <= '1';
        if a = '1' and b = '1' then
            etat <= E1;
        end if;
        when E1 => s <= '0';
        if a = '0' then
            etat <= E2;
        end if;
        when E2 => s <= '1';
        if b = '0' then
            etat <= E0;
        end if;
    end case;
    end if;
end process;
end synth_1Process_sig;

--Description avec 2 process

architecture synth_2Process_sig of FSM is
type defEtat is(E0, E1, E2);
signal etat,etat_nxt : defEtat;

begin
Reg : process(rst, clk)    
begin
    if rst = '1' then
  etat <= E0;
    elsif clk'event and clk = '1' then
    etat <= etat_nxt;
    end if;
    end process Reg;

Comb1_2: process (a,b,etat)
begin
    etat_nxt <= etat;
    s <= '0';
    
    case etat is
    when E0 =>
        s <= '1';
        if a = '1' and b = '1' then
            etat_nxt <= E1;
        end if;
        when E1 =>
        s <= '0';
        if a = '0' then
            etat_nxt <= E2;
        end if;
        when E2 =>
        s <= '1';
        if b = '0' then
            etat_nxt <= E0;
        end if;
    end case;
end process Comb1_2;
end synth_2Process_sig;