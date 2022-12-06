library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fsm is
    port (
        clk, reset  : in std_logic;
        count       : in std_logic_vector(9 downto 0);
        ready       : in std_logic;
        Din         : in std_logic;
        count_reset : out std_logic;
        enable      : out std_logic
    );
end entity fsm;

architecture behavioural of fsm is
    type fsm_state_type is (idle, start, read_state, write_state, final_read, final_write);
    signal fsm_state, new_fsm_state : fsm_state_type;

begin

    process(clk, reset)
    begin
        if rising_edge(clk) then
            if (reset = '1') then
                fsm_state <= idle;
            else 
                fsm_state <= new_fsm_state;
            end if;
        end if;
    end process;

    process(fsm_state, count, ready, Din)
    begin            
        case fsm_state is
            when idle =>
                enable <= '0';
                count_reset <= '0';
                if (Din = '1') then
                    new_fsm_state <= idle;

                elsif (Din = '0') then
                    new_fsm_state <= start;
                end if;

            when start =>
                enable <= '0';
                count_reset <= '0';
                if (unsigned(count)>=to_unsigned(400,10)) then
                    new_fsm_state <= read_state;
                else
                    new_fsm_state <= start;
                end if;

            when read_state =>   
                enable <= '0';
                count_reset <= '1';
                if (unsigned(count)>=(to_unsigned(800, 10))) then
                    new_fsm_state <= write_state;
                end if;

            when write_state =>
                enable <= '1';
                count_reset <= '1';
                if (ready = '1') then
                    new_fsm_state <= final_read;
                else 
                    new_fsm_state <= read_state;
                end if;

            when final_read =>
                enable <= '0';
                count_reset <= '1';
                if (unsigned(count)>=(to_unsigned(800, 10))) then
                    new_fsm_state <= final_write;
                end if;
            
            when final_write =>
                enable <= '1';
                count_reset <= '1';
                new_fsm_state <= idle;                
        end case;
    end process;
end architecture behavioural;
