library IEEE;
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
    type distributor_state_type is (reset_state, note_off_state, note_on_state);
    signal distributor_state, new_distributor_state : distributor_state_type;

    begin
        process(clk, reset)
        begin
            if rising_edge(clk) then
                if (reset='1') then
                    distributor_state <= reset_state;

                else
                    distributor_state <= new_distributor_state;
                end if;
            end if;
        end process;

        process(distributor_state, SD_in, clk)
        begin
            case distributor_state is
                when reset_state =>
                    pitch_TG0 <= (others=>'0');
                    pitch_TG1 <= (others=>'0');
                    pitch_TG2 <= (others=>'0');
                    note_on <= (others => '0');
                    velo0 <= (others => '0');
                    velo1 <= (others => '0');
                    velo2 <= (others => '0');
                    velo3 <= (others => '0');
                    if (SD_in(6 downto 4) = "000") then
                        new_distributor_state <= note_off_state;
                    elsif (SD_in(6 downto 4) = "001") then
                        new_distributor_state <= note_on_state;
                    else
                        new_distributor_state <= reset_state;
                    end if;
                when note_on_state =>
                    --- hier moet een bepaalde pitch range naar een bepaalde tone generator, die verdeling moet nog gemaakt worden
                    -- aan de hand van welke range van keys naar welke tone generator moet, weten we ook welke output module daarvoor gebruikt moet worden

