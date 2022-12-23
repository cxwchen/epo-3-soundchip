library IEEE;
use IEEE.std_logic_1164.ALL;

entity out_module is
   port(CH1_amp : in  std_logic_vector(5 downto 0);
        CH1_vel : in  std_logic_vector(6 downto 0);
        CH2_amp : in  std_logic_vector(5 downto 0);
        CH2_vel : in  std_logic_vector(6 downto 0);
        CH3_amp : in  std_logic_vector(5 downto 0);
        CH3_vel : in  std_logic_vector(6 downto 0);
        CH4_amp : in  std_logic_vector(5 downto 0);
        CH4_vel : in  std_logic_vector(6 downto 0);
	clk     : in  std_logic;
	reset   : in  std_logic;
        PWM_Out   : out std_logic);
end out_module;

