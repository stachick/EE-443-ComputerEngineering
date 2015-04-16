Library ieee;
use ieee.std_logic_1164.all;

PACKAGE my_lib IS

component fulladd IS
	PORT ( 	    CIN: IN STD_LOGIC;
		   in0, in1: IN STD_LOGIC;
			s, p, g: OUT STD_LOGIC);
end component;

component MUX_4x4to1 is
	port(	in0: in std_logic_vector(3 downto 0);
			in1: in std_logic_vector(3 downto 0);
			in2: in std_logic_vector(3 downto 0);
			in3: in std_logic_vector(3 downto 0);
			sel: in std_logic_vector(1 downto 0);
 		 output: out std_logic_vector(3 downto 0));
end component;

component ADD1 is
    Port ( in0, in1 : in std_logic;
            carryIn : in std_logic;
             output : out std_logic);
end component;

component ADD4 IS 
	PORT ( A,B : IN STD_LOGIC_VECTOR (3 downto 0);
			Cin: IN STD_LOGIC;
			F : OUT STD_LOGIC_VECTOR (3 downto 0);
		  Cout, Overflow: OUT STD_LOGIC);
end component;

component BWAND4 is
	port(	in0, in1: in std_logic_vector(3 downto 0);
			output: out std_logic_vector(3 downto 0));
end component;

component BWOR4 is
	port(	in0, in1: in std_logic_vector(3 downto 0);
			output: out std_logic_vector(3 downto 0));
end component;

component PINV4 is
	port(   input: in std_logic_vector (3 downto 0);
			output: out std_logic_vector(3 downto 0);
			ctrl: in std_logic);
end component;

component ALU4 is
	port(   A, B: in std_logic_vector(3 downto 0);
			LESS: in std_logic;
			 CIN: in std_logic;
			 SEL: in std_logic_vector(2 downto 0);
			   F: out std_logic_vector(3 downto 0);
			COUT: out std_logic;
		OVERFLOW: out std_logic;
		  	 SET: out std_logic;
			ZERO: out std_logic);
end component;

END PACKAGE my_lib;