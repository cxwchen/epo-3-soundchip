library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behavioral_rounding of var_shift is
begin

process(Sel_Out, vel) is
begin
	if(vel(6) = '1') then
		Shift_Out <= std_logic_vector(unsigned(Sel_Out(7 downto 1))+(Sel_Out(0) & "")) & "0";
	elsif (vel(5) = '1') then
		Shift_Out <= "0" & std_logic_vector(unsigned(Sel_Out(7 downto 2))+(Sel_Out(1) & "")) & "0";
	elsif (vel(4) = '1') then 
		Shift_Out <= "00" & std_logic_vector(unsigned(Sel_Out(7 downto 3))+(Sel_Out(2) & "")) & "0";
	elsif (vel(3) = '1') then 
		Shift_Out <= "000" & std_logic_vector(unsigned(Sel_Out(7 downto 4))+(Sel_Out(3) & "")) & "0";
	elsif (vel(2) = '1') then 
		Shift_Out <= "0000" & std_logic_vector(unsigned(Sel_Out(7 downto 5))+(Sel_Out(4) & "")) & "0";
	elsif (vel(1) = '1') then 
		Shift_Out <= "00000" & std_logic_vector(unsigned(Sel_Out(7 downto 6))+(Sel_Out(5) & "")) & "0";
	else 
		Shift_Out <= "00000000";
	end if;

end process;

end behavioral_rounding;

