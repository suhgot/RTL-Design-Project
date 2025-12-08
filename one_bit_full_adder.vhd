----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/30/2025 02:27:46 PM
-- Design Name: 
-- Module Name: one_bit_full_adder - Behavioral
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

entity one_bit_full_adder is
    Port ( A_in : in STD_LOGIC;
           B_in : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S_out : out STD_LOGIC;
           C_out : out STD_LOGIC);
end one_bit_full_adder;

architecture Structural of one_bit_full_adder is

--Creates gates for use in the structural implementation

component two_input_and_gate is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;


component two_input_xor_gate is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;

component two_input_or_gate is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;


--Creates nets needed for the adder
signal N1: std_logic; 
signal N2: std_logic; 
signal N3: std_logic; 
signal N4: std_logic; 
signal N5: std_logic;

begin

--C out combinational logic
and_1: two_input_and_gate port map (A_in, B_in, N1);
and_2: two_input_and_gate port map (A_in, C_in, N2);
and_3: two_input_and_gate port map (B_in, C_in, N3);
or_1: two_input_or_gate port map (N1, N2, N4); 
or_2: two_input_or_gate port map (N3, N4, C_out);

--S out combinational logic
xor_1: two_input_xor_gate port map (A_in, B_in, N5);
xor_2: two_input_xor_gate port map (C_in, N5, S_out);

end Structural;
