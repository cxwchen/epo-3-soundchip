library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity pwm_clk is
   port(clk, reset : in  std_logic;
				pwm_clk_out : out std_logic;
				pwm_clk_cnt : out std_logic_vector(7 downto 0));
end pwm_clk;

architecture behaviour of pwm_clk is

  signal counter : std_logic_vector(7 downto 0);

begin

	pwm_clk_cnt <= counter;

  process(clk)
  begin
    if(clk'event and clk = '1') then
      if(reset = '1' or to_integer(unsigned(counter)) > 189) then
        
     	counter <= "00000000";
			
      else
        
        counter <= std_logic_vector(unsigned(counter) + 1); --adds 1 to the counter

        if(to_integer(unsigned(counter)) < 95) then

          pwm_clk_out <= '1';
          
        else

          pwm_clk_out <= '0';
          
        end if;
        
      end if;
      
    end if;
    
  end process;

end behaviour;
