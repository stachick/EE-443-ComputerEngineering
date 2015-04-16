library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SHLONE is
	port( input:	in std_logic_vector(15 downto 0);
		  output:  out std_logic_vector(15 downto 0));
end SHLONE;

architecture behavior of SHLONE is
begin
	
	output <= input(14 downto 0) & '0';
	
end behavior;