library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behavioralimp3 of partial_mult is

	signal A1S_Out : std_logic_vector(5 downto 0);
	signal S_Out : std_logic_vector(11 downto 0);

	component adder5x4
		port(	amp    : in  std_logic_vector(5 downto 0);
        			A1S_Out: out std_logic_vector(5 downto 0));
	end component;

	component vel_shifter
		port(	A1S_Out: in  std_logic_vector(5 downto 0);
			amp    : in  std_logic_vector(5 downto 0);
        			vel    : in  std_logic_vector(6 downto 0);
        			S_Out  : out std_logic_vector(11 downto 0));
	end component;	

begin

	APM: adder5x4 port map(	amp => amp,
				A1S_Out => A1S_Out);
	SPM: vel_shifter port map(				amp => amp,
					vel => vel,
					S_Out => S_Out,
					A1S_Out => A1S_Out);

	OPM: M_Out <= S_Out;
	

end behavioralimp3;

