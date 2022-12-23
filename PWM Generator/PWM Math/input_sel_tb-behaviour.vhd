library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of input_sel_tb is
   component input_sel
      port(amp     : in  std_logic_vector(5 downto 0);
           A1_Out  : in  std_logic_vector(7 downto 0);
           vel     : in  std_logic_vector(6 downto 0);
           Sel_Out : out std_logic_vector(7 downto 0));
   end component;
   signal amp     : std_logic_vector(5 downto 0);
   signal A1_Out  : std_logic_vector(7 downto 0);
   signal vel     : std_logic_vector(6 downto 0);
   signal Sel_Out : std_logic_vector(7 downto 0);
begin
   test: input_sel port map (amp, A1_Out, vel, Sel_Out);
   amp(0) <= '1' after 0 ns;
   amp(1) <= '1' after 0 ns;
   amp(2) <= '1' after 0 ns;
   amp(3) <= '1' after 0 ns;
   amp(4) <= '1' after 0 ns;
   amp(5) <= '1' after 0 ns;
   A1_Out(0) <= '1' after 0 ns;
   A1_Out(1) <= '0' after 0 ns;
   A1_Out(2) <= '1' after 0 ns;
   A1_Out(3) <= '1' after 0 ns;
   A1_Out(4) <= '1' after 0 ns;
   A1_Out(5) <= '1' after 0 ns;
   A1_Out(6) <= '0' after 0 ns;
   A1_Out(7) <= '1' after 0 ns;
   
	vel <= 	"0000000" after 0 ns,
		"1100000" after 160 ns,
		"1000000" after 320 ns,
		"0110000" after 480 ns,
		"0100000" after 540 ns,
		"0011000" after 700 ns,
		"0010000" after 860 ns,
		"0001100" after 1020 ns,
		"0001000" after 1180 ns,
		"0000110" after 1340 ns,
		"0000010" after 1500 ns,
		"0000001" after 1660 ns,
		"0000000" after 1820 ns;
end behaviour;

