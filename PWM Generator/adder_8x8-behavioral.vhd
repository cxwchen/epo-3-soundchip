library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behavioral of adder_8x8 is
begin

Out1 <= std_logic_vector(resize(unsigned(In1), 9) + resize(unsigned(In2), 9));

end behavioral;

