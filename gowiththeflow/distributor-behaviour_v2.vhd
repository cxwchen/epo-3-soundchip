library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture behaviour of distributor is
    	type fsm_state_type is (rst, idle, readstate, update);

    	signal fsm_state, new_fsm_state     : fsm_state_type;

    -- Internal signals representing outputs.
    	signal notes, new_notes             : std_logic_vector(3 downto 0);
    	signal pitches, new_pitches         : std_logic_vector(27 downto 0);
    	signal velocities, new_velocities     : std_logic_vector(27 downto 0);
    

begin
	reg : process( clk, reset, loc_reset )
    	begin
        		if (reset = '1' or loc_reset = '1') then
            			fsm_state   <= rst;
        		elsif( clk'event and clk = '1') then
            			fsm_state   <= new_fsm_state;
        		end if;
    	end process ; -- reg

    	comb : process( sd_in, reset, loc_reset, fsm_state, reg_ready, notes, new_notes, pitches, new_pitches, velocities, new_velocities)
    	begin
        		case fsm_state is
            		when rst   =>
                			notes           <= (others  => '0');
                			new_notes       <= (others  => '0');
                			pitches         <= (others  => '0');
                			new_pitches     <= (others  => '0');
                			velocities      <= (others  => '0');
                			new_velocities  <= (others  => '0');

                			if (reset = '0' and loc_reset = '0') then
                    				new_fsm_state   <= idle;
                			else
                    				new_fsm_state   <= rst;
                			end if;

            		when idle   =>
                			notes           <= notes;
                			pitches         <= pitches;
                			velocities      <= velocities;
                			new_notes       <= new_notes;
                			new_pitches     <= new_pitches;
                			new_velocities  <= new_velocities;

                			if(reg_ready = "111") then
                    				new_fsm_state   <= readstate;
                			else
                    				new_fsm_state   <= idle;
                			end if;

            		when readstate   =>
                			notes           <= notes;
                			pitches         <= pitches;
                			velocities      <= velocities;
                
                			new_fsm_state   <= update;
                
                			if (sd_in(6 downto 4) = "001") then -- "001" means that the status message is a Note On message
                    				if ((unsigned(sd_in(14 downto 8)) <= to_unsigned(48,7)) and (unsigned(sd_in(14 downto 8)) >= to_unsigned(22,7))) then -- Check if the input note is in the bass register (C0 - C3)
                        					new_pitches(6 downto 0)         <= sd_in(14 downto 8);
                        					new_pitches(20 downto 7)        <= new_pitches(20 downto 7);
					new_pitches(27 downto 21)				<= new_pitches(27 downto 21);

                        					new_notes(0)                    <= '1';
                        					new_notes(3 downto 1)           <= new_notes(3 downto 1);

                        					new_velocities(6 downto 0)      <= sd_in(22 downto 16);
					new_velocities(27 downto 21)				<= new_velocities(27 downto 21);
                        					new_velocities(20 downto 7)     <= new_velocities(20 downto 7);
                    				elsif((unsigned(sd_in(14 downto 8)) <= to_unsigned(107,7)) and (unsigned(sd_in(14 downto 8)) >= to_unsigned(81,7))) then -- High
                        					new_pitches(20 downto 14)       <= sd_in(14 downto 8);
                        					new_pitches(13 downto 0)        <= new_pitches(13 downto 0);
					new_pitches(27 downto 21)				<= new_pitches(27 downto 21);

                        					new_notes(2)                    <= '1';
                        					new_notes(1 downto 0)           <= new_notes(1 downto 0);
					new_notes(3)				<= new_notes(3);

                        					new_velocities(20 downto 14)    <= sd_in(22 downto 16);
                        					new_velocities(13 downto 0)     <= new_velocities(13 downto 0);
					new_velocities(27 downto 21)				<= new_velocities(27 downto 21);
				elsif((unsigned(sd_in(14 downto 8)) = to_unsigned(21,7)) or (unsigned(sd_in(14 downto 8)) = to_unsigned(108,7))) then --- note number 108 and 21 will be noise
					new_pitches(27 downto 21) 				<= sd_in(14 downto 8);
					new_pitches(20 downto 0)				<= new_pitches(20 downto 0);

					new_notes(3)				<= '1';
					new_notes(2 downto 0)				<= new_notes(2 downto 0);
		
					new_velocities(27 downto 21)				<= sd_in(22 downto 16);
					new_velocities(20 downto 14)				<= new_velocities(20 downto 14);
					new_velocities(13 downto 0)				<= new_velocities(13 downto 0);
                   				 else -- Mid
                        					new_pitches(13 downto 7)        <= sd_in(14 downto 8);
                        					new_pitches(20 downto 14)       <= new_pitches(20 downto 14);
                        					new_pitches(6 downto 0)         <= new_pitches(6 downto 0);
					new_pitches(27 downto 21)				<= new_pitches(27 downto 21);

                        					new_notes(1)                    <= '1';
                        					new_notes(2)                    <= new_notes(2);
                        					new_notes(0)                    <= new_notes(0);
					new_notes(3)				<= new_notes(3);

                        					new_velocities(20 downto 14)    <= new_velocities(20 downto 14);
                        					new_velocities(13 downto 7)     <= sd_in(22 downto 16);
                        					new_velocities(6 downto 0)      <= new_velocities(6 downto 0);
					new_velocities(27 downto 21)				<= new_velocities(27 downto 21);
                    				end if;
                			elsif (sd_in(6 downto 4) = "000") then -- "000" means that the status message is a Note off message
                    				if (sd_in(15 downto 8) = ('0' & pitches(6 downto 0)) ) then
                        -- new_pitches(6 downto 0) <= (others => '0');
                        					new_notes(0)            <= '0';
                        					new_notes(3 downto 1)   <= new_notes(3 downto 1);

                    				elsif (sd_in(15 downto 8) = ('0' & pitches(13 downto 7)) ) then
                        -- new_pitches(13 downto 7) <= (others => '0');
                        					new_notes(0)            <= new_notes(0);
                        					new_notes(1)            <= '0';
                        					new_notes(2)            <= new_notes(2);
					new_notes(3)			<= new_notes(3);

                    				elsif (sd_in(15 downto 8) = ('0' & pitches(20 downto 14)) ) then
                        -- new_pitches(20 downto 14) <= (others => '0');
                        					new_notes(2)            <= '0';
                        					new_notes(1 downto 0)   <= new_notes(1 downto 0);
					new_notes(3)			<= new_notes(3);
				elsif (sd_in(15 downto 8) = ('0' & pitches(27 downto 21)) ) then
					new_notes(3)			<= '0';
					new_notes(2 downto 0)			<= new_notes(2 downto 0);
                    				else
                        					new_notes       <= new_notes;
                    				end if;
                			else
                    				new_pitches         <= new_pitches;
                    				new_notes           <= new_notes;
                    				new_velocities      <= new_velocities;
                			end if; 

			

            		when update =>
                			notes           <= new_notes;
                			pitches         <= new_pitches;
                			velocities      <= new_velocities;
                			new_notes       <= new_notes;
                			new_pitches     <= new_pitches;
                			new_velocities  <= new_velocities;

                			new_fsm_state   <= idle;
        		end case;
    end process ; -- comb

    note_on     <= notes;

    velo0       <= velocities(6 downto 0);
    velo1       <= velocities(13 downto 7);
    velo2       <= velocities(20 downto 14);
    velo3       <= velocities(27 downto 21);
    
    pitch_tg0   <= pitches(6 downto 0);
    pitch_tg1   <= pitches(13 downto 7);
    pitch_tg2   <= pitches(20 downto 14);

end architecture behaviour;

