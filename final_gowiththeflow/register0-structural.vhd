library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture structural of register0 is
    
 	component byte_register is
   		port(clk    : in  std_logic;
        			d      : in  std_logic;
        			enable : in  std_logic;
        			reset  : in  std_logic;
			loc_reset : in std_logic;
        			q      : out std_logic_vector(7 downto 0);
        			ready  : out std_logic);
	end component;

    -- signal q_stat, q_data1, q_data2     : unsigned (7 downto 0);

begin
    -- Status Byte Register
	reg_status: byte_register
        		port map(
            			clk         => clk,
            			reset       => reset,
            			loc_reset   => loc_reset,
            			enable      => enable(0),
            			ready       => ready(0),
            			d           => d,
            			q           => q(7 downto 0)
        			);

    -- First Data Byte Register
    	reg_data1: byte_register
        		port map(
            			clk         => clk,
            			reset       => reset,
            			loc_reset   => loc_reset,
            			enable      => enable(1),
            			ready       => ready(1),
            			d           => d,
            			q           => q(15 downto 8)
        			);
    
    -- Second Data Byte Register
    	reg_data2:  byte_register
        		port map(
            		clk         => clk,
            		reset       => reset,
            		loc_reset   => loc_reset,
            		enable      => enable(2),
            		ready       => ready(2),
            		d           => d,
            		q           => q(23 downto 16)
        		);

end architecture structural;

