library library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity byte_register is
    port (
        clk, d, enable, clear       : in std_logic;
        q                           : out std_logic_vector(7 downto 0);
        );
end entity byte_register;

architecture structural of byte_register is
    
begin
    
    
    
end architecture structural;
