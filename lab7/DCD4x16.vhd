library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.my_lib.all;

entity DCD4x16 is
	port( sel: in std_logic_vector(3 downto 0);
		  DOUT:  out std_logic_vector(15 downto 0));
end DCD4x16;

architecture behavior of DCD4x16 is
signal output: std_logic_vector(7 downto 0);
signal sel3_0, sel3_1: std_logic_vector(15 downto 0);

begin
	process (sel)
	begin
		case sel(3) is
			when '0' => DOUT <= sel3_0;
			when '1' => DOUT <= sel3_1;
		end case;
	end process;
	
callDCD3x8: DCD3x8 port map(sel (2 downto 0), output);			
sel3_0 <= "00000000" & output;
sel3_1 <= output & "00000000";

end behavior;