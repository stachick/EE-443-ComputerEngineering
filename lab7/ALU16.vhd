library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.my_lib.all;

entity ALU16 is
	port(		A, B: in std_logic_vector(15 downto 0);
				 SEL: in std_logic_vector(2 downto 0);
				   F: out std_logic_vector(15 downto 0);
				COUT: out std_logic;
			OVERFLOW: out std_logic;
				ZERO: out std_logic);	
end ALU16;

architecture behavior of ALU16 is
	signal COUTALU_0, COUTALU_1, COUTALU_2, COUTALU_3: std_logic;
	signal OVERFLOWALU_3: std_logic;
	signal ZEROALU_0, ZEROALU_1, ZEROALU_2, ZEROALU_3: std_logic;
	signal SETALU_3: std_logic;

begin
	ALU_0: ALU4 port map (A(3 downto 0), B(3 downto 0), SETALU_3, SEL(2), SEL, F(3 downto 0), COUTALU_0, open, open, ZEROALU_0);
	ALU_1: ALU4 port map (A(7 downto 4), B(7 downto 4), '0', COUTALU_0, SEL, F(7 downto 4), COUTALU_1, open, open, ZEROALU_1);
	ALU_2: ALU4 port map (A(11 downto 8), B(11 downto 8), '0', COUTALU_1, SEL, F(11 downto 8), COUTALU_2, open, open, ZEROALU_2);
	ALU_3: ALU4 port map (A(15 downto 12), B(15 downto 12), '0', COUTALU_2, SEL, F(15 downto 12), COUTALU_3, overflowALU_3, setALU_3, ZEROALU_3);

	OVERFLOW <= OVERFLOWALU_3;
	ZERO <= ZEROALU_0 and ZEROALU_1 and ZEROALU_2 and ZEROALU_3;
	COUT <= COUTALU_3;
end behavior;