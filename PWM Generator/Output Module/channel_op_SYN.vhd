
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of channel_op is

  component OR3D4BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component ND2D4BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI32D0BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OR2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component MAOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI222D0BWP7T
    port(A1, A2, B1, B2, C1, C2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI31D0BWP7T
    port(A1, A2, A3, B : in std_logic; ZN : out std_logic);
  end component;

  component MOAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI32D0BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component INR3D0BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AO22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; Z : out std_logic);
  end component;

  component IND3D0BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component INR2D0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component INVD0BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component ND2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component IND2D0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component OAI211D0BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component AOI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component CKAN2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component ND3D0BWP7T
    port(A1, A2, A3 : in std_logic; ZN : out std_logic);
  end component;

  component AN3D0BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component MUX2ND0BWP7T
    port(I0, I1, S : in std_logic; ZN : out std_logic);
  end component;

  component NR2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component IOA21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  signal n_0, n_1, n_2, n_3, n_4 : std_logic;
  signal n_5, n_6, n_7, n_8, n_9 : std_logic;
  signal n_10, n_11, n_12, n_13, n_14 : std_logic;
  signal n_15, n_16, n_17, n_18, n_19 : std_logic;
  signal n_20, n_21, n_22, n_23, n_25 : std_logic;
  signal n_26, n_27, n_28, n_29, n_30 : std_logic;
  signal n_31, n_32, n_33, n_34, n_35 : std_logic;
  signal n_36, n_37, n_38, n_39, n_40 : std_logic;
  signal n_41, n_42, n_43, n_44, n_45 : std_logic;
  signal n_46, n_47, n_48, n_49, n_50 : std_logic;
  signal n_51, n_52, n_53, n_54, n_55 : std_logic;
  signal n_56, n_57, n_58, n_60, n_61 : std_logic;
  signal n_62, n_63, n_64, n_65, n_66 : std_logic;
  signal n_67, n_72 : std_logic;

