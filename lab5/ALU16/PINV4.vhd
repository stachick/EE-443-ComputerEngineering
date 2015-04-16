library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity PINV4 is
	port(   input: in std_logic_vector (3 downto 0);
			output: out std_logic_vector(3 downto 0);
			ctrl: in std_logic);
end PINV4;

architecture behavior of PINV4 is
begin
	process(ctrl, input)
		variable tempF: std_logic_vector(3 downto 0);
	begin
		if (ctrl = '1') then
			for I in 0 to 3 loop
				tempF(I) := not input(I);
			end loop;
			output <= tempF;
		else
			output <= input;
		end if;
	end process;	
			
end behavior;
