library IEEE;
use IEEE.std_logic_1164.ALL;

entity byte_register is
   port(clk    : in  std_logic;
        d      : in  std_logic;
        enable : in  std_logic;
        reset  : in  std_logic;
	loc_reset : in std_logic;
        q      : out std_logic_vector(7 downto 0);
        ready  : out std_logic);
end byte_register;

