library IEEE;
use IEEE.std_logic_1164.ALL;

entity distributor is
   port(clk       : in  std_logic;
        reset     : in  std_logic;
	loc_reset : in std_logic;
        sd_in     : in  std_logic_vector(23 downto 0);
        reg_ready : in  std_logic_vector(2 downto 0);
        note_on   : out std_logic_vector(3 downto 0);
        velo0     : out std_logic_vector(6 downto 0);
        velo1     : out std_logic_vector(6 downto 0);
        velo2     : out std_logic_vector(6 downto 0);
        velo3     : out std_logic_vector(6 downto 0);
        pitch_tg0 : out std_logic_vector(6 downto 0);
        pitch_tg1 : out std_logic_vector(6 downto 0);
        pitch_tg2 : out std_logic_vector(6 downto 0));
end distributor;


