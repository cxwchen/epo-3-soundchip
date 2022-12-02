library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity noisegen is
  port (clk, reset: 	in 	std_logic;
        noise: 	out 	std_logic_vector (5 downto 0));
end noisegen;

architecture noisegenbeh of noisegen is
  signal currstate1, nextstate1, currstate2, nextstate2, currstate3, nextstate3: 	std_logic_vector (5 downto 0);
  signal feedback1, feedback2, feedback3: 		std_logic;
begin

  	statereg: process (clk,reset)
  	begin
    	if (reset = '1') then
      		currstate1 <= (0 => '1', others =>'0');
      		currstate2 <= (0 => '1', others =>'0');
		currstate3 <= (0 => '1', others =>'0');
    	elsif (rising_edge(clk)) then
      		currstate1 <= nextstate1;
      		currstate2 <= nextstate2;
      		currstate3 <= nextstate3;
    	end if;
 	end process;
  
  feedback1 <= currstate1(4) xor currstate1(5) xor currstate1(2) xor currstate1(0);
  nextstate1 <= feedback1 & currstate1(5 downto 1);
  feedback2 <= currstate2(5) xor currstate2(3) xor currstate2(1) xor currstate2(0);
  nextstate2 <= feedback2 & currstate2(5 downto 1);
  feedback3 <= currstate2(4) xor currstate1(4) xor currstate2(2) xor currstate1(0);
  nextstate3 <= feedback3 & currstate3(5 downto 1);
  noise <= currstate3;

end noisegenbeh;
