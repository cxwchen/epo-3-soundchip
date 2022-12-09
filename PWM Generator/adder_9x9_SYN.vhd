
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of adder_9x9 is

  component FA1D0BWP7T
    port(A, B, CI : in std_logic; CO, S : out std_logic);
  end component;

  component CKXOR2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component AN2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component BUFFD4BWP7T
    port(I : in std_logic; Z : out std_logic);
  end component;

  signal n_0, n_2, n_3, n_4, n_5 : std_logic;
  signal n_6, n_7, n_8, n_9, n_10 : std_logic;
  signal n_11, n_12, n_13, n_14, n_15 : std_logic;
  signal n_16, n_17 : std_logic;

begin

  g532 : FA1D0BWP7T port map(A => in2(8), B => in1(8), CI => n_14, CO => n_16, S => n_17);
  g533 : FA1D0BWP7T port map(A => in1(7), B => in2(7), CI => n_12, CO => n_14, S => n_15);
  g534 : FA1D0BWP7T port map(A => in1(6), B => in2(6), CI => n_10, CO => n_12, S => n_13);
  g535 : FA1D0BWP7T port map(A => in1(5), B => in2(5), CI => n_8, CO => n_10, S => n_11);
  g536 : FA1D0BWP7T port map(A => in1(4), B => in2(4), CI => n_6, CO => n_8, S => n_9);
  g537 : FA1D0BWP7T port map(A => in1(3), B => in2(3), CI => n_4, CO => n_6, S => n_7);
  g538 : FA1D0BWP7T port map(A => in1(2), B => in2(2), CI => n_2, CO => n_4, S => n_5);
  g539 : FA1D0BWP7T port map(A => in1(1), B => in2(1), CI => n_0, CO => n_2, S => n_3);
  g540 : CKXOR2D4BWP7T port map(A1 => in2(0), A2 => in1(0), Z => Out1(0));
  g541 : AN2D1BWP7T port map(A1 => in2(0), A2 => in1(0), Z => n_0);
  drc_bufs : BUFFD4BWP7T port map(I => n_17, Z => Out1(8));
  drc_bufs544 : BUFFD4BWP7T port map(I => n_9, Z => Out1(4));
  drc_bufs547 : BUFFD4BWP7T port map(I => n_3, Z => Out1(1));
  drc_bufs550 : BUFFD4BWP7T port map(I => n_15, Z => Out1(7));
  drc_bufs553 : BUFFD4BWP7T port map(I => n_13, Z => Out1(6));
  drc_bufs556 : BUFFD4BWP7T port map(I => n_11, Z => Out1(5));
  drc_bufs559 : BUFFD4BWP7T port map(I => n_5, Z => Out1(2));
  drc_bufs562 : BUFFD4BWP7T port map(I => n_7, Z => Out1(3));
  drc_bufs565 : BUFFD4BWP7T port map(I => n_16, Z => Out1(9));

end synthesised;
