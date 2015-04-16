library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity PCJMP is
	port( 	PChigh: in std_logic_vector(2 downto 0);
		   JMPaddr: in std_logic_vector(11 downto 0);
			output: out std_logic_vector(15 downto 0));
end PCJMP;

architecture behavior of PCJMP is
begin
	output <= PChigh & JMPaddr & '0';
end behavior;