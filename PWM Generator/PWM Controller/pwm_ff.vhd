library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity pwm_ff is
   port(clk, reset : in  std_logic;
				ff_in : in std_logic_vector(7 downto 0);
				ff_out : out std_logic_vector(7 downto 0));
end pwm_ff;

architecture behaviour of pwm_ff is

  component pwm_clk
    port(clk, reset : in  std_logic;
         pwm_clk_out : out std_logic;
         pwm_clk_cnt : out std_logic_vector(7 downto 0));
  end component;

	signal s_pwm_high : std_logic;
	signal s_cnt : std_logic_vector(7 downto 0);

begin

  pe: pwm_clk port map(clk => clk, reset => reset, pwm_clk_out => s_pwm_high, pwm_clk_cnt => s_cnt);

	process(clk)
	begin

		if(clk'event and clk = '1') then

			if(reset = '1') then

				ff_out <= std_logic_vector(to_unsigned(0, 8));

			else
-- a register of with two flip flops will be used, therefore the flip flop needs to be able to shift when count = 1 also, besides count = 0.
				if(s_pwm_high = '1' and to_integer(unsigned(s_cnt)) < 2) then

					ff_out <= ff_in;
					
				else

					null;

				end if;

			end if;

		else

			null;

		end if;

	end process;

end behaviour;

