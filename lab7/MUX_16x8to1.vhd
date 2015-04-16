library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MUX_16x8to1 is
	port(	in_0: in std_logic_vector(15 downto 0);
			in_1: in std_logic_vector(15 downto 0);
			in_2: in std_logic_vector(15 downto 0);
			in_3: in std_logic_vector(15 downto 0);
			in_4: in std_logic_vector(15 downto 0);
			in_5: in std_logic_vector(15 downto 0);
			in_6: in std_logic_vector(15 downto 0);
			in_7: in std_logic_vector(15 downto 0);
			sel: in std_logic_vector(2 downto 0);
		output: out std_logic_vector(15 downto 0));
end MUX_16x8to1;

architecture behavior of MUX_16x8to1 is

	component MUX_4x8to1 is
		port(	in_0: in std_logic_vector(3 downto 0);
				in_1: in std_logic_vector(3 downto 0);
				in_2: in std_logic_vector(3 downto 0);
				in_3: in std_logic_vector(3 downto 0);
				in_4: in std_logic_vector(3 downto 0);
				in_5: in std_logic_vector(3 downto 0);
				in_6: in std_logic_vector(3 downto 0);
				in_7: in std_logic_vector(3 downto 0);
				sel: in std_logic_vector(2 downto 0);
				output: out std_logic_vector(3 downto 0));
	end component;

signal topOut, botOut: std_logic_vector(3 downto 0);
	
begin

firstFour:	MUX_4X8to1 port map(	in_0(3 downto 0), in_1(3 downto 0), in_2(3 downto 0), in_3(3 downto 0), 
											in_4(3 downto 0), in_5(3 downto 0), in_6(3 downto 0), in_7(3 downto 0),
											sel(2 downto 0), output(3 downto 0));

secondFour:	MUX_4X8to1 port map(	in_0(7 downto 4), in_1(7 downto 4), in_2(7 downto 4), in_3(7 downto 4), 
											in_4(7 downto 4), in_5(7 downto 4), in_6(7 downto 4), in_7(7 downto 4),
											sel(2 downto 0), output(7 downto 4));

thirdFour:	MUX_4X8to1 port map(	in_0(11 downto 8), in_1(11 downto 8), in_2(11 downto 8), in_3(11 downto 8), 
											in_4(11 downto 8), in_5(11 downto 8), in_6(11 downto 8), in_7(11 downto 8),
											sel(2 downto 0), output(11 downto 8));

fourthFour:	MUX_4X8to1 port map(	in_0(15 downto 12), in_1(15 downto 12), in_2(15 downto 12), in_3(15 downto 12), 
											in_4(15 downto 12), in_5(15 downto 12), in_6(15 downto 12), in_7(15 downto 12),
											sel(2 downto 0), output(15 downto 12));


end behavior;