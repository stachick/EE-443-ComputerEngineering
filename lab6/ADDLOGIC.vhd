LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ADDLOGIC IS
	PORT (     CIN: IN STD_LOGIC;
		  in0, in1: IN STD_LOGIC;
		   s, p, g: OUT STD_LOGIC);
END ADDLOGIC;

ARCHITECTURE behavior of ADDLOGIC IS
BEGIN
	s<= (in0 XOR in1) XOR CIN;
	p<= (in0 XOR in1);
	g<= (in0 AND in1);
END behavior;