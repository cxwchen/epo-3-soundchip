library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity flipflop_tb is
end entity flipflop_tb;

architecture beh of flipflop_tb is
    
    component flipflop is
        port (
            clk, d  : in std_logic;
            q       : out std_logic
        );
    end component flipflop;

    signal  clk, d, q   : std_logic;

begin

    lbl1: flipflop
    port map (
        clk     => clk,
        d       => d,
        q       => q
    );
    
    clk     <=  '0' after 0 ns,
                '1' after 20 ns when clk /= '1' else '0' after 20 ns;
    
    d       <=  '0' after 0 ns,
                '1' after 50 ns,
                '0' after 140 ns,
                '1' after 250 ns;

end architecture beh;