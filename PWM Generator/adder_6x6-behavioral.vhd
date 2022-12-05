library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behavioral of adder_6x6 is
begin

	Out1 <= std_logic_vector(resize(unsigned(In1), 7) + resize(unsigned(In2), 7));

end behavioral;

