library IEEE;
use IEEE.std_logic_1164.all;

-- Wave Selection Module

entity wave_selection is
   port(clk     : in  std_logic;
        reset   : in  std_logic;
        w_s_in  : in  std_logic_vector(2 downto 0);
        note_on : in  std_logic_vector(3 downto 0);
        w_s_out : out std_logic_vector(5 downto 0);
        led_out : out std_logic_vector(12 downto 0));
end wave_selection;

architecture structural of wave_selection is 

signal s : std_logic_vector(5 downto 0);

component fsm port(
	clk, reset : in std_logic;
	fsm_button : in std_logic;
	fsm_wave_out : out std_logic_vector(1 downto 0));
end component;

component decoder port(
	dec_wave_in : in std_logic_vector(5 downto 0);
	dec_note_on : in std_logic_vector(3 downto 0);
	dec_led_out : out std_logic_vector(12 downto 0));
end component;

begin

fsm1: fsm
	port map(
		clk => clk,
		reset => reset,
		fsm_button => w_s_in(0),
		fsm_wave_out => s(1 downto 0));


fsm2: fsm
	port map(
		clk => clk,
		reset => reset,
		fsm_button => w_s_in(1),
		fsm_wave_out => s(3 downto 2));

fsm3: fsm
	port map(
		clk => clk,
		reset => reset,
		fsm_button => w_s_in(2),
		fsm_wave_out => s(5 downto 4));

dec1: decoder
	port map(
		dec_wave_in(5 downto 0) => s(5 downto 0),
		dec_note_on => note_on,
		dec_led_out => led_out);

w_s_out <= s;

end structural;