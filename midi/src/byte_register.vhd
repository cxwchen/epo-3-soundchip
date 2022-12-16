library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity byte_register is
    port (
        clk, d, enable, clear               : in std_logic;
        q                                   : out std_logic_vector(7 downto 0);
        ready                               : out std_logic
        );
end entity byte_register;

architecture structural of byte_register is

    signal new_ready    : std_logic;
    signal shift_amount : std_logic_vector(2 downto 0);
    signal s            : std_logic_vector(7 downto 0);

begin

    -- Insert data when enable is high
    insert : process( clk )
    begin
        if clear = '0' then
            if rising_edge(clk) then
                if enable = '1' then
                    s(0) <= d;
                end if ;
            end if ;
        else -- if clear = '1' then reset all parameters.
            s               <= x"00";
            shift_amount    <= "000";
            new_ready       <= '0';
            ready           <= '0';
            q               <= s;
        end if ;
    end process ; -- insert

    -- Shift register asynchronously everytime enable turns low to make room for next data bit
    shifting : process( enable )
    begin
        if enable = '0' then
            s               <= std_logic_vector(shift_right(unsigned(s), 1));
            shift_amount    <= std_logic_vector(unsigned(shift_amount) + 1);
            q               <= s;
        end if ;
    end process ; -- shift

    -- Turn "ready" signal high when shift register has LSB = 0
    readying : process( shift_amount )
    begin
        if shift_amount = "111" then
            new_ready <= '1';
        else
            ready <= new_ready;
        end if ;
    end process ; -- ready
    
end architecture structural;
