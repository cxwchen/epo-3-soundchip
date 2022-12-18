library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity byte_register_tb is
end entity byte_register_tb;

architecture structural of byte_register_tb is

    component byte_register is
        port (
            clk, d, enable, reset, loc_reset            : in std_logic;
            q                                           : out std_logic_vector(7 downto 0);
            ready                                       : out std_logic
        );
    end component byte_register;

    signal clk, input, enable, reset, rdy, loc_reset    : std_logic;
    signal output                                       : std_logic_vector(7 downto 0);

begin
    
    b_r: byte_register
        port map (  
            clk         => clk,
            reset       => reset,
            loc_reset   => loc_reset,
            d           => input,
            enable      => enable,
            q           => output,
            ready       => rdy
        );
    
    clk         <=  '0' after 0 ns,
                    '1' after 10 ns when clk /= '1' else '0' after 10 ns;

    -- Test random input.
    enable      <=  '0' after 0 ns,
                    '1' after 20 ns when enable /= '1' else '0' after 20 ns;
   
    input       <=  '1' after 0 ns,
                    '0' after 30 ns,
                    '1' after 100 ns;

    reset       <=  '1' after 0 ns,
                    '0' after 20 ns;

    loc_reset   <=  '1' after 0 ns,
		            '0' after 20 ns,
                    '1' after 300 ns;
    
end architecture structural;