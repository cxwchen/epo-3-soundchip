library IEEE;
use IEEE.std_logic_1164.ALL;

entity inputbuffer_tb is
end entity inputbuffer_tb;

architecture structural of inputbuffer_tb is
    component inputbuffer
        port(
            clk : in std_logic;
            d : in std_logic;
            q : out std_logic
        );
    end component;
    signal clk : std_logic;
    signal d : std_logic;
    signal q : std_logic;
begin
    test : inputbuffer port map (   clk => clk,
                                    d => d,
                                    q => q);
    clk <= '0' after 0 ns,
            '1' after 10 ns when clk /= '1' else '0' after 10 ns;
    d <= '0' after 0 ns,
            '1' after 11 ns,
            '0' after 40 ns,
            '1' after 52 ns,
            '0' after 80 ns,
            '1' after 92 ns,
            '0' after 120 ns,
            '1' after 132 ns,
            '0' after 160 ns;
end structural;