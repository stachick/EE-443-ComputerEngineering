library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity REG16 is
	port(	D: in std_logic_vector(15 downto 0);
		  EN: in std_logic;
		 CLK: in std_logic;
			Q: out std_logic_vector(15 downto 0));
end REG16;

architecture behavior of REG16 is

component REG8
	port(	D: in std_logic_vector(7 downto 0);
		  EN: in std_logic;
		 CLK: in std_logic;
			Q: out std_logic_vector(7 downto 0));
end component;


begin

lowerByte: 	REG8 port map(D(7 downto 0), EN, CLK, Q(7 downto 0));
higherByte:	REG8 port map(D(15 downto 8), EN, CLK, Q(15 downto 8));

end behavior;
