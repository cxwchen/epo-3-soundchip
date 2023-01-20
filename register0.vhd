library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity register0 is
   port(clk    : in  std_logic;
        d      : in  std_logic;
        enable : in  std_logic_vector(2 downto 0);
	reset	: in std_logic;
	loc_reset : in std_logic;
        q      : out std_logic_vector(23 downto 0);
        ready  : out std_logic_vector(2 downto 0));
end register0;

