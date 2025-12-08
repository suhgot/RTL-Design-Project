----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/30/2025 01:58:25 PM
-- Design Name: 
-- Module Name: one_bit_half_adder - Behavioral
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

entity one_bit_half_adder is
    Port ( A_in : in STD_LOGIC;
           B_in : in STD_LOGIC;
           S_out : out STD_LOGIC;
           C_out : out STD_LOGIC);
end one_bit_half_adder;



architecture Structural of one_bit_half_adder is

--Creates and and xor gates for use in the structural implementation

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


begin


--Creates a structural implementation of a one-bit half adder using a given schematic
--Maps inputs and outputs from gates to respective adder outputs and inputs

xor_1: two_input_xor_gate port map (A_in, B_in, S_out);
and_1: two_input_and_gate port map (A_in, B_in, C_out);


end Structural;
