library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_unsigned.ALL;

entity partial_mult is
   port(amp   : in  std_logic_vector(5 downto 0);
        vel   : in  std_logic_vector(6 downto 0);
        M_out  : out std_logic_vector(11 downto 0));
end partial_mult;

