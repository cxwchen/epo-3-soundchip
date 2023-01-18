library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of midi_decoder_tb is
   component midi_decoder
      port(clk     : in  std_logic;
           reset   : in  std_logic;
           d       : in  std_logic;
           note_on : out std_logic_vector(3 downto 0);
           tg_0    : out std_logic_vector(6 downto 0);
           tg_1    : out std_logic_vector(6 downto 0);
           tg_2    : out std_logic_vector(6 downto 0);
           vel_0   : out std_logic_vector(6 downto 0);
           vel_1   : out std_logic_vector(6 downto 0);
           vel_2   : out std_logic_vector(6 downto 0);
           vel_3   : out std_logic_vector(6 downto 0));
   end component;
   signal clk     : std_logic;
   signal reset   : std_logic;
   signal d       : std_logic;
   signal note_on : std_logic_vector(3 downto 0);
   signal tg_0    : std_logic_vector(6 downto 0);
   signal tg_1    : std_logic_vector(6 downto 0);
   signal tg_2    : std_logic_vector(6 downto 0);
   signal vel_0   : std_logic_vector(6 downto 0);
   signal vel_1   : std_logic_vector(6 downto 0);
   signal vel_2   : std_logic_vector(6 downto 0);
   signal vel_3   : std_logic_vector(6 downto 0);
begin
   test: midi_decoder port map (clk, reset, d, note_on, tg_0, tg_1, tg_2, vel_0, vel_1, vel_2, vel_3);
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   reset <= '1' after 0 ns,
            '0' after 25 ns;
   d <= '1' after 0 ns,
	'0' after 32 us,
	'1' after 64 us, 
	'0' after 96 us,
	'1' after 160 us,
	'0' after 192 us,
	'1' after 320 us,
	'0' after 640 us,
	'1' after 800 us,
	'0' after 832 us,
	'1' after 960 us,
	'0' after 1100 us,
	'1' after 1228 us,
	'0' after 1260 us,
	'1' after 1420 us;
end behaviour;



