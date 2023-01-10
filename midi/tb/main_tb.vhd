library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity main_tb is
end entity main_tb;

architecture behavioural of main_tb is

    signal clk, reset, d                : std_logic;
    signal tg_0, tg_1, tg_2             : std_logic_vector(6 downto 0);
    signal vel_0, vel_1, vel_2, vel_3   : std_logic_vector(6 downto 0);

    component midi_decoder is
        port (
        -- Inputs
        clk, reset, d               : in std_logic;

        -- Outputs
        note_on                     : out std_logic_vector(3 downto 0); -- Which notes should be on at any given moment in time
        tg_0, tg_1, tg_2            : out std_logic_vector(6 downto 0); -- Pitch per tone generator
        vel_0, vel_1, vel_2, vel_3  : out std_logic_vector(6 downto 0)  -- Velocity per note / tone generator
        );
        
    end component midi_decoder;

begin

    mn: midi_decoder
    port map (
        clk     => clk,
        reset   => reset,
        d       => d,
        tg_0    => tg_0,
        tg_1    => tg_1,
        tg_2    => tg_2,
        vel_0   => vel_0,
        vel_1   => vel_1,
        vel_2   => vel_2,
        vel_3   => vel_3
    );

    clk         <=  '0' after 0 ns,
                    '1' after 20 ns when clk /= '1' else '0' after 20 ns;
    
    reset       <=  '1' after 0 ns,
                    '0' after 21 ns;
    
    d           <=  '1' after 0 ns,
                    '0' after 32 us,
                    '1' after 64 us, -- Status initialised
                    '0' after 96 us,
                    '1' after 160 us,
                    '0' after 192 us,
                    '1' after 320 us,
                    '0' after 640 us, -- Start of Data1-bit
                    '1' after 800 us, 
                    '0' after 832 us,
                    '1' after 960 us,
                    '0' after 1100 us,
                    '1' after 1228 us,
                    '0' after 1260 us,
                    '1' after 1420 us;




end behavioural ; -- behavioural
