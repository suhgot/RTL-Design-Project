----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/06/2025 12:12:37 PM
-- Design Name: 
-- Module Name: six_bit_two_to_one_multiplexer - Behavioral
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

entity six_bit_two_to_one_multiplexer is
    Port ( A_in : in STD_LOGIC_VECTOR(5 downto 0);
           B_in : in STD_LOGIC_VECTOR(5 downto 0);
           S_in : in STD_LOGIC;
           Q_out : out STD_LOGIC_VECTOR(5 downto 0));
end six_bit_two_to_one_multiplexer;

architecture Behavioral of six_bit_two_to_one_multiplexer is

begin

Q_out <= A_in when S_in = '0' else
     B_in when S_in = '1' else 
     "XXXXXX"; --X is for unknown

end Behavioral;
