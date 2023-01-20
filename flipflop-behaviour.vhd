library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of flipflop is
begin
	process(clk)
	begin
		if (rising_edge (clk)) then
			q <= d;
		end if;
	end process;
end behaviour;

