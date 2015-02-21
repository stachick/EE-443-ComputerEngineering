LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY labZero IS
PORT (outpins:			OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		hex: 	IN STD_LOGIC_VECTOR(3 DOWNTO 0));
END labZero;

ARCHITECTURE g of labZero IS
BEGIN
process(hex)
	BEGIN
	CASE hex IS
		WHEN "0000" => outpins <= "1000000"; --0
		WHEN "0001" => outpins <= "1111001"; --1
		WHEN "0010" => outpins <= "0100100"; --2
		WHEN "0011" => outpins <= "0110000"; --3
		WHEN "0100" => outpins <= "0011001"; --4
		WHEN "0101" => outpins <= "0010010"; --5
		WHEN "0110" => outpins <= "0000010"; --6
		WHEN "0111" => outpins <= "1111000"; --7
		WHEN "1000" => outpins <= "0000000"; --8
		WHEN "1001" => outpins <= "0010000"; --9
		WHEN "1010" => outpins <= "0001000"; --A
		WHEN "1011" => outpins <= "0000011"; --b (does not share symbol with 8)
		WHEN "1100" => outpins <= "1000110"; --C
		WHEN "1101" => outpins <= "0100001"; --d (does not share symbol with 0)
		WHEN "1110" => outpins <= "0000110"; --E
		WHEN "1111" => outpins <= "0001110"; --F
		
	END CASE;
end process;
END ARCHITECTURE g;	
