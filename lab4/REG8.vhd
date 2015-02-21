library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity REG8 is
	port(	D: in std_logic_vector(7 downto 0);
		  EN: in std_logic;
		 CLK: in std_logic;
			Q: out std_logic_vector(7 downto 0));
end REG8;

architecture behavior of REG8 is
begin

process (CLK, EN)
begin
	if (CLK 'EVENT AND CLK = '1' AND EN = '1') then
		Q <= D;
	end if;
end process;
end behavior;
