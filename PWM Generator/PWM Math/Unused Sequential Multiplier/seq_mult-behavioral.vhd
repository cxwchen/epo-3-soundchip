library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behavioral of seq_mult is
	type state_type is (load, add, done);
	signal state, next_state : state_type;
	signal accumulator : std_logic_vector(12 downto 0);
	signal shift_amp : std_logic_vector(11 downto 0);

begin

process (clk, reset, amp, vel_in)
begin

	if (rising_edge (clk)) then
		if (reset = '1') then
			state <= load;
		end if;
	else
		
		state <= next_state;
	
	end if;
end process;

process (state, next_state, vel_in, amp, clk)
begin

	case state is
		when load =>
			if (vel_in = '1') then
				accumulator <= std_logic_vector(resize(unsigned(amp), 13));
			else 
				accumulator <= "0000000000000";
			end if;
			
			shift_amp <= std_logic_vector(resize(shift_left(unsigned(amp), 1), 12));
			next_state <= add;
			mult_out <= "0000000000000";
		when add => 
			if(rising_edge(clk)) then
			if (vel_in = '1') then
				accumulator <= std_logic_vector(unsigned(accumulator) + resize(unsigned(shift_amp), 13));
			end if;
			shift_amp <= std_logic_vector(resize(shift_left(unsigned(shift_amp), 1), 12));
			end if;
			if (comp = '1') then
				next_state <= done;
			else 
				next_state <= add;
			end if;
			mult_out <= "0000000000000";
		when done =>
			mult_Out <= accumulator;
			next_state <= load;
	end case;

end process;



end behavioral;

