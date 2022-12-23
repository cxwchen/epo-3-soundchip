library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behavioral of input_sel is
begin

process(amp, A1_Out, vel) is
begin

	if (vel(6 downto 5) = "10") then	--for all states where MSB and the bit after are "10", select amp*2
		Sel_Out <= "0" & amp & "0";
	elsif (vel(6 downto 5) = "11") then	--for all states where MSB and the bit after are "11", select Adder Output (amp*3)
		Sel_Out <= A1_Out;
	elsif (vel(5 downto 4) = "10") then
		Sel_Out <= "0" & amp & "0";
	elsif (vel(5 downto 4) = "11") then
		Sel_Out <= A1_Out;
	elsif (vel(4 downto 3) = "10") then
		Sel_Out <= "0" & amp & "0";
	elsif (vel(4 downto 3) = "11") then
		Sel_Out <= A1_Out;
	elsif (vel(3 downto 2) = "10") then
		Sel_Out <= "0" & amp & "0";
	elsif (vel(3 downto 2) = "11") then
		Sel_Out <= A1_Out;
	elsif (vel(2 downto 1) = "10") then
		Sel_Out <= "0" & amp & "0";
	elsif (vel(2 downto 1) = "11") then
		Sel_Out <= A1_Out;
	elsif (vel(1 downto 0) = "10") then
		Sel_Out <= "0" & amp & "0";
	elsif (vel(1 downto 0) = "11") then
		Sel_Out <= A1_Out;
	elsif (vel(0) = '1') then
		Sel_Out <= "0" & amp & "0";
	else
		Sel_Out <= "00000000";
	
	end if;


end process;

end behavioral;

