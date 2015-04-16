LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.my_lib.all;

entity ALU4 is 
	port ( A,B : in std_logic_vector (3 downto 0);
	  CIN, LESS: in std_logic;
		    SEL: in std_logic_vector (2 downto 0);
			  F: out std_logic_vector (3 downto 0);
		COUT, OVERFLOW, SET, ZERO: out std_logic);
END ALU4;

architecture behavior of ALU4 is
	signal BWANDOUT, BWOROUT, BIT_INV, ADD4OUT, SLTOUT, TEMP: std_logic_vector (3 downto 0);
	
begin
	
	BWAND: BWAND4 port map (A, B, BWANDOUT);
	BWOR: BWOR4 port map (A, B, BWOROUT);
	BITINVERT: PINV4 port map (B, BIT_INV, SEL(2));
	SUBTRACT: ADD4 port map (A, BIT_INV, CIN, ADD4OUT, COUT, OVERFLOW);
	
	selectOutput : MUX_4x4to1 port map (BWANDOUT, BWOROUT, ADD4OUT, SLTOUT, SEL(1 downto 0), TEMP);
		
	SLTOUT(3 downto 1) <= "000";
	SLTOUT(0) <= LESS;
	SET <= ADD4OUT(3);
	
	ZERO <= (TEMP(0) nor TEMP(1)) and (TEMP(2) nor TEMP(3));
	
	F <= TEMP;
end behavior;