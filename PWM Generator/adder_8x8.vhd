library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_unsigned.ALL;

entity adder_8x8 is
   port(in1  : in  std_logic_vector(7 downto 0);
        in2  : in  std_logic_vector(7 downto 0);
        out1 : out std_logic_vector(8 downto 0));
end adder_8x8;

