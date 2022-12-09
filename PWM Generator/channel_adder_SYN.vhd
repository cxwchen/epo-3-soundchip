
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of channel_adder is

  component FA1D0BWP7T
    port(A, B, CI : in std_logic; CO, S : out std_logic);
  end component;

  component MAOI222D0BWP7T
    port(A, B, C : in std_logic; ZN : out std_logic);
  end component;

  component CKND1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component HA1D0BWP7T
    port(A, B : in std_logic; CO, S : out std_logic);
  end component;

  component CKXOR2D0BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component OR2D0BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component BUFFD4BWP7T
    port(I : in std_logic; Z : out std_logic);
  end component;

  signal csa_tree_ADD_UNS_OP_pad_groupi_n_9, csa_tree_ADD_UNS_OP_pad_groupi_n_10, csa_tree_ADD_UNS_OP_pad_groupi_n_11, csa_tree_ADD_UNS_OP_pad_groupi_n_12, csa_tree_ADD_UNS_OP_pad_groupi_n_13 : std_logic;
  signal csa_tree_ADD_UNS_OP_pad_groupi_n_14, csa_tree_ADD_UNS_OP_pad_groupi_n_15, csa_tree_ADD_UNS_OP_pad_groupi_n_16, csa_tree_ADD_UNS_OP_pad_groupi_n_17, csa_tree_ADD_UNS_OP_pad_groupi_n_18 : std_logic;
  signal csa_tree_ADD_UNS_OP_pad_groupi_n_19, csa_tree_ADD_UNS_OP_pad_groupi_n_20, csa_tree_ADD_UNS_OP_pad_groupi_n_21, csa_tree_ADD_UNS_OP_pad_groupi_n_22, csa_tree_ADD_UNS_OP_pad_groupi_n_23 : std_logic;
  signal csa_tree_ADD_UNS_OP_pad_groupi_n_24, csa_tree_ADD_UNS_OP_pad_groupi_n_25, csa_tree_ADD_UNS_OP_pad_groupi_n_26, csa_tree_ADD_UNS_OP_pad_groupi_n_27, csa_tree_ADD_UNS_OP_pad_groupi_n_28 : std_logic;
  signal csa_tree_ADD_UNS_OP_pad_groupi_n_29, csa_tree_ADD_UNS_OP_pad_groupi_n_30, csa_tree_ADD_UNS_OP_pad_groupi_n_31, csa_tree_ADD_UNS_OP_pad_groupi_n_32, csa_tree_ADD_UNS_OP_pad_groupi_n_33 : std_logic;
  signal csa_tree_ADD_UNS_OP_pad_groupi_n_34, csa_tree_ADD_UNS_OP_pad_groupi_n_35, csa_tree_ADD_UNS_OP_pad_groupi_n_36, csa_tree_ADD_UNS_OP_pad_groupi_n_37, csa_tree_ADD_UNS_OP_pad_groupi_n_38 : std_logic;
  signal csa_tree_ADD_UNS_OP_pad_groupi_n_39, csa_tree_ADD_UNS_OP_pad_groupi_n_40, csa_tree_ADD_UNS_OP_pad_groupi_n_41, csa_tree_ADD_UNS_OP_pad_groupi_n_42, csa_tree_ADD_UNS_OP_pad_groupi_n_43 : std_logic;
  signal csa_tree_ADD_UNS_OP_pad_groupi_n_44, csa_tree_ADD_UNS_OP_pad_groupi_n_45, csa_tree_ADD_UNS_OP_pad_groupi_n_46, csa_tree_ADD_UNS_OP_pad_groupi_n_47, csa_tree_ADD_UNS_OP_pad_groupi_n_48 : std_logic;
  signal csa_tree_ADD_UNS_OP_pad_groupi_n_49, csa_tree_ADD_UNS_OP_pad_groupi_n_50, csa_tree_ADD_UNS_OP_pad_groupi_n_51, csa_tree_ADD_UNS_OP_pad_groupi_n_52, csa_tree_ADD_UNS_OP_pad_groupi_n_53 : std_logic;
  signal csa_tree_ADD_UNS_OP_pad_groupi_n_54, csa_tree_ADD_UNS_OP_pad_groupi_n_55 : std_logic;

