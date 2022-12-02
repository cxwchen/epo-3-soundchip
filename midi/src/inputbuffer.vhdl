library library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Inputbuffer describes a buffer consisting of two serial D-flipflops
entity inputbuffer is
    port (
        clk, d      : in std_logic;
        q           : out std_logic;
    );
end entity inputbuffer;

architecture structural of inputbuffer is
    
    component flipflop is
        port(
            clk, d      : in std_logic;
            q           : in std_logic;
        );
    end component flipflop;
    
    -- interconnect signal
    signal f1f2    : std_logic;

begin

    f1: flipflop
        port map (
            clk     => clk,
            d       => d,
            q       => f1f2
        );

    f2: flipflop
        port map (
            clk     => clk,
            d       => f1f2,
            q       => q
        );
    
end architecture structural;
