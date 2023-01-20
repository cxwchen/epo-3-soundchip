library IEEE;
use IEEE.std_logic_1164.ALL;

entity fsm is
   port(clk         : in  std_logic;
        reset       : in  std_logic;
        count    : in  std_logic_vector(9 downto 0);
        ready       : in  std_logic_vector(2 downto 0);
        din         : in  std_logic;
        count_reset : out std_logic;
	reg_reset	  : out std_logic;
        enable      : out std_logic_vector(2 downto 0));
end fsm;

