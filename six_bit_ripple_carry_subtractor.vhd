----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/06/2025 01:23:58 PM
-- Design Name: 
-- Module Name: six_bit_ripple_carry_adder - Behavioral
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

entity six_bit_ripple_carry_subtractor is
    Port ( X : in STD_LOGIC_VECTOR(5 downto 0); 
           Y : in STD_LOGIC_VECTOR(5 downto 0);
           S : out STD_LOGIC_VECTOR(5 downto 0);
           C_Out : out STD_LOGIC);
end six_bit_ripple_carry_subtractor;



architecture Behavioral of six_bit_ripple_carry_subtractor is

--Declares components needed in order to create a ripple carry adder

component one_bit_full_adder
Port ( A_in : in STD_LOGIC;
           B_in : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S_out : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;

component one_bit_half_adder
Port ( A_in : in STD_LOGIC;
           B_in : in STD_LOGIC;
           S_out : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;

-- Signal for the inverted Y (1's complement)
signal Y_inverted: STD_LOGIC_VECTOR(5 downto 0);

--Creates 5 nets for each of the adders
signal N: STD_LOGIC_VECTOR(5 downto 1);

begin

-- Invert Y bits to get 1's complement (first step of 2's complement)
Y_inverted <= NOT Y;

-- The half adder with X(0) and NOT Y(0) has implicit C_in = 0
-- But we need C_in = 1 for 2's complement (+1)
-- So we use a full adder instead of half adder for the first bit
-- with C_in = '1'

FA0: one_bit_full_adder port map (
    A_in => X(0),
    B_in => Y_inverted(0),
    C_in => '1',  -- This provides the +1 for 2's complement
    S_out => S(0),
    C_out => N(1)
);

-- Rest of the bits use inverted Y
FA1: one_bit_full_adder port map (X(1), Y_inverted(1), N(1), S(1), N(2));
FA2: one_bit_full_adder port map (X(2), Y_inverted(2), N(2), S(2), N(3));
FA3: one_bit_full_adder port map (X(3), Y_inverted(3), N(3), S(3), N(4));
FA4: one_bit_full_adder port map (X(4), Y_inverted(4), N(4), S(4), N(5));
FA5: one_bit_full_adder port map (X(5), Y_inverted(5), N(5), S(5), C_Out);

end Behavioral;
