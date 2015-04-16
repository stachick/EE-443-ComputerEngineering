library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.my_lib.all;

entity ADD16 is
	port( in0: in std_logic_vector(15 downto 0);
		  in1: in std_logic_vector(15 downto 0);
		  output:  out std_logic_vector(15 downto 0));
end ADD16;

architecture behavior of ADD16 is
signal carry1, carry2, carry3: std_logic;

begin
--ADD4 (IN, IN, CARRYIN, OUT, CARRYOUT, OVERFLOW)
ADD0: ADD4 port map(in0(3 downto 0), in1(3 downto 0), '0', output(3 downto 0), carry1, open);
ADD1: ADD4 port map(in0(7 downto 4), in1(7 downto 4), carry1, output(7 downto 4), carry2, open);
ADD2: ADD4 port map(in0(11 downto 8), in1(11 downto 8), carry2, output(11 downto 8), carry3, open);
ADD3: ADD4 port map(in0(15 downto 12), in1(15 downto 12), carry3, output(15 downto 12), open, open);
end behavior;