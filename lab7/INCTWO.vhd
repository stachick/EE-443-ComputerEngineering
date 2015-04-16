library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.my_lib.all;

entity INCTWO is
	port( input: in std_logic_vector(15 downto 0);
		  output:  out std_logic_vector(15 downto 0));
end INCTWO;

architecture behavior of INCTWO is
begin

inc2: ADD16 port map(input, "0000000000000010", output);

end behavior;