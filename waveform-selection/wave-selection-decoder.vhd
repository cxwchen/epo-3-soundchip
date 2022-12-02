library IEEE;
use IEEE.std_logic_1164.all;

--entity of decoder
--first 4 LED's are used to indicate if a tone is produced
--the other 9 are used to indicate the wave type

entity decoder is
	port(	dec_wave_in : in std_logic_vector(5 downto 0);
		dec_note_on : in std_logic_vector(3 downto 0);
		dec_led_out : out std_logic_vector(12 downto 0));
end entity;

architecture behav_dec of decoder is 
begin

	dec_led_out(0) <= dec_note_on(0);
	dec_led_out(1) <= dec_note_on(1);
	dec_led_out(2) <= dec_note_on(2);
	dec_led_out(3) <= dec_note_on(3);

	dec_led_out(4) <= dec_wave_in(0) and (not dec_wave_in(1));
	dec_led_out(5) <= (not dec_wave_in(0)) and dec_wave_in(1);
	dec_led_out(6) <= dec_wave_in(0) and dec_wave_in(1);

	dec_led_out(7) <= dec_wave_in(2) and (not dec_wave_in(3));
	dec_led_out(8) <= (not dec_wave_in(2)) and dec_wave_in(3);
	dec_led_out(9) <= dec_wave_in(2) and dec_wave_in(3);

	dec_led_out(10) <= dec_wave_in(4) and (not dec_wave_in(5));
	dec_led_out(11) <= (not dec_wave_in(4)) and dec_wave_in(5);
	dec_led_out(12) <= dec_wave_in(4) and dec_wave_in(5);
end architecture behav_dec;