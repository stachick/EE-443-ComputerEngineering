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
	
	component MUX_16x8to1 is
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
	
	end component;
	
	component MUX_4x4to1 is
		port(	in0: in std_logic_vector(3 downto 0);
				in1: in std_logic_vector(3 downto 0);
				in2: in std_logic_vector(3 downto 0);
				in3: in std_logic_vector(3 downto 0);
				sel: in std_logic_vector(2 downto 0);
				output: out std_logic_vector(3 downto 0));
	end component;
	
	component DCD3x8 is
		port(	input: in std_logic_vector(2 downto 0);
			  output: out std_logic_vector(7 downto 0));
	end component;
	
	component REG16 is
	port(	D: in std_logic_vector(15 downto 0);
		  EN: in std_logic;
		 CLK: in std_logic;
			Q: out std_logic_vector(15 downto 0));
	end component;
	
signal R0, R1, R2, R3, R4, R5, R6, R7: std_logic_vector (15 downto 0);
signal W0, W1, W2, W3, W4, W5, W6, W7: std_logic;
signal WrAddr: std_logic_vector(7 downto 0);
	
begin

WriteAddr: DCD3x8 port map(ADD_W, WrAddr);

process(WE, WrAddr)
begin
	if ((WE = '1') AND (WrAddr = "00000001")) then
		W0 <= '1';
	elsif ((WE = '1') AND (WrAddr = "00000010")) then
		W1 <= '1';
	elsif ((WE = '1') AND (WrAddr = "00000100")) then
		W2 <= '1';
	elsif ((WE = '1') AND (WrAddr = "00001000")) then
		W3 <= '1';
	elsif ((WE = '1') AND (WrAddr = "00010000")) then
		W4 <= '1';
	elsif ((WE = '1') AND (WrAddr = "00100000")) then
		W5 <= '1';
	elsif ((WE = '1') AND (WrAddr = "01000000")) then
		W6 <= '1';
	elsif ((WE = '1') AND (WrAddr = "10000000")) then
		W7 <= '1';
	end if;
end process;

--currently working here!
READ_1: MUX_16x8to1 port map(R0, R1, R2, R3, R4, R5, R6, R7, ADD_R1, DOUT1);
READ_2: MUX_16x8to1 port map(R0, R1, R2, R3, R4, R5, R6, R7, ADD_R2, DOUT2);

REG_0: REG16 port map(DIN(15 downto 0), W0, CLK, R0(15 downto 0));
REG_1: REG16 port map(DIN(15 downto 0), W1, CLK, R1(15 downto 0));
REG_2: REG16 port map(DIN(15 downto 0), W2, CLK, R2(15 downto 0));
REG_3: REG16 port map(DIN(15 downto 0), W3, CLK, R3(15 downto 0));
REG_4: REG16 port map(DIN(15 downto 0), W4, CLK, R4(15 downto 0));
REG_5: REG16 port map(DIN(15 downto 0), W5, CLK, R5(15 downto 0));
REG_6: REG16 port map(DIN(15 downto 0), W6, CLK, R6(15 downto 0));
REG_7: REG16 port map(DIN(15 downto 0), W7, CLK, R7(15 downto 0));

	



end;