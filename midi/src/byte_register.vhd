library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity byte_register is
    port (
        clk, d, enable, reset, loc_reset            : in std_logic;
        q                                           : out std_logic_vector(7 downto 0);
        ready                                       : out std_logic
        );
end entity byte_register;

architecture structural of byte_register is
    signal htshift, ftshift : std_logic_vector(3 downto 0); -- Increment everytime new data is shifted into the register
    signal hts, fts            : std_logic_vector(7 downto 0); -- Local storage signal

begin
    beh : process(clk)
    begin
        if(rising_edge(clk)) then
            if (reset = '1' or loc_reset = '1') then
                hts               <= (others => '0');
                htshift    <= (others => '0');
            else
                hts <= fts;
                htshift <= ftshift;
            end if;
        end if;
    end process;

    process(hts, htshift, d, enable)
    begin
        if (enable = '1') then
            fts         <= hts(6 downto 0) & d;
            ftshift     <= std_logic_vector(unsigned(htshift) + 1);
        else
            fts        <= hts;
            ftshift    <= htshift;
        end if ;
            
            -- Set ready output signal to high when the shift count reaches 8
        if (htshift = "1000") then
            ready       <= '1';
        else
            ready       <= '0';
        end if;
    end process ; -- Main behaviour

    process(hts)
    begin
        q   <= hts;
    end process;
end architecture structural;
