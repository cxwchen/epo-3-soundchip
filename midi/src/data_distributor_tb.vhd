library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity distributor_tb is
end entity distributor_tb;

architecture structural of distributor_tb is
    component distributor is
        port (
            clk, reset                                                          : in std_logic;
            sd_in                                                               : in std_logic_vector(23 downto 0); -- Input received from the register (connected to q)
            reg_ready                                                           : in std_logic_vector(2 downto 0);  -- Ready signals from register
            note_on                                                             : out std_logic_vector(3 downto 0);
            velo0, velo1, velo2, velo3, pitch_tg0, pitch_tg1, pitch_tg2         : out std_logic_vector(6 downto 0)
            );
	end component;

	signal clk		: std_logic;
	signal reset		: std_logic;
	signal sd_in		: std_logic_vector(23 downto 0);
	signal reg_ready	: std_logic_vector(2 downto 0);
	signal note_on		: std_logic_vector(3 downto 0);
	signal velo0		: std_logic_vector(6 downto 0);
	signal velo1		: std_logic_vector(6 downto 0);
	signal velo2		: std_logic_vector(6 downto 0);
	signal velo3		: std_logic_vector(6 downto 0);
	signal pitch_tg0	: std_logic_vector(6 downto 0);
	signal pitch_tg1	: std_logic_vector(6 downto 0);
	signal pitch_tg2	: std_logic_vector(6 downto 0);

begin

	lbl_distributor : distributor port map ( clk => clk,
						reset => reset,
						sd_in => sd_in,
						reg_ready => reg_ready,
						note_on => note_on,
						velo0 => velo0,
						velo1 => velo1,
						velo2 => velo2,
						velo3 => velo3,
						pitch_tg0 => pitch_tg0,
						pitch_tg1 => pitch_tg1,
						pitch_tg2 => pitch_tg2);

	clk <= 	'0' after 0 ns,
		'1' after 10 ns when clk /= '1' else '0' after 10 ns;

	reset <= 	'1' after 0 ns,
			'0' after 10 ns,
			'1' after 600 ns;
	-- Geen rekening gehouden met andere onderdelen; anders zou reg_ready op andere momenten "111" worden
	reg_ready <= 	(others => '0') after 0 ns,
			"111" after 9 ns,
			(others => '0') after 210 ns,
			"111" after 250 ns;

	sd_in <= 	(others => '0') after 0 ns,
			"100100100100010101100100" after 10 ns, -- Note On, Note number: 69, Velocity: 100
			"100000100100010101100100" after 50 ns, -- Note Off, Note number: 69, Velocity: 100
			"100100000100010101100101" after 90 ns, -- Note On, Note number: 69, Velocity: 101
			"100100000010010001110100" after 120 ns, -- Note On, Note number: 36, Velocity: 116
			"100100000101100101011000" after 160 ns; -- Note On, Note number: 89, Velocity: 88


end structural;