library IEEE;
use IEEE.std_logic_1164.ALL;

architecture min1bit of adder6x5 is
begin

	A1_Out <= std_logic_vector(unsigned(amp(5 downto 1)) + unsigned(amp(5 downto 0) & '0')) & 0;

end min1bit;

