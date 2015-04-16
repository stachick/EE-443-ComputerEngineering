library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MUX2x16 is
	port( in0: in std_logic_vector(15 downto 0);
		  in1: in std_logic_vector(15 downto 0);
		  sel: in std_logic;
		  output:  out std_logic_vector(15 downto 0));
end MUX2x16;

architecture behavior of MUX2x16 is
begin

	output <= in0 when sel = '0' else
			in1 when sel = '1';

end behavior;