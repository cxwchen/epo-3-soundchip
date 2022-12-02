library IEEE;
use IEEE.std_logic_1164.all;

--entity of component fsm

entity fsm is
	port(	clk, reset : in std_logic;
		fsm_button : in std_logic;
		fsm_wave_out : out std_logic_vector(1 downto 0));
end entity;

architecture behaviour of fsm is

	type state_type is (silent, silent_hold, square, square_hold, saw, saw_hold, sine, sine_hold);		--SILENT is the reset state
	signal state, new_state : state_type;
begin

process(clk)
begin
	if (rising_edge(clk)) then
		if (reset = '1') then
			state <= silent;
		else
			state <= new_state;
		end if;
	end if;
end process;

process(state, fsm_button)
begin
	case state is
	when silent =>
		fsm_wave_out <= "00";
		if (fsm_button = '1') then
			new_state <= square_hold;
		else
			new_state <= silent;
		end if;
	when square_hold =>
		fsm_wave_out <= "01";
		if (fsm_button = '0') then
			new_state <= square;
		else
			new_state <= square_hold;
		end if;
	when square =>
		fsm_wave_out <= "01";
		if (fsm_button = '1') then
			new_state <= saw_hold;
		else
			new_state <= square;
		end if;
	when saw_hold =>
		fsm_wave_out <= "10";
		if (fsm_button = '0') then
			new_state <= saw;
		else
			new_state <= saw_hold;
		end if;
	when saw =>
		fsm_wave_out <= "10";
		if (fsm_button = '1') then
			new_state <= sine_hold;
		else
			new_state <= saw;
		end if;
	when sine_hold =>
		fsm_wave_out <= "11";
		if (fsm_button = '0') then
			new_state <= sine;
		else
			new_state <= sine_hold;
		end if;	
	when sine =>
		fsm_wave_out <= "11";
		if (fsm_button = '1') then
			new_state <= silent_hold;
		else
			new_state <= sine;
		end if;	
	when silent_hold =>
		fsm_wave_out <= "00";
		if (fsm_button = '0') then
			new_state <= silent;
		else
			new_state <= silent_hold;
		end if;
	end case;
end process;
end behaviour;