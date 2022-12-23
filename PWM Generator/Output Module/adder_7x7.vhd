library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_unsigned.ALL;

entity adder_7x7 is
   port(in1  : in  std_logic_vector(6 downto 0);
        in2  : in  std_logic_vector(6 downto 0);
        out1 : out std_logic_vector(7 downto 0));
end adder_7x7;

