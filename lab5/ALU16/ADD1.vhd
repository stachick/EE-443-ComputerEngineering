library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
 
entity ADD1 is
    Port ( in0, in1 : in std_logic;
            carryIn : in std_logic;
             output : out std_logic);
end ADD1;
 
architecture Behavior of ADD1 is
 
begin
output <= (in0 xor (in1 xor carryIn)); 
 
end Behavior;