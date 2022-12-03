library library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity register is
    port (
        clk, d, enable, clear           : in std_logic;
        q                               : out std_logic_vector(23 downto 0);
        ready                           : out std_logic_vector(2 downto 0);
    );

end entity register;

architecture structural of register is
    
    component byte_register is
        port (
            clk, d, enable, clear       : in std_logic;
            q                           : out std_logic_vector(7 downto 0);
            ready                       : out std_logic;
        );
    end component byte_register;

    signal q_stat, q_data1, q_data2     : unsigned (7 downto 0);
    signal en_s, en_d1, en_d2           : std_logic; -- Routed ENABLE signal for individual registers

begin

    -- Multiplexer-ish implementation. Basically routes the ENABLE signal to the correct shift-register based on which register has READY = 1.
    -- READY signal theoretically should never equal "010" but the possibility is accounted for just in case.
    en_s    <= enable and not ( ready(0) or ready(1) or ready(2) );     -- READY = "000"
    en_d1   <= enable and ready(0) and not ( ready(1) or ready(2) );    -- READY = "100"
    en_d2   <= enable and ready(1) and not ready(2);                    -- READY = "010 or 110"

    -- Status Byte Register
    reg_status: byte_register
        port map(
            enable  => en_s,
            clear   => clear,
            clk     => clk,
            d       => d,
            q       => q(7 downto 0),
            ready   => ready(0)
        );

    -- First Data Byte Register
    reg_data1: byte_register
        port map(
            enable  => en_d1,
            clear   => clear,
            clk     => clk,
            d       => d,
            q       => q(15 downto 8),
            ready   => ready(1)
        );
    
    -- Second Data Byte Register
    reg_data2:  byte_register
        port map(
            enable  => en_d2,
            clear   => clear,
            clk     => clk,
            d       => d,
            q       => q(23 downto 16),
            ready   => ready(2)
        );

end architecture structural;