begin

  csa_tree_ADD_UNS_OP_pad_groupi_g569 : FA1D0BWP7T port map(A => csa_tree_ADD_UNS_OP_pad_groupi_n_17, B => csa_tree_ADD_UNS_OP_pad_groupi_n_32, CI => csa_tree_ADD_UNS_OP_pad_groupi_n_52, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_54, S => csa_tree_ADD_UNS_OP_pad_groupi_n_55);
  csa_tree_ADD_UNS_OP_pad_groupi_g570 : FA1D0BWP7T port map(A => csa_tree_ADD_UNS_OP_pad_groupi_n_38, B => csa_tree_ADD_UNS_OP_pad_groupi_n_33, CI => csa_tree_ADD_UNS_OP_pad_groupi_n_50, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_52, S => csa_tree_ADD_UNS_OP_pad_groupi_n_53);
  csa_tree_ADD_UNS_OP_pad_groupi_g571 : FA1D0BWP7T port map(A => csa_tree_ADD_UNS_OP_pad_groupi_n_36, B => csa_tree_ADD_UNS_OP_pad_groupi_n_39, CI => csa_tree_ADD_UNS_OP_pad_groupi_n_48, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_50, S => csa_tree_ADD_UNS_OP_pad_groupi_n_51);
  csa_tree_ADD_UNS_OP_pad_groupi_g572 : FA1D0BWP7T port map(A => csa_tree_ADD_UNS_OP_pad_groupi_n_40, B => csa_tree_ADD_UNS_OP_pad_groupi_n_37, CI => csa_tree_ADD_UNS_OP_pad_groupi_n_46, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_48, S => csa_tree_ADD_UNS_OP_pad_groupi_n_49);
  csa_tree_ADD_UNS_OP_pad_groupi_g573 : FA1D0BWP7T port map(A => csa_tree_ADD_UNS_OP_pad_groupi_n_34, B => csa_tree_ADD_UNS_OP_pad_groupi_n_41, CI => csa_tree_ADD_UNS_OP_pad_groupi_n_44, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_46, S => csa_tree_ADD_UNS_OP_pad_groupi_n_47);
  csa_tree_ADD_UNS_OP_pad_groupi_g574 : FA1D0BWP7T port map(A => csa_tree_ADD_UNS_OP_pad_groupi_n_35, B => csa_tree_ADD_UNS_OP_pad_groupi_n_30, CI => csa_tree_ADD_UNS_OP_pad_groupi_n_42, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_44, S => csa_tree_ADD_UNS_OP_pad_groupi_n_45);
  csa_tree_ADD_UNS_OP_pad_groupi_g575 : FA1D0BWP7T port map(A => csa_tree_ADD_UNS_OP_pad_groupi_n_31, B => csa_tree_ADD_UNS_OP_pad_groupi_n_14, CI => csa_tree_ADD_UNS_OP_pad_groupi_n_29, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_42, S => csa_tree_ADD_UNS_OP_pad_groupi_n_43);
  csa_tree_ADD_UNS_OP_pad_groupi_g576 : FA1D0BWP7T port map(A => csa_tree_ADD_UNS_OP_pad_groupi_n_25, B => in1(4), CI => csa_tree_ADD_UNS_OP_pad_groupi_n_28, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_40, S => csa_tree_ADD_UNS_OP_pad_groupi_n_41);
  csa_tree_ADD_UNS_OP_pad_groupi_g577 : FA1D0BWP7T port map(A => csa_tree_ADD_UNS_OP_pad_groupi_n_19, B => in1(6), CI => csa_tree_ADD_UNS_OP_pad_groupi_n_24, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_38, S => csa_tree_ADD_UNS_OP_pad_groupi_n_39);
  csa_tree_ADD_UNS_OP_pad_groupi_g578 : FA1D0BWP7T port map(A => csa_tree_ADD_UNS_OP_pad_groupi_n_27, B => in1(5), CI => csa_tree_ADD_UNS_OP_pad_groupi_n_20, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_36, S => csa_tree_ADD_UNS_OP_pad_groupi_n_37);
  csa_tree_ADD_UNS_OP_pad_groupi_g579 : FA1D0BWP7T port map(A => csa_tree_ADD_UNS_OP_pad_groupi_n_21, B => in1(3), CI => csa_tree_ADD_UNS_OP_pad_groupi_n_26, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_34, S => csa_tree_ADD_UNS_OP_pad_groupi_n_35);
  csa_tree_ADD_UNS_OP_pad_groupi_g580 : FA1D0BWP7T port map(A => csa_tree_ADD_UNS_OP_pad_groupi_n_23, B => in1(7), CI => csa_tree_ADD_UNS_OP_pad_groupi_n_18, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_32, S => csa_tree_ADD_UNS_OP_pad_groupi_n_33);
  csa_tree_ADD_UNS_OP_pad_groupi_g581 : FA1D0BWP7T port map(A => csa_tree_ADD_UNS_OP_pad_groupi_n_9, B => in1(2), CI => csa_tree_ADD_UNS_OP_pad_groupi_n_22, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_30, S => csa_tree_ADD_UNS_OP_pad_groupi_n_31);
  csa_tree_ADD_UNS_OP_pad_groupi_g582 : MAOI222D0BWP7T port map(A => csa_tree_ADD_UNS_OP_pad_groupi_n_13, B => csa_tree_ADD_UNS_OP_pad_groupi_n_10, C => csa_tree_ADD_UNS_OP_pad_groupi_n_16, ZN => csa_tree_ADD_UNS_OP_pad_groupi_n_29);
  csa_tree_ADD_UNS_OP_pad_groupi_g583 : FA1D0BWP7T port map(A => in3(4), B => in4(4), CI => in2(4), CO => csa_tree_ADD_UNS_OP_pad_groupi_n_27, S => csa_tree_ADD_UNS_OP_pad_groupi_n_28);
  csa_tree_ADD_UNS_OP_pad_groupi_g584 : FA1D0BWP7T port map(A => in3(3), B => in4(3), CI => in2(3), CO => csa_tree_ADD_UNS_OP_pad_groupi_n_25, S => csa_tree_ADD_UNS_OP_pad_groupi_n_26);
  csa_tree_ADD_UNS_OP_pad_groupi_g585 : FA1D0BWP7T port map(A => in3(6), B => in4(6), CI => in2(6), CO => csa_tree_ADD_UNS_OP_pad_groupi_n_23, S => csa_tree_ADD_UNS_OP_pad_groupi_n_24);
  csa_tree_ADD_UNS_OP_pad_groupi_g586 : FA1D0BWP7T port map(A => in3(2), B => in4(2), CI => in2(2), CO => csa_tree_ADD_UNS_OP_pad_groupi_n_21, S => csa_tree_ADD_UNS_OP_pad_groupi_n_22);
  csa_tree_ADD_UNS_OP_pad_groupi_g587 : FA1D0BWP7T port map(A => in3(5), B => in4(5), CI => in2(5), CO => csa_tree_ADD_UNS_OP_pad_groupi_n_19, S => csa_tree_ADD_UNS_OP_pad_groupi_n_20);
  csa_tree_ADD_UNS_OP_pad_groupi_g588 : FA1D0BWP7T port map(A => in3(7), B => in4(7), CI => in2(7), CO => csa_tree_ADD_UNS_OP_pad_groupi_n_17, S => csa_tree_ADD_UNS_OP_pad_groupi_n_18);
  csa_tree_ADD_UNS_OP_pad_groupi_g589 : CKND1BWP7T port map(I => csa_tree_ADD_UNS_OP_pad_groupi_n_15, ZN => csa_tree_ADD_UNS_OP_pad_groupi_n_16);
  csa_tree_ADD_UNS_OP_pad_groupi_g590 : FA1D0BWP7T port map(A => in2(1), B => in1(1), CI => csa_tree_ADD_UNS_OP_pad_groupi_n_11, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_14, S => csa_tree_ADD_UNS_OP_pad_groupi_n_15);
  csa_tree_ADD_UNS_OP_pad_groupi_g591 : MAOI222D0BWP7T port map(A => in3(0), B => in1(0), C => csa_tree_ADD_UNS_OP_pad_groupi_n_12, ZN => csa_tree_ADD_UNS_OP_pad_groupi_n_13);
  csa_tree_ADD_UNS_OP_pad_groupi_g592 : HA1D0BWP7T port map(A => in4(0), B => in2(0), CO => csa_tree_ADD_UNS_OP_pad_groupi_n_11, S => csa_tree_ADD_UNS_OP_pad_groupi_n_12);
  csa_tree_ADD_UNS_OP_pad_groupi_g593 : CKXOR2D0BWP7T port map(A1 => in3(1), A2 => in4(1), Z => csa_tree_ADD_UNS_OP_pad_groupi_n_10);
  csa_tree_ADD_UNS_OP_pad_groupi_g594 : OR2D0BWP7T port map(A1 => in3(1), A2 => in4(1), Z => csa_tree_ADD_UNS_OP_pad_groupi_n_9);
  csa_tree_ADD_UNS_OP_pad_groupi_drc_bufs : BUFFD4BWP7T port map(I => csa_tree_ADD_UNS_OP_pad_groupi_n_55, Z => out1(6));
  csa_tree_ADD_UNS_OP_pad_groupi_drc_bufs595 : BUFFD4BWP7T port map(I => csa_tree_ADD_UNS_OP_pad_groupi_n_51, Z => out1(4));
  csa_tree_ADD_UNS_OP_pad_groupi_drc_bufs596 : BUFFD4BWP7T port map(I => csa_tree_ADD_UNS_OP_pad_groupi_n_45, Z => out1(1));
  csa_tree_ADD_UNS_OP_pad_groupi_drc_bufs597 : BUFFD4BWP7T port map(I => csa_tree_ADD_UNS_OP_pad_groupi_n_47, Z => out1(2));
  csa_tree_ADD_UNS_OP_pad_groupi_drc_bufs598 : BUFFD4BWP7T port map(I => csa_tree_ADD_UNS_OP_pad_groupi_n_49, Z => out1(3));
  csa_tree_ADD_UNS_OP_pad_groupi_drc_bufs599 : BUFFD4BWP7T port map(I => csa_tree_ADD_UNS_OP_pad_groupi_n_43, Z => out1(0));
  csa_tree_ADD_UNS_OP_pad_groupi_drc_bufs600 : BUFFD4BWP7T port map(I => csa_tree_ADD_UNS_OP_pad_groupi_n_53, Z => out1(5));
  csa_tree_ADD_UNS_OP_pad_groupi_drc_bufs601 : BUFFD4BWP7T port map(I => csa_tree_ADD_UNS_OP_pad_groupi_n_54, Z => out1(7));

end synthesised;
