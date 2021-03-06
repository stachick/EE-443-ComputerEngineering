library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.my_lib.all;

entity DAT_MEM is
	port( ADDR: in std_logic_vector(15 downto 0);
		  DIN: in std_logic_vector(15 downto 0);
		  WE, RE, CLK: in std_logic;
		  DOUT:  out std_logic_vector(15 downto 0));
end DAT_MEM;

architecture behavior of DAT_MEM is
type TWODARRAY is array (integer range<>) of std_logic_vector(7 downto 0);
signal memoryOutput: TWODARRAY (0 to 31);

type TWODARRAYWR is array (integer range<>) of std_logic;
signal writing: TWODARRAYWR(0 to 15);
signal linesel: std_logic_vector (15 downto 0);

begin

	sel: DCD4x16 port map (ADDR(4 downto 1), linesel);
	
	mem: for i in 0 to 15 generate
		reg8Low:	REG8 port map (DIN(7 downto 0), writing(i), CLK, memoryOutput(2*i));
		reg8High:	REG8 port map (DIN(15 downto 8), writing(i), CLK, memoryOutput(2*i+1));
		writing(i) <= linesel(i) and WE;
	end generate mem;
	
	DOUT <= "ZZZZZZZZZZZZZZZZ" when RE = '0' else
		memoryOutput(1) & memoryOutput(0) when linesel(0) = '1' else
		memoryOutput(3) & memoryOutput(2) when linesel(1) = '1' else
		memoryOutput(5) & memoryOutput(4) when linesel(2) = '1' else
		memoryOutput(7) & memoryOutput(6) when linesel(3) = '1' else
		memoryOutput(9) & memoryOutput(8) when linesel(4) = '1' else
		memoryOutput(11) & memoryOutput(10) when linesel(5) = '1' else
		memoryOutput(13) & memoryOutput(12) when linesel(6) = '1' else
		memoryOutput(15) & memoryOutput(14) when linesel(7) = '1' else
		memoryOutput(17) & memoryOutput(16) when linesel(8) = '1' else
		memoryOutput(19) & memoryOutput(18) when linesel(9) = '1' else
		memoryOutput(21) & memoryOutput(20) when linesel(10) = '1' else
		memoryOutput(23) & memoryOutput(22) when linesel(11) = '1' else
		memoryOutput(25) & memoryOutput(24) when linesel(12) = '1' else
		memoryOutput(27) & memoryOutput(26) when linesel(13) = '1' else
		memoryOutput(29) & memoryOutput(28) when linesel(14) = '1' else
		memoryOutput(31) & memoryOutput(30) when linesel(15) = '1';

end behavior;