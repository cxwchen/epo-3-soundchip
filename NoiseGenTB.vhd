LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Testbench IS
END Testbench;

ARCHITECTURE TBarch OF Testbench IS
  COMPONENT noisegen IS
    PORT (clk, reset: IN std_logic;
          noise: OUT std_logic_vector (5 DOWNTO 0));
  END COMPONENT;

  SIGNAL clk_s, reset_s: std_logic;
  SIGNAL output_s: std_logic_vector(5 DOWNTO 0);

BEGIN
  CompToTest: noisegen PORT MAP (clk_s, reset_s, output_s);
   
  clk_proc: PROCESS
  BEGIN
    clk_s <= '1';
    WAIT FOR 10 ns;
    clk_s <= '0';
    WAIT FOR 10 ns;
  END PROCESS clk_proc;
                      
  Vector_proc: PROCESS
  BEGIN
    reset_s <= '1';
    WAIT FOR 5 NS;
    reset_s <= '0';
    FOR index IN 0 To 400 LOOP
      WAIT UNTIL clk_s='1' AND clk_s'EVENT;
    END LOOP;
  END PROCESS Vector_proc;

END TBarch;