begin

  g2184 : OR3D4BWP7T port map(A1 => n_47, A2 => n_63, A3 => n_72, Z => CH_Out(0));
  g2189 : ND2D4BWP7T port map(A1 => n_67, A2 => n_37, ZN => CH_Out(4));
  g2186 : OAI32D0BWP7T port map(A1 => vel(3), A2 => n_14, A3 => n_56, B1 => n_6, B2 => n_29, ZN => n_72);
  g2188 : ND2D4BWP7T port map(A1 => n_64, A2 => n_42, ZN => CH_Out(3));
  g2185 : OR2D4BWP7T port map(A1 => n_66, A2 => n_48, Z => CH_Out(2));
  g2187 : OR3D4BWP7T port map(A1 => n_35, A2 => n_54, A3 => n_58, Z => CH_Out(1));
  g2191 : ND2D4BWP7T port map(A1 => n_60, A2 => n_45, ZN => CH_Out(5));
  g2195 : MAOI22D0BWP7T port map(A1 => n_52, A2 => vel(3), B1 => n_55, B2 => n_65, ZN => n_67);
  g2190 : OAI222D0BWP7T port map(A1 => n_43, A2 => n_61, B1 => n_65, B2 => n_57, C1 => n_40, C2 => n_62, ZN => n_66);
  g2192 : AOI31D0BWP7T port map(A1 => n_51, A2 => n_53, A3 => vel(3), B => n_44, ZN => n_64);
  g2194 : MOAI22D0BWP7T port map(A1 => n_62, A2 => n_61, B1 => vel(6), B2 => amp(0), ZN => n_63);
  g2200 : AOI32D0BWP7T port map(A1 => n_49, A2 => n_50, A3 => vel(3), B1 => n_38, B2 => vel(6), ZN => n_60);
  g2206 : OR2D4BWP7T port map(A1 => n_39, A2 => n_22, Z => CH_Out(6));
  g2196 : OAI22D0BWP7T port map(A1 => n_57, A2 => n_61, B1 => n_62, B2 => n_65, ZN => n_58);
  g2199 : MAOI22D0BWP7T port map(A1 => n_36, A2 => vel(2), B1 => n_55, B2 => n_3, ZN => n_56);
  g2198 : INR3D0BWP7T port map(A1 => n_53, B1 => vel(3), B2 => n_55, ZN => n_54);
  g2207 : AO22D0BWP7T port map(A1 => n_51, A2 => n_50, B1 => n_53, B2 => n_49, Z => n_52);
  g2201 : MOAI22D0BWP7T port map(A1 => n_55, A2 => n_46, B1 => n_51, B2 => n_41, ZN => n_48);
  g2193 : OAI22D0BWP7T port map(A1 => n_57, A2 => n_46, B1 => n_30, B2 => n_65, ZN => n_47);
  g2203 : IND3D0BWP7T port map(A1 => n_65, B1 => vel(4), B2 => n_51, ZN => n_45);
  g2202 : OAI22D0BWP7T port map(A1 => n_55, A2 => n_61, B1 => n_43, B2 => n_65, ZN => n_44);
  g2197 : MAOI22D0BWP7T port map(A1 => n_41, A2 => n_49, B1 => n_57, B2 => n_40, ZN => n_42);
  g2209 : INR2D0BWP7T port map(A1 => n_51, B1 => n_17, ZN => n_39);
  g2210 : INVD0BWP7T port map(I => n_55, ZN => n_38);
  g2211 : ND2D0BWP7T port map(A1 => n_36, A2 => vel(6), ZN => n_37);
  g2204 : MOAI22D0BWP7T port map(A1 => n_43, A2 => n_46, B1 => n_31, B2 => vel(6), ZN => n_35);
  g2205 : AOI32D0BWP7T port map(A1 => n_27, A2 => n_4, A3 => amp(1), B1 => n_28, B2 => amp(2), ZN => n_62);
  g2208 : MAOI22D0BWP7T port map(A1 => n_34, A2 => amp(3), B1 => n_34, B2 => amp(3), ZN => n_57);
  g2217 : MOAI22D0BWP7T port map(A1 => n_33, A2 => amp(5), B1 => n_33, B2 => amp(5), ZN => n_51);
  g2212 : MAOI22D0BWP7T port map(A1 => n_32, A2 => amp(5), B1 => n_32, B2 => amp(5), ZN => n_55);
  g2215 : INVD0BWP7T port map(I => n_43, ZN => n_36);
  g2213 : ND2D0BWP7T port map(A1 => n_30, A2 => n_29, ZN => n_31);
  g2214 : IND2D0BWP7T port map(A1 => n_30, B1 => n_27, ZN => n_28);
  g2218 : MAOI22D0BWP7T port map(A1 => n_26, A2 => amp(4), B1 => n_26, B2 => amp(4), ZN => n_43);
  g2216 : AOI32D0BWP7T port map(A1 => n_27, A2 => amp(2), A3 => n_23, B1 => n_25, B2 => n_15, ZN => n_34);
  g2220 : OAI211D0BWP7T port map(A1 => amp(3), A2 => amp(4), B => n_21, C => n_27, ZN => n_32);
  g2224 : AOI21D0BWP7T port map(A1 => n_20, A2 => amp(4), B => n_49, ZN => n_33);
  g2219 : IND2D0BWP7T port map(A1 => n_25, B1 => amp(1), ZN => n_30);
  g2225 : IND3D0BWP7T port map(A1 => n_19, B1 => n_16, B2 => n_27, ZN => n_26);
  g2226 : CKAN2D4BWP7T port map(A1 => n_49, A2 => n_8, Z => CH_Out(7));
  g2222 : ND3D0BWP7T port map(A1 => n_27, A2 => n_23, A3 => amp(0), ZN => n_29);
  g2221 : INR2D0BWP7T port map(A1 => n_27, B1 => n_13, ZN => n_25);
  g2223 : AN3D0BWP7T port map(A1 => n_49, A2 => n_7, A3 => vel(4), Z => n_22);
  g2227 : MUX2ND0BWP7T port map(I0 => amp(3), I1 => amp(4), S => n_18, ZN => n_21);
  g2229 : INVD0BWP7T port map(I => n_19, ZN => n_20);
  g2230 : NR2D0BWP7T port map(A1 => n_18, A2 => amp(3), ZN => n_19);
  g2228 : OAI211D0BWP7T port map(A1 => n_10, A2 => n_9, B => n_12, C => n_17, ZN => n_27);
  g2231 : AN3D0BWP7T port map(A1 => n_53, A2 => n_2, A3 => vel(1), Z => n_41);
  g2232 : AOI21D0BWP7T port map(A1 => n_16, A2 => n_0, B => n_1, ZN => n_49);
  g2234 : OAI21D0BWP7T port map(A1 => n_23, A2 => n_15, B => n_16, ZN => n_18);
  g2235 : INR2D0BWP7T port map(A1 => vel(2), B1 => n_14, ZN => n_53);
  g2236 : IND2D0BWP7T port map(A1 => n_14, B1 => vel(3), ZN => n_46);
  g2237 : IOA21D0BWP7T port map(A1 => n_13, A2 => n_15, B => amp(3), ZN => n_16);
  g2233 : OAI211D0BWP7T port map(A1 => vel(3), A2 => n_5, B => n_11, C => vel(2), ZN => n_12);
  g2239 : INVD0BWP7T port map(I => n_61, ZN => n_50);
  g2238 : ND2D0BWP7T port map(A1 => n_11, A2 => n_10, ZN => n_14);
  g2241 : ND2D0BWP7T port map(A1 => n_11, A2 => vel(4), ZN => n_61);
  g2240 : AOI21D0BWP7T port map(A1 => vel(3), A2 => n_40, B => vel(5), ZN => n_9);
  g2246 : INVD0BWP7T port map(I => n_8, ZN => n_17);
  g2242 : INVD0BWP7T port map(I => n_7, ZN => n_65);
  g2245 : NR2D0BWP7T port map(A1 => vel(6), A2 => n_6, ZN => n_7);
  g2250 : NR2D0BWP7T port map(A1 => n_40, A2 => n_6, ZN => n_8);
  g2243 : INR2D0BWP7T port map(A1 => vel(1), B1 => vel(4), ZN => n_5);
  g2244 : NR2D0BWP7T port map(A1 => amp(2), A2 => amp(0), ZN => n_4);
  g2247 : IND2D0BWP7T port map(A1 => vel(2), B1 => vel(1), ZN => n_3);
  g2248 : ND2D0BWP7T port map(A1 => amp(1), A2 => amp(0), ZN => n_13);
  g2249 : NR2D0BWP7T port map(A1 => vel(6), A2 => vel(5), ZN => n_11);
  g2258 : INVD0BWP7T port map(I => vel(3), ZN => n_2);
  g2251 : INVD0BWP7T port map(I => amp(5), ZN => n_1);
  g2256 : INVD0BWP7T port map(I => vel(5), ZN => n_6);
  g2255 : INVD0BWP7T port map(I => vel(6), ZN => n_40);
  g2252 : INVD0BWP7T port map(I => amp(4), ZN => n_0);
  g2253 : INVD0BWP7T port map(I => vel(4), ZN => n_10);
  g2254 : INVD0BWP7T port map(I => amp(1), ZN => n_23);
  g2257 : INVD0BWP7T port map(I => amp(2), ZN => n_15);

end synthesised;
