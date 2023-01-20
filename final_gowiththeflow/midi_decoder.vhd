library IEEE;
use IEEE.std_logic_1164.ALL;

entity midi_decoder is
   port(clk     : in  std_logic;
        reset   : in  std_logic;
        d       : in  std_logic;
        note_on : out std_logic_vector(3 downto 0);
        tg_0    : out std_logic_vector(6 downto 0);
        tg_1    : out std_logic_vector(6 downto 0);
        tg_2    : out std_logic_vector(6 downto 0);
        vel_0   : out std_logic_vector(6 downto 0);
        vel_1   : out std_logic_vector(6 downto 0);
        vel_2   : out std_logic_vector(6 downto 0);
        vel_3   : out std_logic_vector(6 downto 0));
end midi_decoder;

