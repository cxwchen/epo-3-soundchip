
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of var_shift is

  component ND2D4BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; ZN : out std_logic);
  end component;

  component AOI222D0BWP7T
    port(A1, A2, B1, B2, C1, C2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AO22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; Z : out std_logic);
  end component;

  component NR2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component IINR4D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component ND2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component AN2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component NR3D0BWP7T
    port(A1, A2, A3 : in std_logic; ZN : out std_logic);
  end component;

  component INR3D0BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component INR2D0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component CKAN2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  signal n_1, n_2, n_3, n_4, n_5 : std_logic;
  signal n_6, n_7, n_8, n_11, n_12 : std_logic;
  signal n_13, n_14, n_15, n_16, n_17 : std_logic;
  signal n_18, n_20, n_21, n_22, n_23 : std_logic;
  signal n_24 : std_logic;

begin

  g764 : ND2D4BWP7T port map(A1 => n_23, A2 => n_11, ZN => Shift_Out(2));
  g765 : ND2D4BWP7T port map(A1 => n_24, A2 => n_18, ZN => Shift_Out(1));
  g766 : ND2D4BWP7T port map(A1 => n_16, A2 => n_21, ZN => Shift_Out(0));
  g768 : AOI221D0BWP7T port map(A1 => n_22, A2 => Sel_Out(3), B1 => vel(6), B2 => Sel_Out(2), C => n_12, ZN => n_24);
  g770 : AOI222D0BWP7T port map(A1 => n_20, A2 => Sel_Out(7), B1 => n_22, B2 => Sel_Out(4), C1 => vel(6), C2 => Sel_Out(3), ZN => n_23);
  g771 : AOI22D0BWP7T port map(A1 => n_17, A2 => Sel_Out(6), B1 => n_20, B2 => Sel_Out(5), ZN => n_21);
  g769 : ND2D4BWP7T port map(A1 => n_15, A2 => n_4, ZN => Shift_Out(3));
  g772 : AOI22D0BWP7T port map(A1 => n_17, A2 => Sel_Out(7), B1 => n_20, B2 => Sel_Out(6), ZN => n_18);
  g767 : AOI221D0BWP7T port map(A1 => n_13, A2 => Sel_Out(3), B1 => n_14, B2 => Sel_Out(4), C => n_5, ZN => n_16);
  g775 : AOI22D0BWP7T port map(A1 => n_14, A2 => Sel_Out(7), B1 => n_13, B2 => Sel_Out(6), ZN => n_15);
  g773 : AO22D0BWP7T port map(A1 => n_14, A2 => Sel_Out(5), B1 => Sel_Out(4), B2 => n_13, Z => n_12);
  g774 : AOI22D0BWP7T port map(A1 => n_14, A2 => Sel_Out(6), B1 => n_13, B2 => Sel_Out(5), ZN => n_11);
  g776 : NR2D0BWP7T port map(A1 => n_8, A2 => vel(3), ZN => n_20);
  g777 : ND2D4BWP7T port map(A1 => n_3, A2 => n_6, ZN => Shift_Out(4));
  g778 : IINR4D0BWP7T port map(A1 => n_7, A2 => vel(1), B1 => vel(3), B2 => vel(2), ZN => n_17);
  g784 : ND2D4BWP7T port map(A1 => n_2, A2 => n_1, ZN => Shift_Out(5));
  g779 : ND2D0BWP7T port map(A1 => n_7, A2 => vel(2), ZN => n_8);
  g780 : ND2D0BWP7T port map(A1 => n_13, A2 => Sel_Out(7), ZN => n_6);
  g781 : AN2D1BWP7T port map(A1 => n_7, A2 => vel(3), Z => n_14);
  g782 : AO22D0BWP7T port map(A1 => n_22, A2 => Sel_Out(2), B1 => Sel_Out(1), B2 => vel(6), Z => n_5);
  g783 : AOI22D0BWP7T port map(A1 => n_22, A2 => Sel_Out(5), B1 => vel(6), B2 => Sel_Out(4), ZN => n_4);
  g785 : AOI22D0BWP7T port map(A1 => n_22, A2 => Sel_Out(6), B1 => vel(6), B2 => Sel_Out(5), ZN => n_3);
  g786 : ND2D0BWP7T port map(A1 => n_22, A2 => Sel_Out(7), ZN => n_2);
  g787 : NR3D0BWP7T port map(A1 => vel(6), A2 => vel(5), A3 => vel(4), ZN => n_7);
  g788 : INR3D0BWP7T port map(A1 => vel(4), B1 => vel(5), B2 => vel(6), ZN => n_13);
  g789 : INR2D0BWP7T port map(A1 => vel(5), B1 => vel(6), ZN => n_22);
  g790 : ND2D0BWP7T port map(A1 => vel(6), A2 => Sel_Out(6), ZN => n_1);
  g791 : CKAN2D4BWP7T port map(A1 => vel(6), A2 => Sel_Out(7), Z => Shift_Out(6));

end synthesised;
