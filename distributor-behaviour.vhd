library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of distributor is

    -- Internal signals representing outputs.
    signal notes, new_notes             : std_logic_vector(3 downto 0);
    signal pitches, new_pitches         : std_logic_vector(27 downto 0);
    signal velocities, new_velocities     : std_logic_vector(27 downto 0);
    

begin
	process(clk, reset, loc_reset)
	begin
		if (rising_edge(clk)) then
        			if (reset = '1' or loc_reset = '1') then
            				notes           <= (others => '0');
            				pitches         <= (others => '0');
            				velocities      <= (others => '0');
        			else
            			-- Update current signal on clock cycle.
            				notes       <= new_notes;
            				pitches     <= new_pitches;
            				velocities  <= new_velocities;
			end if;
		end if;
	end process;

	process(reg_ready,sd_in,pitches,velocities,notes)
	begin
            -- TODO: A dedicated noise note/key needs to be chosen
            -- Check if the data is ready to be updated
		if (reg_ready = "111") then
			if (sd_in(6 downto 4) = "001") then -- "001" means that the status message is a Note On message
                    				if ((unsigned(sd_in(14 downto 8)) <= to_unsigned(48,7)) and (unsigned(sd_in(14 downto 8)) >= to_unsigned(22,7))) then -- Check if the input note is in the bass register (C0 - C3)
                        					new_pitches(6 downto 0)     <= sd_in(14 downto 8);
					new_pitches(20 downto 7) <= pitches(20 downto 7);
					new_pitches(27 downto 21) <= pitches(27 downto 21);

					new_notes(3 downto 1) <= notes(3 downto 1);
                        					new_notes(0)                <= '1';

					new_velocities(27 downto 7) <= velocities(27 downto 7);
                        					new_velocities(6 downto 0)  <= sd_in(22 downto 16);
                    				elsif((unsigned(sd_in(14 downto 8)) <= to_unsigned(107,7)) and (unsigned(sd_in(14 downto 8)) >= to_unsigned(81,7))) then -- High
                        					new_pitches(13 downto 0) <= pitches(13 downto 0);
					new_pitches(20 downto 14)       <= sd_in(14 downto 8);
					new_pitches(27 downto 21) <= pitches(27 downto 21);


					new_notes(3) <= notes(3);
					new_notes(1 downto 0) <= notes(1 downto 0);
                        					new_notes(2)                    <= '1';

					new_velocities(27 downto 21) <= velocities(27 downto 21);
					new_velocities(13 downto 0) <= velocities(13 downto 0);
                        					new_velocities(20 downto 14)    <= sd_in(22 downto 16);
				elsif((unsigned(sd_in(14 downto 8)) >= to_unsigned(108,7)) or (unsigned(sd_in(14 downto 8)) <= to_unsigned(21,7))) then -- note numbers 108 and above, and 21 and below will be noise
					new_pitches(27 downto 21) <= sd_in(14 downto 8);
					new_pitches(20 downto 0) <= pitches(20 downto 0);

					new_notes(3) <= '1';
					new_notes(2 downto 0) <= notes(2 downto 0);

					new_velocities(27 downto 21) <= sd_in(22 downto 16);
					new_velocities(20 downto 0) <= velocities(20 downto 0);
                    				else -- Mid
					new_pitches(20 downto 14) <= pitches(20 downto 14);
					new_pitches(6 downto 0) <= pitches(6 downto 0);
                        					new_pitches(13 downto 7)    <= sd_in(14 downto 8);
					new_pitches(27 downto 21) <= pitches(27 downto 21);

					new_notes(3 downto 2) <= notes(3 downto 2);
					new_notes(0) <= notes(0);
                        					new_notes(1)                <= '1';

					new_velocities(27 downto 14) <= velocities(27 downto 14);
					new_velocities(6 downto 0) <= velocities(6 downto 0);
                        					new_velocities(13 downto 7) <= sd_in(22 downto 16);

                    -- elsif ( sd_in(14 downto 8) >= ('0' & pitches(13 downto 7)) ) then -- Check if the new input is a higher pitch than the current note on TG1
                    --     new_pitches(20 downto 14)       <= sd_in(14 downto 8);
                    --     new_notes(2)                    <= '1';
                    --     new_velocities(20 downto 14)    <= sd_in(6 downto 0);
                    -- else
                    --     new_pitches(13 downto 7)    <= sd_in(14 downto 8); -- If the pitch isnt the current highest or a bass note, route it to TG1
                    --     new_notes(1)                <= '1';
                    --     new_velocities(13 downto 7) <= sd_in(6 downto 0);
                    				end if;
         			elsif (sd_in(6 downto 4) = "000") then -- "000" means that the status message is a Note off message
				new_velocities <= velocities;
				new_pitches <= pitches;
                				if (sd_in(15 downto 8) = ('0' & pitches(6 downto 0)) ) then
                        -- new_pitches(6 downto 0) <= (others => '0');
					new_notes(3 downto 1) <= notes(3 downto 1);
                        					new_notes(0)    <= '0';
                				elsif (sd_in(15 downto 8) = ('0' & pitches(13 downto 7)) ) then
                        -- new_pitches(13 downto 7) <= (others => '0');
					new_notes(3 downto 2) <= notes(3 downto 2);
					new_notes(0) <= notes(0);
                        					new_notes(1)    <= '0';
                				elsif (sd_in(15 downto 8) = ('0' & pitches(20 downto 14)) ) then
                        -- new_pitches(20 downto 14) <= (others => '0');
					new_notes(3) <= notes(3);
					new_notes(1 downto 0) <= notes(1 downto 0);
                        					new_notes(2)    <= '0';
				elsif (sd_in(15 downto 8) = ('0' & pitches(27 downto 21)) ) then
					new_notes(3) <= '0';
					new_notes(2 downto 0) <= notes(2 downto 0);
				else
					new_notes <= notes;
                				end if;
			else
				new_velocities <= velocities;
				new_pitches <= pitches;
				new_notes <= notes;
        			end if;
		else
			new_velocities <= velocities;
			new_pitches <= pitches;
			new_notes <= notes;
		end if;
        -- if (sd_in(6 downto 4) = "000") or (sd_in(6 downto 4) = "001") then --- note off or note on message
        --     if (unsigned(sd_in(15 downto 8)) <= to_unsigned(.....)) and (unsigned(sd_in(15 downto 8)) >= to_unsigned(....)) then --- low: if the pitch is between a certain range (has not been decided yet) the tone generator responsible for that pitch needs to receive the note number (data byte 1) and the corresponding output module needs to receive the velocity (data byte 2)
        --         pitch_tg0 <= sd_in(15 downto 8);
        --         velo0 <= sd_in(23 downto 16);
        --     elsif (unsigned(sd_in(15 downto 8)) <= to_unsigned(.....)) and (unsigned(sd_in(15 downto 8)) >= to_unsigned(.....)) then --- mid: different range, see above for an explanation
        --         pitch_tg1 <= sd_in(15 downto 8);
        --         velo1 <= sd_in(23 downto 16);
        --     elsif (unsigned(sd_in(15 downto 8)) <= to_unsigned(....)) and (unsigned(sd_in(15 downto 9)) >= to_unsigned(....)) then --- high: different range, see above for an explanation
        --         pitch_tg2 <= sd_in(15 downto 8);
        --         velo2 <= sd_in(23 downto 16);
        --     else -- the note number is outside of the ranges described above so it will be considered noise
        --         --- hier weet ik niet precies wat ik moet doen voor de tone generator, want het note_on signaal wordt daarvoor gebruikt
        --         velo3 <= sd_in(23 downto 16);
        --     end if;
        -- else --- a status message we ignore 
        --     pitch_tg0   <= (others=>'0');
        --     pitch_tg1   <= (others=>'0');
        --     pitch_tg2   <= (others=>'0');
        --     note_on     <= (others=>'0');
        --     velo0       <= (others=>'0');
        --     velo1       <= (others=>'0');
        --     velo2       <= (others=>'0');
        --     velo3       <= (others=>'0');
        -- end if;
	end process;

	process(notes,velocities,pitches)
	begin
		note_on     <= notes;
		velo0       <= velocities(6 downto 0);
		velo1       <= velocities(13 downto 7);
		velo2       <= velocities(20 downto 14);
		velo3       <= velocities(27 downto 21);
		pitch_tg0   <= pitches(6 downto 0);
		pitch_tg1   <= pitches(13 downto 7);
		pitch_tg2   <= pitches(20 downto 14);
	end process;
end architecture behaviour;


