LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fulladd IS
	PORT (     CIN: IN STD_LOGIC;
		  in0, in1: IN STD_LOGIC;
		   s, p, g: OUT STD_LOGIC);
END fulladd;

ARCHITECTURE LogicFunc of fulladd IS
BEGIN
	s<= (in0 XOR in1) XOR CIN;
	p<= (in0 XOR in1);
	g<= (in0 AND in1);
END LogicFunc;