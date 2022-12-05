library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behavioral of adder6x5 is

	signal amp_s : std_logic_vector(6 downto 0);

begin
	amp_s <= std_logic_vector(amp & '0');
	A1_Out <= std_logic_vector(resize(unsigned(amp_s), 8) + resize(unsigned(amp), 8));

end behavioral;

