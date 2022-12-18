library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity byte_register is
    port (
        clk, d, enable, reset, loc_reset            : in std_logic;
        q                                           : out std_logic_vector(7 downto 0);
        ready                                       : out std_logic
        );
end entity byte_register;

architecture structural of byte_register is
    signal shift_amount : std_logic_vector(2 downto 0);
    signal s            : std_logic_vector(7 downto 0); -- Local storage signal

begin
    beh : process( clk, reset, loc_reset )
    begin
        if (reset = '1' or loc_reset = '1') then
            s               <= (others => '0');
            ready           <= '0';
            shift_amount    <= (others => '0');
        elsif (clk'event and clk = '1') then
            if (enable = '1') then
                s(0)            <= d;
                s(7 downto 1)   <= s(6 downto 0);
                shift_amount    <= std_logic_vector(unsigned(shift_amount) + 1);
            end if ;
            
            -- Set ready output signal to high when the shift count reaches 8
            if (shift_amount = "111") then
                ready       <= '1';
            else
                ready       <= '0';
            end if;
        end if;
    end process ; -- Main behaviour

    q   <= s;
end architecture structural;
