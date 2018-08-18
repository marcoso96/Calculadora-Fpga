----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:08:44 08/14/2018 
-- Design Name: 
-- Module Name:    Resta - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Resta is
	port(
		a,b: in std_logic_vector(3 downto 0);
		rest: out std_logic_vector(3 downto 0);
		sign: out std_logic
		 );    
end Resta;
			 
architecture Behavioral of Resta is
	signal negative: std_logic_vector(0 downto 3);
	
begin
	
	sum: entity work.Sumador(arch)
	port map(a=>a, b=> (not(b(3)) & b(2 downto 0)), sum=>rest, sign_out=>sign);	

end Behavioral;

