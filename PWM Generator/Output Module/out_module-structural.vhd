library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structural of out_module is

component pwm_math is
	port(CH1_Amp  : in  std_logic_vector(5 downto 0);
        	    CH2_Amp  : in  std_logic_vector(5 downto 0);
             CH3_Amp  : in  std_logic_vector(5 downto 0);
             CH4_Amp  : in  std_logic_vector(5 downto 0);
             CH1_Vel  : in  std_logic_vector(6 downto 0);
             CH2_Vel  : in  std_logic_vector(6 downto 0);
             CH3_Vel  : in  std_logic_vector(6 downto 0);
             CH4_Vel  : in  std_logic_vector(6 downto 0);
             Math_Out : out std_logic_vector(7 downto 0));
end component;

component pwm_structural is
	port(clk, reset : in  std_logic;
	     duty : in std_logic_vector(7 downto 0);
	     pout : out std_logic);
end component;
	signal Math_Out : std_logic_vector(7 downto 0);
begin

	Math: pwm_math port map(
				CH1_Amp => CH1_amp,
				CH1_vel => CH1_vel,
				CH2_Amp => CH2_amp,
				CH2_vel => CH2_vel,
				CH3_Amp => CH3_amp,
				CH3_vel => CH3_vel,
				CH4_Amp => CH4_amp,
				CH4_vel => CH4_vel,
				Math_Out => Math_Out);
	PWM: pwm_structural port map(
				clk => clk,
				reset => reset,
				duty => Math_Out,
				pout => PWM_Out);

end structural;

