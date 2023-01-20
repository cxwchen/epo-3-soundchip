library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


architecture structural of midi_decoder is
	component counter is
        		port (
            		clk, reset, loc_reset       : in std_logic;
            		count_out                   : out std_logic_vector(9 downto 0)
        		);
    	end component counter;
    
    	component fsm is
        		port (
            			clk, reset, din                 : in std_logic;
            			count                        : in std_logic_vector(9 downto 0);
            			ready                           : in std_logic_vector(2 downto 0);
            			count_reset, reg_reset          : out std_logic;
            			enable                          : out std_logic_vector(2 downto 0)
        			);
    	end component fsm;
    
    	component register0 is
        		port (
            			clk, reset, loc_reset, d			     : in std_logic;
            			enable                          : in std_logic_vector(2 downto 0);
            			q                           				: out std_logic_vector(23 downto 0);
            			ready                           : out std_logic_vector(2 downto 0)
        			);
    	end component register0;
    
    	component inputbuffer is
        		port (
            			clk, d      : in std_logic;
            			q           : out std_logic
        		);
    	end component inputbuffer;

    	component distributor is
        		port (
            			clk, reset, loc_reset                                               : in std_logic;
            			sd_in                                                               : in std_logic_vector(23 downto 0); -- Input received from the register (connected to q)
            			reg_ready                                                           : in std_logic_vector(2 downto 0);  -- Ready signals from register
            			note_on                                                             : out std_logic_vector(3 downto 0);
            			velo0, velo1, velo2, velo3, pitch_tg0, pitch_tg1, pitch_tg2         : out std_logic_vector(6 downto 0)
        );
    	end component distributor;

    	signal s_count                                  : std_logic_vector(9 downto 0);
    	signal s_reg_reset, s_count_reset, s_d_buf      : std_logic;
    	signal s_enable, s_reg_ready                    : std_logic_vector(2 downto 0);
    	signal s_data                                   : std_logic_vector(23 downto 0);

begin

    	pm_counter: counter
        		port map(
            			clk         => clk,
            			reset       => reset,
            			loc_reset   => s_count_reset,
            			count_out   => s_count
        			);
    
    	pm_fsm: fsm
        		port map(
            			clk         => clk,
            			reset       => reset,
            			din         => s_d_buf,
            			count    => s_count,
            			ready       => s_reg_ready,
            			count_reset => s_count_reset,
            			reg_reset   => s_reg_reset,
            			enable      => s_enable
        			);
    
    	pm_reg : register0
        		port map(
            			clk         		=> clk,
            			reset       		=> reset,
            			loc_reset   		=> s_reg_reset,
            			d	    	=> s_d_buf,
            			enable      		=> s_enable,
            			q		=> s_data,
            			ready       		=> s_reg_ready
        		);

    	pm_inputbuffer: inputbuffer
        		port map(
            			clk         => clk,
            			d           => d,
            			q           => s_d_buf
        		);

    	pm_distributor: distributor
        		port map(
            			clk         => clk,
            			reset       => reset,
            			loc_reset   => reset,
            			sd_in       => s_data,
            			reg_ready   => s_reg_ready,
            			note_on     => note_on,
            			velo0       => vel_0,
            			velo1       => vel_1,
            			velo2       => vel_2,
            			velo3       => vel_3,
            			pitch_tg0   => tg_0,
            			pitch_tg1   => tg_1,
            			pitch_tg2   => tg_2
        		);


end structural ; -- structural

