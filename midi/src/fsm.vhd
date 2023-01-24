library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fsm is
    port (
        clk, reset, Din                 : in std_logic;
        count                           : in std_logic_vector(9 downto 0);
        ready                           : in std_logic_vector(2 downto 0);
        count_reset, reg_reset          : out std_logic;
        enable                          : out std_logic_vector(2 downto 0)
    );
end entity fsm;

architecture behavioural of fsm is
    type fsm_state_type is (rest, idle, offset, r_offset, start, write_init_bit, init_status, init_data, read_status, read_data_1, read_data_2, write_status, write_data_1, write_data_2);

    signal fsm_state, new_fsm_state : fsm_state_type;

begin
    process(clk, reset)
    begin
        if (reset = '1') then
            fsm_state   <= rest;
        elsif rising_edge(clk) then
            fsm_state <= new_fsm_state;
        end if;
    end process;

    process(fsm_state, count, ready, Din)
    begin            
        case fsm_state is
            -- Rest state resets the whole register, is only ever active for one tick.
            when rest =>    
                enable          <= "000";
                count_reset     <= '1';
                reg_reset       <= '1';

                new_fsm_state   <= idle;
            -- Idle waits for input D_in to go to 0, then moves to offset.    
            when idle =>
                enable          <= "000";
                count_reset     <= '1';
                reg_reset       <= '0';

                if (Din = '0') then
                    new_fsm_state <= offset;
                else
                    new_fsm_state <= idle;
                end if;
            
            -- Offset counts to 400 (ticks) to offset the data sampling by half a period (T = 800 ticks).
            when offset =>
                enable          <= "000";
                count_reset     <= '0';
                reg_reset       <= '0';

                if (unsigned(count)>=to_unsigned(400,10)) then
                    new_fsm_state   <= r_offset;
                else
                    new_fsm_state   <= offset;
                end if;
            
            -- Reset the counter before going to start.
            when r_offset =>
                enable          <= "000";
                count_reset     <= '1';
                reg_reset       <= '0';

                new_fsm_state   <= start;

            -- Start counts to 800, next state is based off of which registers are ready.
            when start =>
                enable          <= "000";
                count_reset     <= '0';
                reg_reset       <= '0';

                if (unsigned(count)>=to_unsigned(800,10)) then
                    if (Din = '1') then
                        new_fsm_state   <= init_status;
                    else
                        if (ready(0) = '1') then
                            new_fsm_state   <= init_data;
                        else -- Ignore data byte if there is no status set
                            new_fsm_state   <= rest;
                    	end if;
		            end if;
                else
                    new_fsm_state   <= start;
                end if;
            
            -- Reset the counter and register before reading off the status.
            when init_status =>
                enable          <= "000";
                count_reset     <= '1';
                reg_reset       <= '1';

                new_fsm_state   <= write_init_bit;
            
            -- Writes the status bit to the register.
            when write_init_bit =>
                enable          <= "001";
                count_reset     <= '1';
                reg_reset       <= '0';

                new_fsm_state   <= read_status;

            -- Read_Status is part of a Read/Write loop that should occur 8 times total.
            when read_status =>   
                enable          <= "000";
                count_reset     <= '0';
                reg_reset       <= '0';

                if (unsigned(count)>=(to_unsigned(800, 10))) then
                    if( ready(0) = '1' ) then
                        new_fsm_state <= idle;
                    else
                        new_fsm_state <= write_status;
                    end if;
                else
                    new_fsm_state <= read_status;
                end if;
            
            -- Write_Status is part of a Read/Write loop, it loads a bit into the register for one tick. 
            -- If the dedicated register states it is "ready", write_status leads back to Idle.
            when write_status =>
                enable          <= "001";
                count_reset     <= '1';
                reg_reset       <= '0';

                new_fsm_state <= read_status;
            
            when init_data =>
                enable          <= "000";
                count_reset     <= '1';
                reg_reset       <= '0';

                if (ready = "001") then
                    new_fsm_state   <= write_data_1;
                elsif(ready = "011") then
                    new_fsm_state   <= write_data_2;
                else -- Error
                    new_fsm_state   <= rest;
                end if;

            -- Read_Data_1 is part of a Read/Write loop that should occur 8 times total.
            when read_data_1 =>   
                enable          <= "000";
                count_reset     <= '0';
                reg_reset       <= '0';

                if (unsigned(count)>=(to_unsigned(800, 10))) then
                    if( ready(1) = '1' ) then
                        new_fsm_state <= idle;
                    else
                        new_fsm_state <= write_data_1;
                    end if;
                else
                    new_fsm_state <= read_data_1;
                end if;
            
            -- Write_Data_1 is part of a Read/Write loop, it loads a bit into the register for one tick. 
            -- If the dedicated register states it is "ready", write_daa_1 leads back to Idle.
            when write_data_1 =>
                enable          <= "010";
                count_reset     <= '1';
                reg_reset       <= '0';

                new_fsm_state <= read_data_1;

            -- Read_Data_2 is part of a Read/Write loop that should occur 8 times total.
            when read_data_2 =>   
                enable          <= "000";
                count_reset     <= '0';
                reg_reset       <= '0';

                if (unsigned(count)>=(to_unsigned(800, 10))) then
                    if( ready(2) = '1' ) then
                        new_fsm_state <= idle;
                    else
                        new_fsm_state <= write_data_2;
                    end if;
                else
                    new_fsm_state <= read_data_2;
                end if;
        
            -- Write_Data_2 is part of a Read/Write loop, it loads a bit into the register for one tick. 
            -- If the dedicated register states it is "ready", write_data_2 leads back to Idle.
            when write_data_2 =>
                enable          <= "100";
                count_reset     <= '1';
                reg_reset       <= '0';
                
                new_fsm_state   <= read_data_2;
        end case;
    end process;
end architecture behavioural;
