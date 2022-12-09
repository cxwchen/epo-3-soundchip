library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structural of pwm_math is

	component channel_op is
		port(amp    : in  std_logic_vector(5 downto 0);
        		     vel    : in  std_logic_vector(6 downto 0);
                     CH_Out : out std_logic_vector(7 downto 0));
	end component;

	component channel_adder is
		port(in1  : in  std_logic_vector(7 downto 0);
        		     in2  : in  std_logic_vector(7 downto 0);
        		     in3  : in  std_logic_vector(7 downto 0);
        		     in4  : in  std_logic_vector(7 downto 0);
        		     out1 : out std_logic_vector(7 downto 0));
	end component;

	signal CH1_op, CH2_op, CH3_op, CH4_op : std_logic_vector(7 downto 0);

begin

	CH1: channel_op port map (amp => CH1_amp,
				  vel => CH1_vel,
				  CH_Out => CH1_op);
	CH2: channel_op port map (amp => CH2_amp,
				  vel => CH2_vel,
				  CH_Out => CH2_op);
	CH3: channel_op port map (amp => CH3_amp,
				  vel => CH3_vel,
				  CH_Out => CH3_op);
	CH4: channel_op port map (amp => CH4_amp,
				  vel => CH4_vel,
				  CH_Out => CH4_op);
	SUM: channel_adder port map (in1 => CH1_op,
				     in2 => CH2_op,
				     in3 => CH3_op,
				     in4 => CH4_op,
				     out1 => Math_Out);

end structural;

