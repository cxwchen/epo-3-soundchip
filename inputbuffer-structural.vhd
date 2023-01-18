library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture structural of inputbuffer is
	component flipflop is
	port(
		clk	: in std_logic;
		d	: in std_logic;
		q	: out std_logic
	);
	end component flipflop;

	signal f1f2	: std_logic;

	begin
	f1 : flipflop
	port map(
		clk 	=> clk,
		d	=> d,
		q	=> f1f2
	);

	f2 : flipflop
	port map(
		clk 	=> clk,
		d	=> f1f2,
		q	=> q
	);
end structural;


