----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:04:52 08/14/2018 
-- Design Name: 
-- Module Name:    Sumador - Behavioral 
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

entity Sumador is
	
	port(
	a,b: in std_logic_vector(3 downto 0);
	sum: out std_logic_vector(3 downto 0);
	sign_out: out std_logic
	);
	
end Sumador;

architecture arch of Sumador is
	signal a_ext, b_ext, sum_ext, rest_ext, tot_ext, max, min: unsigned(3 downto 0);
	signal sign_a, sign_b, sign_in, sign: std_logic;
	
begin
	
	a_ext<=unsigned('0' & a(2 downto 0));
	b_ext<=unsigned('0' & b(2 downto 0));
	sign_a<=a(3);					 	
	sign_b<=b(3);					 	

	--multiplexor para la resta de dos numeros, comparo magnitud de a y b
	
	sum_ext<=a_ext+b_ext;
	
	rest_ext<=a_ext-b_ext when a_ext>b_ext else
		  b_ext-a_ext when a_ext<b_ext else
		  "0000";
						  
	--multiplexor del signo dominante entre a y b. Comparo sus magnitudes
	tot_ext<=sum_ext when sign_a=sign_b else
						 rest_ext;

	--mux de signo del resultado y eleccion entre resta y suma
	sign_in<=sign_a when a_ext>=b_ext else
						 sign_b;		  		
			
	sign<= sign_a when sign_a=sign_b else
					  sign_in; 		
	
	sign_out<=std_logic(sign);
	sum<=std_logic_vector(tot_ext(3 downto 0));
	
	
end arch;

