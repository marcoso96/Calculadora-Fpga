----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:06:48 08/14/2018 
-- Design Name: 
-- Module Name:    Hexsseg - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Hexsseg is
	port(
		hex: in std_logic_vector(4 downto 0);
		sseg: out std_logic_vector(7 downto 0)
		);		
end Hexsseg;

architecture Behavioral of Hexsseg is
	
begin
	with hex select
		sseg <= "11000000" when "00000",
				  "11111001" when "00001",
				  "10100100" when "00010",
				  "10110000" when "00011",
				  "10011001" when "00100",
				  "10010010" when "00101",
				  "10000010" when "00110",
				  "11111000" when "00111",
				  "10000000" when "01000",
				  "10010000" when "01001",
				  "10100000" when "01010",
				  "10000011" when "01011",
				  "11000110" when "01100",
				  "10100001" when "01101",
				  "10000100" when "01110",
				  "10000110" when "01111",
				  "01111111" when others;
		
end Behavioral;

