library IEEE;
use IEEE.std_logic_1164.ALL;

entity pwm_reg is
   port(clk, reset : in  std_logic;
				duty_in : in std_logic_vector(7 downto 0);
				duty_out : out std_logic_vector(7 downto 0));
end pwm_reg;

architecture behaviour of pwm_reg is

	component pwm_ff
		port(clk, reset : in  std_logic;
				 ff_in : in std_logic_vector(7 downto 0);
				 ff_out : out std_logic_vector(7 downto 0));
	end component;

signal s_middle : std_logic_vector(7 downto 0);

begin

ff0: pwm_ff port map (clk => clk, reset => reset, ff_in => duty_in, ff_out => s_middle);
ff1: pwm_ff port map (clk => clk, reset => reset, ff_in => s_middle, ff_out => duty_out);

end behaviour;
