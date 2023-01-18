library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity counter is
   port(clk       : in  std_logic;
        reset     : in  std_logic;
	loc_reset	: in std_logic;
        count_out : out std_logic_vector(9 downto 0));
end counter;
