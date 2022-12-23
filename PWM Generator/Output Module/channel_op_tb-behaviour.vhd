library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of channel_op_tb is
   component channel_op
      port(amp    : in  std_logic_vector(5 downto 0);
           vel    : in  std_logic_vector(6 downto 0);
           CH_Out : out std_logic_vector(7 downto 0));
   end component;
   signal amp    : std_logic_vector(5 downto 0);
   signal vel    : std_logic_vector(6 downto 0);
   signal CH_Out : std_logic_vector(7 downto 0);
begin
   test: channel_op port map (amp, vel, CH_Out);
   amp(0) <= '1' after 0 ns;
   amp(1) <= '1' after 0 ns;
   amp(2) <= '0' after 0 ns;
   amp(3) <= '1' after 0 ns;
   amp(4) <= '0' after 0 ns;
   amp(5) <= '1' after 0 ns;
   
	vel(0) <= '0' after 0 ns,
		'1' after 1600 ns,
		'0' after 1760 ns,
		'1' after 1920 ns,
		'0' after 2080 ns;
   	vel(1) <= '0' after 0 ns,
		'1' after 1280 ns,
		'0' after 1440 ns,
		'1' after 1600 ns,
		'0' after 1920 ns;
   	vel(2) <= '0' after 0 ns,
		'1' after 960 ns,
		'0' after 1120 ns,
		'1' after 1280 ns,
		'0' after 1600 ns;
   	vel(3) <= '0' after 0 ns,
		'1' after 640 ns,
		'0' after 800 ns,
		'1' after 960 ns,
		'0' after 1280 ns;
   	vel(4) <= '0' after 0 ns,
		'1' after 320 ns,
		'0' after 480 ns,
		'1' after 640 ns,
		'0' after 960 ns;
   	vel(5) <= '1' after 0 ns,
		'0' after 160 ns,
		'1' after 320 ns,
		'0' after 640 ns;
	vel(6) <= '1' after 0 ns,
		'0' after 320 ns;
end behaviour;

