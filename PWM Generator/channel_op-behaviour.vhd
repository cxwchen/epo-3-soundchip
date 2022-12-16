library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of channel_op is

component adder_7x7 is
	port(	in1  : in  std_logic_vector(6 downto 0);
        		in2  : in  std_logic_vector(6 downto 0);
        		out1 : out std_logic_vector(7 downto 0));
end component;

component input_sel is
   port(amp     : in  std_logic_vector(5 downto 0);
        A1_Out  : in  std_logic_vector(7 downto 0);
        vel     : in  std_logic_vector(6 downto 0);
        Sel_Out : out std_logic_vector(7 downto 0));
end component;

component var_shift is
   port(Sel_Out   : in  std_logic_vector(7 downto 0);
        vel       : in  std_logic_vector(6 downto 0);
        Shift_Out : out std_logic_vector(7 downto 0));
end component;

signal A1_Out, Sel_Out : std_logic_vector(7 downto 0);
signal Shift_Out : std_logic_vector(7 downto 0);

begin

	Add: adder_7x7 port map(	in1 => "0" & amp, 	--maps in1 to amp (concatenated to 0 for scaling reasons)
								in2 => amp & "0", 	--maps in2 to amp*2
								out1 => A1_Out);	

	Sel: input_sel port map(	amp => amp,			--maps the input adder to the input of the input selector
								A1_Out => A1_Out,
								vel => vel,
								Sel_Out => Sel_Out);

	Shift: var_shift port map(	Sel_Out => Sel_Out,	--maps the input selector to the input of the variable shifter
								vel => vel,
								Shift_Out => CH_Out);
				



end behaviour;

