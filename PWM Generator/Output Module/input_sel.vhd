library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_unsigned.ALL;

entity input_sel is
   port(amp     : in  std_logic_vector(5 downto 0);
        A1_Out  : in  std_logic_vector(7 downto 0);
        vel     : in  std_logic_vector(6 downto 0);
        Sel_Out : out std_logic_vector(7 downto 0));
end input_sel;

