----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/25/2025 02:24:25 PM
-- Design Name: 
-- Module Name: six_bit_load_register - Behavioral
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


entity six_bit_load_register is
    Port ( ld : in STD_LOGIC;
           clr : in STD_LOGIC;
           clk : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR(5 downto 0);
           Q : out STD_LOGIC_VECTOR(5 downto 0));
end six_bit_load_register;

architecture structural of six_bit_load_register is

component dflipflop is
     Port ( D : in STD_LOGIC;
           CLK : in STD_LOGIC;
           LD : in std_logic;
           CLR : in std_logic;           
           Q : out STD_LOGIC := '0');
end component;

begin

-- Create 6 instances of the D flip-flop and connect them
ff0: dflipflop port map (D => D(0), CLK => clk, LD => ld, CLR => clr, Q => Q(0));
ff1: dflipflop port map (D => D(1), CLK => clk, LD => ld, CLR => clr, Q => Q(1));
ff2: dflipflop port map (D => D(2), CLK => clk, LD => ld, CLR => clr, Q => Q(2));
ff3: dflipflop port map (D => D(3), CLK => clk, LD => ld, CLR => clr, Q => Q(3));
ff4: dflipflop port map (D => D(4), CLK => clk, LD => ld, CLR => clr, Q => Q(4));
ff5: dflipflop port map (D => D(5), CLK => clk, LD => ld, CLR => clr, Q => Q(5));

end structural;
