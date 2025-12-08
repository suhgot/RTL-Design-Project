

-- This is a combinational logic circuit mapping all inputs and current state
-- to the next state.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flappy_nextstate_logic is
    Port ( B : in STD_LOGIC;
           below_gnd : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           N0 : out STD_LOGIC;
           N1 : out STD_LOGIC;
           testport : out std_logic); 
end flappy_nextstate_logic;

architecture Structural of flappy_nextstate_logic is

-- Componenents needed:
component not_gate 
    Port ( A : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;

component two_input_and_gate 
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;

component two_input_or_gate 
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;

component three_input_and_gate 
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;

component three_input_or_gate 
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;


-- Hard coded signals
signal vdd : std_logic := '1';
signal gnd : std_logic := '0';

-- Internal signals;
signal below_not_out: std_logic;
signal B_not_out: std_logic;
signal S0_not_out: std_logic;
signal AND1_out: std_logic;
signal AND2_out: std_logic;
signal AND3_out: std_logic;
signal triple_and_out: std_logic;



begin

-- Instances of components
below_not: not_gate port map (below_gnd, below_not_out);
b_not: not_gate port map (B, B_not_out);
S0_not: not_gate port map (S0, S0_not_out);
AND1: two_input_and_gate port map (below_not_out, S1, AND1_out);
AND2: two_input_and_gate port map (B, S0_not_out, AND2_out);
AND3: two_input_and_gate port map (S0_not_out, S1, AND3_out);
triple_and: three_input_and_gate port map (below_not_out, b_not_out, S1, triple_and_out);
OR1: two_input_or_gate port map (triple_and_out, AND3_out, N0);
triple_OR: three_input_or_gate port map (AND1_out, AND2_out, AND3_out, N1);


-- Single bit test port
testport <= gnd;

end Structural;
