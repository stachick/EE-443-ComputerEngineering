library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity REG8x16 is
	port(	ADD_R1: in std_logic_vector(2 downto 0);
			ADD_R2: in std_logic_vector(2 downto 0);
			 ADD_W: in std_logic_vector(2 downto 0);
				 WE: in std_logic;
				CLK: in std_logic;
				DIN: in std_logic_vector(15 downto 0);
			 DOUT1: out std_logic_vector(15 downto 0);
			 DOUT2: out std_logic_vector(15 downto 0));
end REG8x16;

architecture behavior of REG8x16 is
	
	component MUX_4x4to1 is
		port(	in0: in std_logic_vector(3 downto 0);
				in1: in std_logic_vector(3 downto 0);
				in2: in std_logic_vector(3 downto 0);
				in3: in std_logic_vector(3 downto 0);
				sel: in std_logic_vector(2 downto 0);
			output: out std_logic_vector(3 downto 0)
				);
	end component;
	
	component DCD3x8 is
		port(	input: in std_logic_vector(2 downto 0);
			  output: out std_logic_vector(7 downto 0));
	end component;
	
	component REG8 is
		port(	D: in std_logic_vector(7 downto 0);
			  EN: in std_logic;
			 CLK: in std_logic;
				Q: out std_logic_vector(7 downto 0));)
	end component;
	

begin
