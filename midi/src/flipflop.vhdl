library library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity flipflop is
    port (
        clk, d     : in std_logic;
        q          : out std_logic;
    );
end entity flipflop;

architecture structural of flipflop is

begin
    process(clk)
    begin
        if rising_edge(clk) then
            d <= q;
        end if;
    end process;
    
end architecture structural;
