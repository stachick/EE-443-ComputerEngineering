library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity BWOR4 is
	port(	in0, in1: in std_logic_vector(3 downto 0);
			output: out std_logic_vector(3 downto 0));
end BWOR4;

architecture behavior of BWOR4 is
begin
	process(in0, in1)
		variable tempF: std_logic_vector(3 downto 0);
	begin
			for I in 0 to 3 loop
				tempF(I) := in0(I) or in1(I);
			end loop;
			output <= tempF;
	end process;	
			
end behavior;
