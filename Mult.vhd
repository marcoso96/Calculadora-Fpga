----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:09:13 08/15/2018 
-- Design Name: 
-- Module Name:    Mult - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mult is

	port( 
		a,b:in std_logic_vector(3 downto 0);
		prod: out std_logic_vector(4 downto 0);
		sign: out std_logic
		);
end Mult;

architecture Behavioral of Mult is
	
	signal mult_a, mult_b: unsigned(2 downto 0); 
	signal tot_ext: unsigned(5 downto 0);

begin
	
	sign<='0' when a(3)=b(3) else
			'1';
	
	mult_a<=unsigned(a(2 downto 0));
	mult_b<=unsigned(b(2 downto 0));
	
	tot_ext<=mult_a*mult_b;
	
	prod<= "10000" when tot_ext(4)='1' or tot_ext(5)='1'  else
			std_logic_vector(tot_ext(4 downto 0));
									
end Behavioral;

