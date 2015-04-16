library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MUX_4x4to1 is
	port(	in0: in std_logic_vector(3 downto 0);
			in1: in std_logic_vector(3 downto 0);
			in2: in std_logic_vector(3 downto 0);
			in3: in std_logic_vector(3 downto 0);
			sel: in std_logic_vector(1 downto 0);
		output: out std_logic_vector(3 downto 0));
end MUX_4x4to1;

architecture behavior of MUX_4x4to1 is
begin

process(in0, in1, in2, in3, sel)
begin
	if (sel = "00") then
		output <= in0;
	elsif (sel = "01") then
		output <= in1;
	elsif (sel = "10") then
		output <= in2;
	elsif (sel = "11") then
		output <= in3;
	end if;
end process;
end behavior;
