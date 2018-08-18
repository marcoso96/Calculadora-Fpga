----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:09:24 08/14/2018 
-- Design Name: 
-- Module Name:    TopTop - Behavioral 
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

entity TopTop is
	port(
	a, b: in std_logic_vector(3 downto 0);
	push:in std_logic_vector(1 downto 0);
	sgn:out std_logic;
	sseg:out std_logic_vector(7 downto 0);
	an:out std_logic_vector(3 downto 0)
	);
end TopTop;


architecture Behavioral of TopTop is

	signal result_mult, result:std_logic_vector(4 downto 0);
	signal result_sum, result_rest:std_logic_vector(3 downto 0);
	signal sign_sum, sign_rest, sign_mult:std_logic;
	
begin
	
	an<="1110";
	sum:entity work.Sumador(arch)
	port map(a=>a, b=>b, sign_out=>sign_sum, sum=>result_sum);
	
	rest:entity work.Resta(Behavioral)
	port map(a=>a, b=>b, sign=>sign_rest, rest=>result_rest);
	
	mult:entity work.Mult(Behavioral)
	port map(a=>a, b=>b, sign=>sign_mult, prod=>result_mult);
	
	
	result<=result_mult when push="11" else
			('0'&result_rest) when push="10" else
			('0'&result_sum);
	
	ssegment:entity work.Hexsseg(Behavioral)
	port map(sseg=>sseg, hex=>result);
		
	sgn<=	sign_mult when push="11" else
			sign_rest when push="10" else
			sign_sum;
				
end Behavioral;

