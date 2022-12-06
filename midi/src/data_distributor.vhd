library library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity distributor is
    port (
        clk, reset          : in std_logic;
        SD_in               : in std_logic_vector(23 downto 0);
        pitch_TG0           : out std_logic_vector(6 downto 0);
        pitch_TG1           : out std_logic_vector(6 downto 0);
        pitch_TG2           : out std_logic_vector(6 downto 0);
        note_on             : out std_logic_vector(3 downto 0);
        velo0               : out std_logic_vector(6 downto 0);
        velo1               : out std_logic_vector(6 downto 0);
        velo2               : out std_logic_vector(6 downto 0);
        velo3               : out std_logic_vector(6 downto 0)
    );
end entity distributor;

architecture behavioural of distributor is
