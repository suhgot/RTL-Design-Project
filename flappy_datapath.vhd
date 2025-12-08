
-- Component to implement all necessary mathematical and multi-bit operations 
-- for the flappy game simulator project. 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flappy_datapath is
  Port (clk:  in std_logic; 
        ld_YPos: in std_logic; -- Updates YPosReg when 1 
        ld_YVel: in std_logic; -- Updates YVelReg when 1
        sel_PosReset: in std_logic; -- Select bit: 1 means reset YPos to 10
        sel_VelJump: in std_logic; -- Select bit: 1 means set YVel to 3       
        below_gnd: out std_logic; -- Character is below ground (YPos < ground_level)
        ground_level: in std_logic_vector (5 downto 0);
        YPos: inout std_logic_vector (5 downto 0);
        testport: out std_logic_vector (5 downto 0));    
end flappy_datapath;

architecture structural of flappy_datapath is

-- Components we need (add below):
component lessthan_6bit 
Port ( A : in STD_LOGIC_VECTOR (5 downto 0);
           B : in STD_LOGIC_VECTOR (5 downto 0);
           E : out STD_LOGIC);
end component;

component six_bit_load_register 
    Port ( ld : in STD_LOGIC;
           clr : in STD_LOGIC;
           clk : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR(5 downto 0);  -- 6-bit data input
           Q : out STD_LOGIC_VECTOR(5 downto 0)); -- 6-bit data output
end component;

component six_bit_ripple_carry_adder 
    Port ( X : in STD_LOGIC_VECTOR(5 downto 0);
           Y : in STD_LOGIC_VECTOR(5 downto 0);
           S : out STD_LOGIC_VECTOR(5 downto 0);
           C_Out : out STD_LOGIC);
end component;

component six_bit_two_to_one_multiplexer 
    Port ( A_in : in STD_LOGIC_VECTOR(5 downto 0);
           B_in : in STD_LOGIC_VECTOR(5 downto 0);
           S_in : in STD_LOGIC;
           Q_out : out STD_LOGIC_VECTOR(5 downto 0));
end component;

component six_bit_ripple_carry_subtractor 
    Port ( X : in STD_LOGIC_VECTOR(5 downto 0); 
           Y : in STD_LOGIC_VECTOR(5 downto 0);
           S : out STD_LOGIC_VECTOR(5 downto 0);
           C_Out : out STD_LOGIC);
end component;

-- hardcoded signals we need (add others as needed):
signal gnd: std_logic := '0'; -- to hardcode inputs to 0
signal tmp: std_logic; -- to be tied to unused outputs.
signal three: std_logic_vector(5 downto 0) := "000011"; -- hardcoded number three
signal one: std_logic_vector(5 downto 0) := "000001"; -- hardcoded number one
signal ten: std_logic_vector(5 downto 0) := "001010"; -- hardcoded number 10

-- Additional signals for internal nets
signal YVel: std_logic_vector (5 downto 0); -- signal to use as output of velocity register
-- Add other signals for interal nets as needed
signal new_YPos: std_logic_vector (5 downto 0); -- new position calculation
signal new_YVel: std_logic_vector (5 downto 0); -- new velocity calculation
signal mux_vel_out: std_logic_vector (5 downto 0); -- velocity mux output
signal mux_pos_out: std_logic_vector (5 downto 0); -- position mux output
            
           
begin

-- Add instances of components here
vel_reg: six_bit_load_register port map (ld => ld_YVel, clr => gnd, clk => clk, D => mux_vel_out, Q => YVel);
pos_reg: six_bit_load_register port map (ld => ld_YPos, clr => gnd, clk => clk, D => mux_pos_out, Q => YPos);
equality: lessthan_6bit port map (A => new_YPos, B => ground_level, E => below_gnd);
adder: six_bit_ripple_carry_adder port map (X => YVel, Y => YPos, S => new_YPos, C_out => tmp);
subtractor: six_bit_ripple_carry_subtractor port map ( X => YVel, Y => one, S => new_YVel, C_out => tmp);
vel_mux: six_bit_two_to_one_multiplexer port map (A_in => new_YVel, B_in => three, S_in => sel_VelJump, Q_out => mux_vel_out); 
pos_mux: six_bit_two_to_one_multiplexer port map (A_in => new_YPos, B_in => ten, S_in => sel_PosReset, Q_out => mux_pos_out);

-- The testport can be used for evaluating internal nets.
--    Test a bus
testport <= YVel; -- default . . . output velocity value.

--   Test individual bits 
--   testport(0) <= gnd;

end structural;
