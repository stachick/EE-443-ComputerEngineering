library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.my_lib.all;

entity INS_MEM is
	port( ADDR: in std_logic_vector(15 downto 0);
		  DOUT:  out std_logic_vector(15 downto 0));
end INS_MEM;

architecture behavior of INS_MEM is
type twoDimArray is array(integer range<>) of std_logic_vector(15 downto 0);
signal im: twoDimArray(0 to 31);
signal instructionSel: std_logic_vector(31 downto 0);

begin

decode: DCD5x32 port map(ADDR(5 downto 1), instructionSel);

im(0) <= "1001000001010000";
im(1) <= "1001000010010001";
im(2) <= "0000001010011010";
im(3) <= "1111000011010010";
im(4) <= "0010000000001000";

init: for i in 5 to 31 generate
	im(i) <= "0000000000000000";
	end generate;

DOUT <= "ZZZZZZZZZZZZZZZZ" when instructionSel = "00000000000000000000000000000000" else
	im(0) when instructionSel(0) = '1' else
	im(1) when instructionSel(1) = '1' else
	im(2) when instructionSel(2) = '1' else
	im(3) when instructionSel(3) = '1' else
	im(4) when instructionSel(4) = '1' else
	im(5) when instructionSel(5) = '1' else
	im(6) when instructionSel(6) = '1' else
	im(7) when instructionSel(7) = '1' else
	im(8) when instructionSel(8) = '1' else
	im(9) when instructionSel(9) = '1' else
	im(10) when instructionSel(10) = '1' else
	im(11) when instructionSel(11) = '1' else
	im(12) when instructionSel(12) = '1' else
	im(13) when instructionSel(13) = '1' else
	im(14) when instructionSel(14) = '1' else
	im(15) when instructionSel(15) = '1' else
	im(16) when instructionSel(16) = '1' else
	im(17) when instructionSel(17) = '1' else
	im(18) when instructionSel(18) = '1' else
	im(19) when instructionSel(19) = '1' else
	im(20) when instructionSel(20) = '1' else
	im(21) when instructionSel(21) = '1' else
	im(22) when instructionSel(22) = '1' else
	im(23) when instructionSel(23) = '1' else
	im(24) when instructionSel(24) = '1' else
	im(25) when instructionSel(25) = '1' else
	im(26) when instructionSel(26) = '1' else
	im(27) when instructionSel(27) = '1' else
	im(28) when instructionSel(28) = '1' else
	im(29) when instructionSel(29) = '1' else
	im(30) when instructionSel(30) = '1' else
	im(31) when instructionSel(31) = '1' ;
	
	
	
end behavior;