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

entity fsm_board is
generic(MAX : natural :=19);
  Port ( rst : in std_logic;
  clk : in std_logic;
  a : in std_logic;
  b : in std_logic;
  s : out std_logic
   );
end fsm_board;

architecture archi_fsm_board of fsm_board is

-- Premier component pour le compteur
component compteur_modulo2n is
    generic(N : natural := 4 );
    Port ( reset_n: in std_logic;
        clk_c : in std_logic;
        S : out std_logic_vector(N-1 downto 0));
end component;

-- Deuxieme component pour le FSM de Moore
component FSM is
  Port (rst : in std_logic;
  clk_f : in std_logic ;
  a : in std_logic;
  b : in std_logic;
  s : out std_logic );
end component;

--Declaration des files
signal rst_n : std_logic;
signal Scpt_i : std_logic_vector(MAX-1 downto 0);
signal clk10ms : std_logic; --N-1

begin
rst_n <= not rst;
--Premiere instance
intst_cpt: compteur_modulo2n
    generic map (N => MAX)
    port map( clk_c => clk,
    reset_n => rst_n,
    S => Scpt_i);
    
clk10ms <= Scpt_i(MAX-1);
    
--Deuxieme instance
inst_fsm: FSM
    port map(
    a => a,
    b => b,
    clk_f => clk10ms,
    rst => rst,
    s => S);
    
end archi_fsm_board;
