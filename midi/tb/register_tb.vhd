library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity register_tb is
end entity register_tb;

architecture behavioural of register_tb is

    component reg is
        port (
            clk, reset, loc_reset, d        : in std_logic;
            enable                          : in std_logic_vector(2 downto 0);
            q                               : out std_logic_vector(23 downto 0);
            ready                           : out std_logic_vector(2 downto 0)
        );
    end component;

    signal clk, reset, input    : std_logic;
    signal output               : std_logic_vector(23 downto 0);
    signal rdy, enable          : std_logic_vector(2 downto 0);

begin

    r: reg
        port map (
            -- In
            clk         => clk,
            reset       => reset,
            loc_reset   => reset,
            d           => input,
            enable      => enable,
            -- Out
            q           => output,
            ready       => rdy
        );

    -- Load 24 bits into the register, AKA one full message
    -- Which byte register is enabled is tested manually as proper functionality is dependent on FSM
    -- For testing purposes, a very simple non-realistic signal is going to be deserialized.

    clk         <=  '0' after 0 ns,
 		    '1' after 10 ns when clk /= '1' else '0' after 10 ns;

    
    reset       <=  '1' after 0 ns,
                    '0' after 10 ns,    -- Should turn back to 1 after 24 bits have been loaded.
                    '1' after 720 ns;

    -- 24-bit signal to load: 1111 1111 0000 0011 0011 1110
    -- Sampling occurs on "odd" increments t=10, t=30 ... etc.
    -- Switch D on "even" points in time.
    -- D = 1 until t = 160ns
    -- D = 0 until t = 300ns
    -- D = 1 until t = 340ns
    -- D = 0 until t = 380ns
    -- D = 1 until t = 480ns
    -- Then, D = 0 ad inf.
    input       <=  '1' after 0 ns,
                    '0' after 160 ns,
                    '1' after 300 ns,
                    '0' after 340 ns,
                    '1' after 380 ns,
                    '0' after 480 ns;
    
    enable(0)   <=  '0' after 0 ns,		
                    '1' after 9 ns,
                    '0' after 29 ns,
                    '1' after 49 ns,
                    '0' after 69 ns,
                    '1' after 89 ns,
                    '0' after 109 ns,
                    '1' after 129 ns,
                    '0' after 149 ns,
                    '1' after 169 ns,
                    '0' after 189 ns,
                    '0' after 209 ns,
                    '1' after 229 ns,
                    '0' after 249 ns,
                    '1' after 269 ns,
                    '0' after 289 ns;
    enable(1)   <=  '0' after 0 ns,	--super efficient maar het werkt
                    '1' after 329 ns,
                    '0' after 349 ns,
                    '1' after 369 ns,
                    '0' after 389 ns,
                    '1' after 409 ns,
                    '0' after 429 ns,
                    '1' after 449 ns,
                    '0' after 469 ns,
                    '1' after 489 ns,
                    '0' after 509 ns,
                    '1' after 529 ns,
                    '0' after 549 ns;
    enable(2)   <=  '0' after 0 ns,
                    '1' after 569 ns,
                    '0' after 589 ns,
                    '1' after 609 ns,
                    '0' after 629 ns,
                    '1' after 649 ns,
                    '0' after 669 ns,
                    '1' after 689 ns,
                    '0' after 709 ns;
                    

end behavioural ; -- behavioural