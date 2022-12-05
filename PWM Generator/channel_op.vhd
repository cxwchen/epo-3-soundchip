library IEEE;
use IEEE.std_logic_1164.ALL;

entity channel_op is
   port(amp    : in  std_logic_vector(5 downto 0);
        vel    : in  std_logic_vector(6 downto 0);
        CH_Out : out std_logic_vector(6 downto 0));
end channel_op;

