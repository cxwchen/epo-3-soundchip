library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity reg is
    port (
        clk, d, clear           : in std_logic;
        enable                  : in std_logic_vector(2 downto 0);
        q                       : out std_logic_vector(23 downto 0);
        ready                   : out std_logic_vector(2 downto 0)
    );

end entity reg;

architecture structural of reg is
    
    component byte_register is
        port (
            clk, d, enable, clear       : in std_logic;
            q                           : out std_logic_vector(7 downto 0);
            ready                       : out std_logic
        );
    end component byte_register;

    signal q_stat, q_data1, q_data2     : unsigned (7 downto 0);

begin
    -- Status Byte Register
    reg_status: byte_register
        port map(
            enable  => enable(0),
            clear   => clear,
            clk     => clk,
            d       => d,
            q       => q(7 downto 0),
            ready   => ready(0)
        );

    -- First Data Byte Register
    reg_data1: byte_register
        port map(
            enable  => enable(1),
            clear   => clear,
            clk     => clk,
            d       => d,
            q       => q(15 downto 8),
            ready   => ready(1)
        );
    
    -- Second Data Byte Register
    reg_data2:  byte_register
        port map(
            enable  => enable(2),
            clear   => clear,
            clk     => clk,
            d       => d,
            q       => q(23 downto 16),
            ready   => ready(2)
        );

end architecture structural;