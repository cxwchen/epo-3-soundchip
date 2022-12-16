library IEEE;
use IEEE.std_logic_1164.ALL;

entity counter_tb is
end counter_tb;

architecture structural of counter_tb is
    component counter 
        port (
            clk : in std_logic;
            reset : in std_logic;
            count_out : out std_logic_vector(9 downto 0)
        );
    end component;
    signal clk      : std_logic;
    signal reset    : std_logic;
    signal count_out    : std_logic_vector(9 downto 0);
begin
    test: counter port map (clk, reset, count_out);
    clk <=  '1' after 0 ns,
            '0' after 10 ns when clk /= '0' else '1' after 10 ns;
    reset <= '1' after 0 ns,
            '0' after 21 ns,
            '1' after 140 ns,
            '0' after 161 ns;
end structural;
