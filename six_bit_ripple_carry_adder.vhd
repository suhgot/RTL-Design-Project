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

entity six_bit_ripple_carry_adder is
    Port ( X : in STD_LOGIC_VECTOR(5 downto 0);
           Y : in STD_LOGIC_VECTOR(5 downto 0);
           S : out STD_LOGIC_VECTOR(5 downto 0);
           C_Out : out STD_LOGIC);
end six_bit_ripple_carry_adder;



architecture Behavioral of six_bit_ripple_carry_adder is

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


--Creates 5 nets for each of the adders
signal N: STD_LOGIC_VECTOR(5 downto 1);


begin

HA1: one_bit_half_adder port map (X(0),Y(0),S(0),N(1));
FA1: one_bit_full_adder port map (X(1),Y(1),N(1),S(1),N(2));
FA2: one_bit_full_adder port map (X(2),Y(2),N(2),S(2),N(3));
FA3: one_bit_full_adder port map (X(3),Y(3),N(3),S(3),N(4));
FA4: one_bit_full_adder port map (X(4),Y(4),N(4),S(4),N(5));
FA5: one_bit_full_adder port map (X(5),Y(5),N(5),S(5),C_Out);

end Behavioral;
