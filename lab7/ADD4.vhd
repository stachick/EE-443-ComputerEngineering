LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.my_lib.all;

entity ADD4 is 
	port (  A,B: in std_logic_vector (3 downto 0);
			CIN: in std_logic;
			  F: out std_logic_vector (3 downto 0);
		   COUT: out std_logic; 
	   OVERFLOW: out std_logic);
end ADD4;

architecture behavior of ADD4 is
	signal P,G,S: std_logic_vector (3 downto 0);
	signal carryOut: std_logic_vector (4 downto 1);
begin
	carryOut(1) <= G(0) or (P(0) and CIN);
	carryOut(2) <= G(1) or (P(1) and carryOut(1));
	carryOut(3) <= G(2) or (P(2) and carryOut(2));
	carryOut(4) <= G(3) or (P(3) and carryOut(3));
	
	FA0 : ADDLOGIC port map (CIN, A(0), B(0), S(0), P(0), G(0));
	FA1 : ADDLOGIC port map (carryOut(1), A(1), B(1), S(1), P(1), G(1));
	FA2 : ADDLOGIC port map (carryOut(2), A(2), B(2), S(2), P(2), G(2));
	FA3 : ADDLOGIC port map (carryOut(3), A(3), B(3), S(3), P(3), G(3));
	F <= S;
	COUT <= carryOut(4);
	OVERFLOW <= carryOut(4) xor carryOut(3);
	
END behavior;