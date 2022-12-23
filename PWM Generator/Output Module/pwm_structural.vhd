library IEEE;
use IEEE.std_logic_1164.ALL;

entity pwm_structural is
   port(clk, reset : in  std_logic;
				duty : in std_logic_vector(7 downto 0);
				pout : out std_logic);
end pwm_structural;

architecture structural of pwm_structural is

-- component of register
component pwm_reg
	port(clk, reset : in  std_logic;
			 duty_in : in std_logic_vector(7 downto 0);
			 duty_out : out std_logic_vector(7 downto 0));
end component;

-- component of output
component pwm_output
	port(clk, reset : in  std_logic;
			 duty_cnt : in std_logic_vector(7 downto 0);
			 pwm_out : out std_logic);
end component;

-- component of clock + counter already in respective components used in this structural description

signal reg_out : std_logic_vector(7 downto 0);

begin

rg: pwm_reg port map(clk => clk, reset => reset, duty_in => duty, duty_out => reg_out);

ot: pwm_output port map(clk => clk, reset => reset, duty_cnt => reg_out, pwm_out => pout);

end structural;
