library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_unsigned.ALL;

entity mult_adder is
   port(clk        : in  std_logic;
        amp        : in  std_logic_vector(5 downto 0);
	load	   : in  std_logic;
	shift	   : in  std_logic;
        add        : in  std_logic;
        Mult_Out   : out std_logic_vector(12 downto 0));
end mult_adder;

