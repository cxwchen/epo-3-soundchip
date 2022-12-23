library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behavioral of var_shift is
begin

process(Sel_Out, vel) is
begin
	if(vel(6) = '1') then
		Shift_Out <= Sel_Out(7 downto 0); 			
	elsif (vel(5) = '1') then
		Shift_Out <= "0" & Sel_Out(7 downto 1);		--shift 1 Right (/2, truncated to nearest integer)
	elsif (vel(4) = '1') then 
		Shift_Out <= "00" & Sel_Out(7 downto 2);	--shift 2 Right (/4, truncated to nearest integer)
	elsif (vel(3) = '1') then 
		Shift_Out <= "000" & Sel_Out(7 downto 3);	--shift 3 Right (/8, truncated to nearest integer)
	elsif (vel(2) = '1') then 
		Shift_Out <= "0000" & Sel_Out(7 downto 4);	--shift 4 Right (/16, truncated to nearest integer)
	elsif (vel(1) = '1') then 
		Shift_Out <= "00000" & Sel_Out(7 downto 5);	--shift 5 Right (/32, truncated to nearest integer)
	else 
		Shift_Out <= "00000000";
	end if;

end process;

end behavioral;

