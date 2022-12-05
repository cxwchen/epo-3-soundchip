library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_unsigned.ALL;

entity adder_9x9 is
   port(in1  : in  std_logic_vector(8 downto 0);
        in2  : in  std_logic_vector(8 downto 0);
        Out1 : out std_logic_vector(9 downto 0));
end adder_9x9;

