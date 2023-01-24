library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity distributor is
    port (
        clk, reset, loc_reset                                               : in std_logic;
        sd_in                                                               : in std_logic_vector(23 downto 0); -- Input received from the register (connected to q)
        reg_ready                                                           : in std_logic_vector(2 downto 0);  -- Ready signals from register
        note_on                                                             : out std_logic_vector(3 downto 0);
        velo0, velo1, velo2, velo3, pitch_tg0, pitch_tg1, pitch_tg2         : out std_logic_vector(6 downto 0)
    );
end entity distributor;

architecture behavioural of distributor is
    -- type fsm_state_type is (rst, idle, read, update);

    -- signal fsm_state, new_fsm_state     : fsm_state_type;

    -- Internal signals representing outputs.
    signal notes, new_notes             : std_logic_vector(3 downto 0);
    signal pitches, new_pitches         : std_logic_vector(27 downto 0);
    signal velocities, new_velocities     : std_logic_vector(27 downto 0);
    

begin
    process(clk, reset, loc_reset)
    begin
        if (rising_edge(clk)) then
            if (reset = '1' or loc_reset = '1') then
                notes <= (others => '0');
                pitches <= (others => '0');
                velocities <= (others => '0');
            else
                notes <= new_notes;
                pitches <= new_pitches;
                velocities <= new_velocities;
            end if;
        end if;
    end process;

    process(reg_ready, sd_in, pitches, velocities, notes)
    begin
        if (reg_ready = "111") then
            if (sd_in(6 downto 4) = "001") then 
                if ((unsigned(sd_in(14 downto 8)) <= to_unsigned(48,7)) and (unsigned(sd_in(14 downto 8)) >= to_unsigned(22, 7))) then -- Bass register
                    new_pitches(6 downto 0) <= sd_in(14 downto 8);
                    new_pitches(27 downto 7) <= pitches(27 downto 7);

                    new_notes(3 downto 1) <= notes(3 downto 1);
                    new_notes(0) <= '1';

                    new_velocities(6 downto 0) <= sd_in(22 downto 16);
                    new_velocities(27 downto 7) <= velocities(27 downto 7);
                elsif((unsigned(sd_in(14 downto 8)) <= to_unsigned(107, 7)) and (unsigned(sd_in(14 downto 8)) >= to_unsigned(81,7))) then -- High register
                    new_pitches(13 downto 0) <= pitches(13 downto 0);
                    new_pitches(20 downto 14) <= sd_in(14 downto 8);
                    new_pitches(27 downto 21) <= pitches(27 downto 21);

                    new_notes(2) <= '1';
                    new_notes(1 downto 0) <= notes(1 downto 0);
                    new_notes(3) <= notes(3);

                    new_velocities(13 downto 0) <= velocities(13 downto 0);
                    new_velocities(20 downto 14) <= sd_in(22 downto 16);
                    new_velocities(27 downto 21) <= velocities(27 downto 21);
                elsif ((unsigned(sd_in(14 downto 8)) >= to_unsigned(108, 7)) or (unsigned(sd_in(14 downto 8)) <= to_unsigned(21,7))) then -- note numbers 108 and above and 21 and below will be noise
                    new_pitches(27 downto 21) <= sd_in(14 downto 8);
                    new_pitches(20 downto 0) <= pitches(20 downto 0);

                    new_notes(3) <= '1';
                    new_notes(2 downto 0) <= notes(2 downto 0);

                    new_velocities(27 downto 21) <= sd_in(22 downto 16);
                    new_velocities(20 downto 0) <= velocities(20 downto 0);
                else -- Mid register
                    new_pitches(13 downto 7) <= sd_in(14 downto 8);
                    new_pitches(6 downto 0) <= pitches(6 downto 0);
                    new_pitches(27 downto 14) <= pitches(27 downto 14);

                    new_notes(1) <= '1';
                    new_notes(3 downto 2) <= notes(3 downto 2);
                    new_notes(0) <= notes(0);

                    new_velocities(13 downto 7) <= sd_in(22 downto 16);
                    new_velocities(6 downto 0) <= velocities(6 downto 0);
                    new_velocities(27 downto 14) <= velocities(27 downto 14);
                end if;
            elsif (sd_in(6 downto 4) = "000") then
                new_velocities <= velocities;
                new_pitches <= pitches;

                if (sd_in(15 downto 8) = ('0' & pitches(6 downto 0))) then
                    new_notes(3 downto 1) <= notes(3 downto 1);
                    new_notes(0) <= '0';
                elsif (sd_in(15 downto 8) = ('0' & pitches(13 downto 7))) then
                    new_notes(3 downto 2) <= notes(3 downto 2);
                    new_notes(1) <= '0';
                    new_notes(0) <= notes(0);
                elsif(sd_in(15 downto 8) = ('0' & pitches(20 downto 14))) then
                    new_notes(2) <= '0';
                    new_notes(1 downto 0) <= notes(1 downto 0);
                    new_notes(3) <= notes(3);
                elsif(sd_in(15 downto 8) = ('0' & pitches(27 downto 21))) then
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
    end process;

    process(notes, velocities, pitches)
    begin
        note_on <= notes;
        velo0 <= velocities(6 downto 0);
        velo1 <= velocities(13 downto 7);
        velo2 <= velocities(20 downto 14);
        velo3 <= velocities(27 downto 21);
        pitch_tg0 <= pitches(6 downto 0);
        pitch_tg1 <= pitches(13 downto 7);
        pitch_tg2 <= pitches(20 downto 14);
    end process;

    -- process(clk, reset)
    -- begin
    --     if (reset = '1' or loc_reset = '1') then
    --         notes           <= (others => '0');
    --         new_notes       <= (others => '0');
    --         pitches         <= (others => '0');
    --         new_pitches     <= (others => '0');
    --         velocities      <= (others => '0');
    --         new_velocities  <= (others => '0');
    --     elsif (clk'event and clk = '1') then
    --         -- Update current signal on clock cycle.
    --         notes       <= new_notes;
    --         pitches     <= new_pitches;
    --         velocities  <= new_velocities;
    --         -- TODO: A dedicated noise note/key needs to be chosen
    --         -- Check if the data is ready to be updated
    --         if (reg_ready = "111") then
    --             if (sd_in(6 downto 4) = "001") then -- "001" means that the status message is a Note On message
    --                 if ((unsigned(sd_in(14 downto 8)) <= to_unsigned(48,7)) and (unsigned(sd_in(14 downto 8)) >= to_unsigned(21,7))) then -- Check if the input note is in the bass register (C0 - C3)
    --                     new_pitches(6 downto 0)         <= sd_in(14 downto 8);
    --                     new_pitches(20 downto 7)        <= new_pitches(20 downto 7);

    --                     new_notes(0)                    <= '1';
    --                     new_notes(2 downto 1)           <= new_notes(2 downto 1);

    --                     new_velocities(6 downto 0)      <= sd_in(22 downto 16);
    --                     new_velocities(20 downto 7)     <= new_velocities(20 downto 7);
    --                 elsif((unsigned(sd_in(14 downto 8)) <= to_unsigned(108,7)) and (unsigned(sd_in(14 downto 8)) >= to_unsigned(81,7))) then -- High
    --                     new_pitches(20 downto 14)       <= sd_in(14 downto 8);
    --                     new_pitches(13 downto 0)        <= new_pitches(13 downto 0);

    --                     new_notes(2)                    <= '1';
    --                     new_notes(1 downto 0)           <= new_notes(1 downto 0);

    --                     new_velocities(20 downto 14)    <= sd_in(22 downto 16);
    --                     new_velocities(13 downto 0)     <= new_velocities(13 downto 0);
    --                 else -- Mid
    --                     new_pitches(13 downto 7)        <= sd_in(14 downto 8);
    --                     new_pitches(20 downto 14)       <= new_pitches(20 downto 14);
    --                     new_pitches(6 downto 0)         <= new_pitches(6 downto 0);

    --                     new_notes(1)                    <= '1';
    --                     new_notes(2)                    <= new_notes(2);
    --                     new_notes(0)                    <= new_notes(0);

    --                     new_velocities(20 downto 14)    <= new_velocities(20 downto 14);
    --                     new_velocities(13 downto 7)     <= sd_in(22 downto 16);
    --                     new_velocities(6 downto 0)      <= new_velocities(6 downto 0);

    --                 -- elsif ( sd_in(14 downto 8) >= ('0' & pitches(13 downto 7)) ) then -- Check if the new input is a higher pitch than the current note on TG1
    --                 --     new_pitches(20 downto 14)       <= sd_in(14 downto 8);
    --                 --     new_notes(2)                    <= '1';
    --                 --     new_velocities(20 downto 14)    <= sd_in(6 downto 0);
    --                 -- else
    --                 --     new_pitches(13 downto 7)    <= sd_in(14 downto 8); -- If the pitch isnt the current highest or a bass note, route it to TG1
    --                 --     new_notes(1)                <= '1';
    --                 --     new_velocities(13 downto 7) <= sd_in(6 downto 0);
    --                 end if;
    --             elsif (sd_in(6 downto 4) = "000") then -- "000" means that the status message is a Note off message
    --                 if (sd_in(15 downto 8) = ('0' & pitches(6 downto 0)) ) then
    --                     -- new_pitches(6 downto 0) <= (others => '0');
    --                     new_notes(0)            <= '0';
    --                     new_notes(2 downto 1)   <= new_notes(2 downto 1);

    --                 elsif (sd_in(15 downto 8) = ('0' & pitches(13 downto 7)) ) then
    --                     -- new_pitches(13 downto 7) <= (others => '0');
    --                     new_notes(0)            <= new_notes(0);
    --                     new_notes(1)            <= '0';
    --                     new_notes(2)            <= new_notes(2);

    --                 elsif (sd_in(15 downto 8) = ('0' & pitches(20 downto 14)) ) then
    --                     -- new_pitches(20 downto 14) <= (others => '0');
    --                     new_notes(2)            <= '0';
    --                     new_notes(1 downto 0)   <= new_notes(1 downto 0);
                        
    --                 else
    --                     new_notes       <= new_notes;
    --                 end if;
    --             else
    --                 new_pitches         <= new_pitches;
    --                 new_notes           <= new_notes;
    --                 new_velocities      <= new_velocities;
    --             end if; 
    --         end if;
    --     end if;
    -- end process;

    -- reg : process( clk, reset, loc_reset )
    -- begin
    --     if (reset = '1' or loc_reset = '1') then
    --         fsm_state   <= rst;
    --     elsif( clk'event and clk = '1') then
    --         fsm_state   <= new_fsm_state;
    --     end if;
    -- end process ; -- reg

    -- comb : process( sd_in, reg_ready, notes, new_notes, pitches, new_pitches, velocities, new_velocities, fsm_state)
    -- begin
    --     case fsm_state is
    --         when rst   =>
    --             notes           <= (others  => '0');
    --             new_notes       <= (others  => '0');
    --             pitches         <= (others  => '0');
    --             new_pitches     <= (others  => '0');
    --             velocities      <= (others  => '0');
    --             new_velocities  <= (others  => '0');

    --             if (reset = '0' and loc_reset = '0') then
    --                 new_fsm_state   <= idle;
    --             else
    --                 new_fsm_state   <= rst;
    --             end if;

    --         when idle   =>
    --             notes           <= notes;
    --             pitches         <= pitches;
    --             velocities      <= velocities;
    --             new_notes       <= new_notes;
    --             new_pitches     <= new_pitches;
    --             new_velocities  <= new_velocities;

    --             if(reg_ready = "111") then
    --                 new_fsm_state   <= read;
    --             else
    --                 new_fsm_state   <= idle;
    --             end if;

    --         when read   =>
    --             notes           <= notes;
    --             pitches         <= pitches;
    --             velocities      <= velocities;
                
    --             new_fsm_state   <= update;
                
    --             if (sd_in(6 downto 4) = "001") then -- "001" means that the status message is a Note On message
    --                 if ((unsigned(sd_in(14 downto 8)) <= to_unsigned(48,7)) and (unsigned(sd_in(14 downto 8)) >= to_unsigned(21,7))) then -- Check if the input note is in the bass register (C0 - C3)
    --                     new_pitches(6 downto 0)         <= sd_in(14 downto 8);
    --                     new_pitches(20 downto 7)        <= new_pitches(20 downto 7);

    --                     new_notes(0)                    <= '1';
    --                     new_notes(2 downto 1)           <= new_notes(2 downto 1);

    --                     new_velocities(6 downto 0)      <= sd_in(22 downto 16);
    --                     new_velocities(20 downto 7)     <= new_velocities(20 downto 7);
    --                 elsif((unsigned(sd_in(14 downto 8)) <= to_unsigned(108,7)) and (unsigned(sd_in(14 downto 8)) >= to_unsigned(81,7))) then -- High
    --                     new_pitches(20 downto 14)       <= sd_in(14 downto 8);
    --                     new_pitches(13 downto 0)        <= new_pitches(13 downto 0);

    --                     new_notes(2)                    <= '1';
    --                     new_notes(1 downto 0)           <= new_notes(1 downto 0);

    --                     new_velocities(20 downto 14)    <= sd_in(22 downto 16);
    --                     new_velocities(13 downto 0)     <= new_velocities(13 downto 0);
    --                 else -- Mid
    --                     new_pitches(13 downto 7)        <= sd_in(14 downto 8);
    --                     new_pitches(20 downto 14)       <= new_pitches(20 downto 14);
    --                     new_pitches(6 downto 0)         <= new_pitches(6 downto 0);

    --                     new_notes(1)                    <= '1';
    --                     new_notes(2)                    <= new_notes(2);
    --                     new_notes(0)                    <= new_notes(0);

    --                     new_velocities(20 downto 14)    <= new_velocities(20 downto 14);
    --                     new_velocities(13 downto 7)     <= sd_in(22 downto 16);
    --                     new_velocities(6 downto 0)      <= new_velocities(6 downto 0);
    --                 end if;
    --             elsif (sd_in(6 downto 4) = "000") then -- "000" means that the status message is a Note off message
    --                 if (sd_in(15 downto 8) = ('0' & pitches(6 downto 0)) ) then
    --                     -- new_pitches(6 downto 0) <= (others => '0');
    --                     new_notes(0)            <= '0';
    --                     new_notes(2 downto 1)   <= new_notes(2 downto 1);

    --                 elsif (sd_in(15 downto 8) = ('0' & pitches(13 downto 7)) ) then
    --                     -- new_pitches(13 downto 7) <= (others => '0');
    --                     new_notes(0)            <= new_notes(0);
    --                     new_notes(1)            <= '0';
    --                     new_notes(2)            <= new_notes(2);

    --                 elsif (sd_in(15 downto 8) = ('0' & pitches(20 downto 14)) ) then
    --                     -- new_pitches(20 downto 14) <= (others => '0');
    --                     new_notes(2)            <= '0';
    --                     new_notes(1 downto 0)   <= new_notes(1 downto 0);
    --                 else
    --                     new_notes       <= new_notes;
    --                 end if;
    --             else
    --                 new_pitches         <= new_pitches;
    --                 new_notes           <= new_notes;
    --                 new_velocities      <= new_velocities;
    --             end if; 

    --         when update =>
    --             notes           <= new_notes;
    --             pitches         <= new_pitches;
    --             velocities      <= new_velocities;
    --             new_notes       <= new_notes;
    --             new_pitches     <= new_pitches;
    --             new_velocities  <= new_velocities;

    --             new_fsm_state   <= idle;
    --     end case;
    -- end process ; -- comb

    -- note_on     <= notes;

    -- velo0       <= velocities(6 downto 0);
    -- velo1       <= velocities(13 downto 7);
    -- velo2       <= velocities(20 downto 14);
    -- velo3       <= velocities(27 downto 21);
    
    -- pitch_tg0   <= pitches(6 downto 0);
    -- pitch_tg1   <= pitches(13 downto 7);
    -- pitch_tg2   <= pitches(20 downto 14);

end architecture behavioural;

