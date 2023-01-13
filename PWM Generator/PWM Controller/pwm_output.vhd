library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity pwm_output is
   port(clk, reset : in  std_logic;
				duty_cnt : in std_logic_vector(7 downto 0);
				pwm_out : out std_logic);
end pwm_output;

architecture behaviour of pwm_output is

  component pwm_clk
    port(clk, reset : in  std_logic;
         pwm_clk_out : out std_logic;
         pwm_clk_cnt : out std_logic_vector(7 downto 0));
  end component;
  
  signal s_counter : std_logic_vector(7 downto 0);
  signal s_enable : std_logic;

  type state_type is (state_reset, state_high);
  signal state_current, state_next : state_type; 

begin

  pc: pwm_clk port map(clk => clk, reset => reset, pwm_clk_out => s_enable, pwm_clk_cnt => s_counter);

  process(clk)
  begin

		if(clk'event and clk = '1') then

			if(reset = '1') then
				state_current <= state_reset;
			else
				state_current <= state_next;
			end if;

		else
			null;
		end if;

  end process; 

  process(state_current, duty_cnt, s_counter, s_enable) 
  begin

    case state_current is
      when state_reset =>

        pwm_out <= '0';
		
	if(to_integer(unsigned(s_counter)) = 0) then

		state_next <= state_high;

        else

          state_next <= state_reset;

        end if;
        
      when state_high => 

        pwm_out <= '1';

        if((to_integer(unsigned(s_counter)) > to_integer(unsigned(duty_cnt))) or (to_integer(unsigned(s_counter)) = 190)) then

          state_next <= state_reset;
        else

          state_next <= state_high;

        end if;
        
    end case;

  end process;

end behaviour;
