library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MUX_4x8to1 is
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
end MUX_4x8to1;

architecture behavior of MUX_4x8to1 is

	component MUX_4x4to1 is
		port(	in0: in std_logic_vector(3 downto 0);
				in1: in std_logic_vector(3 downto 0);
				in2: in std_logic_vector(3 downto 0);
				in3: in std_logic_vector(3 downto 0);
				sel: in std_logic_vector(1 downto 0);
			output: out std_logic_vector(3 downto 0)
				);
	end component;

signal topOut, botOut: std_logic_vector(3 downto 0);
	
begin

innerTop: MUX_4x4to1 port map(in_0, in_1, in_2, in_3, sel(1 downto 0), topOut);
innerBot: MUX_4x4to1 port map(in_4, in_5, in_6, in_7, sel(1 downto 0), botOut);
outer: MUX_4x4to1 port map(topOut, topOut, botOut, botOut, sel(2 downto 1), output);

end behavior;