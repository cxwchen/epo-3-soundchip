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

begin

    q(7 downto 0)   => q_stat;
    q(15 downto 8)  => q_data1;
    q(23 downto 16) => q_data2;

    reg_status: byte_register
        port map(
            clk     => clk,
            d       => d,
            q       => q_stat,
            ready   => ready(0)
        );

    reg_data1: byte_register
        port map(
            clk     => clk,
            d       => d,
            q       => q_data1,
            ready   => ready(1)
        );
    
    reg_data2:  byte_register
        port map(
            clk     => clk,
            d       => d,
            q       => q_data2,
            ready   => ready(2)
        );
    
    
end architecture structural;