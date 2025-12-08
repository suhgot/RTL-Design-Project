
-- This is a combinational logic circuit mapping current state to
-- to all outputs of the controller

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flappy_output_logic is
    Port ( S0: in std_logic;
           S1: in std_logic;
           J : out STD_LOGIC;
           F : out STD_LOGIC;
           D : out STD_LOGIC;
           ld_YPos : out STD_LOGIC;
           ld_YVel : out STD_LOGIC;
           sel_PosReset: out std_logic;
           sel_VelJump: out std_logic;  
           testport : out std_logic);
end flappy_output_logic;


architecture Structural of flappy_output_logic is

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


-- Hard coded signals
signal vdd : std_logic := '1';
signal gnd : std_logic := '0';

-- Internal signals;
signal S0_not_out : std_logic;
signal S1_not_out : std_logic;
signal jump_out : std_logic;
signal die_out : std_logic;


begin

-- Instances of components / output assignments
S0_not: not_gate port map (S0, S0_not_out);
S1_not: not_gate port map (S1, S1_not_out);
And1: two_input_and_gate port map (S0_not_out, S1, jump_out);
And2: two_input_and_gate port map (S0_not_out, S1_not_out, die_out);
And3: two_input_and_gate port map (S0, S1, F);
OR1: two_input_or_gate port map (S0, S1_not_out, ld_YPos);

sel_VelJump <= S0_not_out;
sel_PosReset <= S0_not_out;
J <= jump_out;
D <= die_out;
ld_YVel <= S1;


-- Single bit test port
testport <= gnd;

end Structural;