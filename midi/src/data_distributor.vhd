library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity distributor is
    port (
        clk, reset          : in std_logic;
        sd_in               : in std_logic_vector(23 downto 0); --- input received from the register (connected to q)
        pitch_tg0           : out std_logic_vector(6 downto 0);
        pitch_tg1           : out std_logic_vector(6 downto 0);
        pitch_tg2           : out std_logic_vector(6 downto 0);
        note_on             : out std_logic_vector(3 downto 0);
        velo0               : out std_logic_vector(6 downto 0);
        velo1               : out std_logic_vector(6 downto 0);
        velo2               : out std_logic_vector(6 downto 0);
        velo3               : out std_logic_vector(6 downto 0)
    );
end entity distributor;

architecture behavioural of distributor is
begin
    process(sd_in, clk)
    begin
        if (sd_in(6 downto 4) = "000") or (sd_in(6 downto 4) = "001") then --- note off or note on message
            if (unsigned(sd_in(15 downto 8)) <= to_unsigned(.....)) and (unsigned(sd_in(15 downto 8)) >= to_unsigned(....)) then --- low: if the pitch is between a certain range (has not been decided yet) the tone generator responsible for that pitch needs to receive the note number (data byte 1) and the corresponding output module needs to receive the velocity (data byte 2)
                pitch_tg0 <= sd_in(15 downto 8);
                velo0 <= sd_in(23 downto 16);
            elsif (unsigned(sd_in(15 downto 8)) <= to_unsigned(.....)) and (unsigned(sd_in(15 downto 8)) >= to_unsigned(.....)) then --- mid: different range, see above for an explanation
                pitch_tg1 <= sd_in(15 downto 8);
                velo1 <= sd_in(23 downto 16);
            elsif (unsigned(sd_in(15 downto 8)) <= to_unsigned(....)) and (unsigned(sd_in(15 downto 9)) >= to_unsigned(....)) then --- high: different range, see above for an explanation
                pitch_tg2 <= sd_in(15 downto 8);
                velo2 <= sd_in(23 downto 16);
            else -- the note number is outside of the ranges described above so it will be considered noise
                --- hier weet ik niet precies wat ik moet doen voor de tone generator, want het note_on signaal wordt daarvoor gebruikt
                velo3 <= sd_in(23 downto 16);
            end if;
        else --- a status message we ignore 
            pitch_tg0 <= (others=>'0');
            pitch_tg1 <= (others=>'0');
            pitch_tg2 <= (others=>'0');
            note_on <= (others=>'0');
            velo0 <= (others=>'0');
            velo1 <= (others=>'0');
            velo2 <= (others=>'0');
            velo3 <= (others=>'0');
        end if;
    end process;
end architecture behavioural;

