library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench_fsm is
--Nothing needed
end testbench_fsm;

architecture sim of testbench_fsm is
--Component
component fsm_board is
generic(MAX : natural :=4);
  Port ( rst : in std_logic;
  clk : in std_logic;
  a : in std_logic;
  b : in std_logic;
  s : out std_logic
   );
end component;
--Files
signal clk_i : std_logic :='0' ;
signal rst_i : std_logic;
signal a_i : std_logic;
signal b_i : std_logic;
signal s_i : std_logic;

for inst_sim: fsm_board
    use entity work.fsm_board(archi_fsm_board);
    
begin
inst_sim: fsm_board
    port map(clk => clk_i,
    rst => rst_i,
    a => a_i,
    b => b_i,
    s => s_i);

p1: process
begin
    a_i <= '0';
    b_i <= '0';
    
    rst_i <= '1';
    wait for 20 ns;
    rst_i <= '0';
    
    a_i <= '1';
    b_i <= '1';
    wait for 50 ns;
    
    a_i <= '0';
    wait for 50ns;
    
    b_i <= '0';
    wait for 50 ns;
    
    a_i <= '1';
    b_i <= '1';
    wait for 50ns;
    
    wait;
    end process p1;
    
    --L'horloge
    clk_i <= not clk_i after 5ns;
end sim;
