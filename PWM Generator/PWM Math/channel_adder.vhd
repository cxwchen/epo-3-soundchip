library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_unsigned.ALL;

entity channel_adder is
   port(in1  : in  std_logic_vector(7 downto 0);
        in2  : in  std_logic_vector(7 downto 0);
        in3  : in  std_logic_vector(7 downto 0);
        in4  : in  std_logic_vector(7 downto 0);
        out1 : out std_logic_vector(7 downto 0));
end channel_adder;

