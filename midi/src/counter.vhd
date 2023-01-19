library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- MIDI Baud rate: 31250bps; 25MHz/31250 = 800
entity counter is
    port (
        clk, reset, loc_reset   : in std_logic;
        count_out               : out std_logic_vector(9 downto 0)
    );
end entity counter;

architecture structural of counter is
    
    signal count, new_count     : unsigned(9 downto 0);

begin
    timebase : process(clk, reset)
	begin
        if (rising_edge(clk)) then
            if ( reset = '1' or loc_reset = '1' ) then
                count <= (others => '0');
            else
                count <= new_count;
            end if;
        end if;
    end process ; -- timebase

    increment : process(count)
    begin
        new_count <= count + 1;
    end process ; -- increment
    
    process(count)
    begin
        count_out <= std_logic_vector(count);
    end process;
end architecture structural;
