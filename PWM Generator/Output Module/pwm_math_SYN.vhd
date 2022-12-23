
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of pwm_math is

  component OAI211D0BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component AOI221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; ZN : out std_logic);
  end component;

  component OAI221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; ZN : out std_logic);
  end component;

  component OAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI31D0BWP7T
    port(A1, A2, A3, B : in std_logic; ZN : out std_logic);
  end component;

  component AO32D0BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; Z : out std_logic);
  end component;

  component AOI32D0BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component MOAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI222D0BWP7T
    port(A1, A2, B1, B2, C1, C2 : in std_logic; ZN : out std_logic);
  end component;

  component INVD0BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component INR3D0BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component AOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component CKND1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component AO21D0BWP7T
    port(A1, A2, B : in std_logic; Z : out std_logic);
  end component;

  component ND2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component NR2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component AO221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; Z : out std_logic);
  end component;

  component ND3D0BWP7T
    port(A1, A2, A3 : in std_logic; ZN : out std_logic);
  end component;

  component OAI32D0BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component IND3D0BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component NR3D0BWP7T
    port(A1, A2, A3 : in std_logic; ZN : out std_logic);
  end component;

  component MAOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component INVD1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component IND2D0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component IOA21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component INR2D0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component AN2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component FA1D0BWP7T
    port(A, B, CI : in std_logic; CO, S : out std_logic);
  end component;

  component MAOI222D0BWP7T
    port(A, B, C : in std_logic; ZN : out std_logic);
  end component;

  component HA1D0BWP7T
    port(A, B : in std_logic; CO, S : out std_logic);
  end component;

  component AOI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
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
  signal csa_tree_ADD_UNS_OP_pad_groupi_n_54, csa_tree_ADD_UNS_OP_pad_groupi_n_55, csa_tree_ADD_UNS_OP_pad_groupi_n_56, n_0, n_1 : std_logic;
  signal n_2, n_3, n_4, n_5, n_6 : std_logic;
  signal n_7, n_8, n_9, n_10, n_11 : std_logic;
  signal n_12, n_13, n_14, n_15, n_16 : std_logic;
  signal n_17, n_18, n_19, n_20, n_21 : std_logic;
  signal n_22, n_23, n_24, n_25, n_26 : std_logic;
  signal n_27, n_28, n_29, n_30, n_31 : std_logic;
  signal n_32, n_33, n_34, n_35, n_36 : std_logic;
  signal n_37, n_38, n_39, n_40, n_41 : std_logic;
  signal n_42, n_43, n_44, n_45, n_46 : std_logic;
  signal n_47, n_48, n_49, n_50, n_51 : std_logic;
  signal n_52, n_53, n_54, n_55, n_56 : std_logic;
  signal n_57, n_58, n_59, n_60, n_61 : std_logic;
  signal n_62, n_63, n_64, n_65, n_66 : std_logic;
  signal n_67, n_68, n_69, n_70, n_71 : std_logic;
  signal n_72, n_73, n_74, n_75, n_76 : std_logic;
  signal n_77, n_78, n_79, n_80, n_81 : std_logic;
  signal n_82, n_83, n_84, n_85, n_86 : std_logic;
  signal n_87, n_88, n_89, n_90, n_91 : std_logic;
  signal n_92, n_93, n_94, n_95, n_96 : std_logic;
  signal n_97, n_98, n_99, n_100, n_101 : std_logic;
  signal n_102, n_103, n_104, n_105, n_106 : std_logic;
  signal n_107, n_108, n_109, n_110, n_111 : std_logic;
  signal n_112, n_113, n_114, n_115, n_116 : std_logic;
  signal n_117, n_118, n_119, n_120, n_121 : std_logic;
  signal n_122, n_123, n_124, n_125, n_126 : std_logic;
  signal n_127, n_128, n_129, n_130, n_131 : std_logic;
  signal n_132, n_133, n_134, n_135, n_136 : std_logic;
  signal n_137, n_138, n_139, n_140, n_141 : std_logic;
  signal n_142, n_143, n_144, n_145, n_146 : std_logic;
  signal n_147, n_148, n_149, n_150, n_151 : std_logic;
  signal n_152, n_153, n_154, n_155, n_156 : std_logic;
  signal n_157, n_158, n_159, n_160, n_161 : std_logic;
  signal n_162, n_163, n_164, n_165, n_166 : std_logic;
  signal n_167, n_168, n_169, n_170, n_171 : std_logic;
  signal n_172, n_173, n_174, n_175, n_176 : std_logic;
  signal n_177, n_178, n_179, n_180, n_181 : std_logic;
  signal n_182, n_183, n_184, n_185, n_186 : std_logic;
  signal n_187, n_188, n_189, n_190, n_191 : std_logic;
  signal n_192, n_193, n_194, n_195, n_196 : std_logic;
  signal n_197, n_198, n_199, n_200, n_201 : std_logic;
  signal n_202, n_203, n_204, n_205, n_206 : std_logic;
  signal n_207, n_208, n_209, n_210, n_211 : std_logic;
  signal n_212, n_213, n_214, n_215, n_216 : std_logic;
  signal n_217, n_218, n_219, n_220, n_221 : std_logic;
  signal n_222, n_223, n_224, n_225, n_226 : std_logic;
  signal n_227, n_228, n_229, n_230, n_231 : std_logic;
  signal n_232, n_233, n_234, n_235, n_236 : std_logic;
  signal n_237, n_238, n_239, n_240, n_241 : std_logic;
  signal n_242, n_243, n_244, n_245, n_246 : std_logic;
  signal n_247, n_248, n_249, n_250, n_251 : std_logic;
  signal n_252, n_253, n_254, n_255, n_256 : std_logic;
  signal n_257, n_258, n_259, n_260, n_261 : std_logic;
  signal n_262, n_263, n_264, n_265, n_266 : std_logic;
  signal n_267, n_268, n_269, n_270, n_271 : std_logic;
  signal n_272, n_273, n_274, n_275, n_278 : std_logic;
  signal n_279, n_280, n_281, n_282, n_283 : std_logic;
  signal n_284, n_285, n_287, n_288, n_289 : std_logic;
  signal n_290, n_291, n_292, n_293, n_294 : std_logic;
  signal n_296, n_297, n_298, n_299, n_300 : std_logic;
  signal n_301, n_302, n_303, n_305, n_306 : std_logic;
  signal n_307, n_308, n_309, n_310, n_311 : std_logic;
  signal n_312 : std_logic;

begin

  g4223 : OAI211D0BWP7T port map(A1 => n_210, A2 => n_265, B => n_275, C => n_243, ZN => n_289);
  g4224 : AOI221D0BWP7T port map(A1 => n_260, A2 => n_222, B1 => n_263, B2 => n_207, C => n_274, ZN => n_275);
  g4225 : OAI221D0BWP7T port map(A1 => n_270, A2 => n_223, B1 => n_216, B2 => n_265, C => n_273, ZN => n_288);
  g4226 : OAI221D0BWP7T port map(A1 => n_270, A2 => n_225, B1 => n_223, B2 => n_265, C => n_272, ZN => n_287);
  g4227 : OAI221D0BWP7T port map(A1 => n_270, A2 => n_210, B1 => n_216, B2 => n_259, C => n_271, ZN => n_290);
  g4228 : OAI22D0BWP7T port map(A1 => n_258, A2 => n_225, B1 => n_270, B2 => n_216, ZN => n_274);
  g4229 : OAI221D0BWP7T port map(A1 => n_258, A2 => n_216, B1 => n_223, B2 => n_264, C => n_269, ZN => n_291);
  g4230 : AOI221D0BWP7T port map(A1 => n_260, A2 => n_226, B1 => n_256, B2 => CH1_Vel(6), C => n_267, ZN => n_273);
  g4231 : AOI221D0BWP7T port map(A1 => n_261, A2 => CH1_Amp(0), B1 => n_251, B2 => n_217, C => n_266, ZN => n_272);
  g4232 : AOI31D0BWP7T port map(A1 => n_238, A2 => n_233, A3 => CH1_Vel(2), B => n_268, ZN => n_271);
  g4233 : OAI221D0BWP7T port map(A1 => n_258, A2 => n_210, B1 => n_216, B2 => n_264, C => n_242, ZN => n_292);
  g4234 : AO32D0BWP7T port map(A1 => n_238, A2 => n_217, A3 => CH1_Vel(4), B1 => n_263, B2 => CH1_Vel(6), Z => n_293);
  g4235 : AOI32D0BWP7T port map(A1 => n_238, A2 => n_226, A3 => CH1_Vel(2), B1 => n_260, B2 => CH1_Vel(6), ZN => n_269);
  g4236 : AOI221D0BWP7T port map(A1 => n_255, A2 => CH1_Amp(3), B1 => n_248, B2 => CH1_Amp(2), C => n_262, ZN => n_270);
  g4237 : OAI22D0BWP7T port map(A1 => n_258, A2 => n_223, B1 => n_264, B2 => n_225, ZN => n_268);
  g4238 : MOAI22D0BWP7T port map(A1 => n_264, A2 => n_234, B1 => n_257, B2 => n_207, ZN => n_267);
  g4239 : MOAI22D0BWP7T port map(A1 => n_258, A2 => n_234, B1 => n_260, B2 => n_207, ZN => n_266);
  g4240 : AOI222D0BWP7T port map(A1 => n_253, A2 => n_219, B1 => n_246, B2 => n_213, C1 => n_249, C2 => CH1_Amp(1), ZN => n_265);
  g4241 : INVD0BWP7T port map(I => n_264, ZN => n_263);
  g4242 : INR3D0BWP7T port map(A1 => n_253, B1 => CH1_Amp(2), B2 => CH1_Amp(3), ZN => n_262);
  g4243 : OAI21D0BWP7T port map(A1 => n_253, A2 => n_211, B => n_214, ZN => n_261);
  g4244 : AOI22D0BWP7T port map(A1 => n_246, A2 => n_241, B1 => n_252, B2 => CH1_Amp(5), ZN => n_264);
  g4245 : CKND1BWP7T port map(I => n_260, ZN => n_259);
  g4246 : INVD0BWP7T port map(I => n_258, ZN => n_257);
  g4247 : OAI21D0BWP7T port map(A1 => n_253, A2 => n_212, B => n_250, ZN => n_256);
  g4248 : MOAI22D0BWP7T port map(A1 => n_254, A2 => CH1_Amp(3), B1 => n_254, B2 => CH1_Amp(3), ZN => n_260);
  g4249 : AOI22D0BWP7T port map(A1 => n_246, A2 => n_244, B1 => n_247, B2 => CH1_Amp(4), ZN => n_258);
  g4250 : AO21D0BWP7T port map(A1 => n_246, A2 => n_221, B => n_219, Z => n_255);
  g4251 : ND2D0BWP7T port map(A1 => n_246, A2 => n_230, ZN => n_252);
  g4252 : OAI211D0BWP7T port map(A1 => CH1_Amp(4), A2 => n_231, B => n_246, C => n_236, ZN => n_254);
  g4253 : NR2D0BWP7T port map(A1 => n_245, A2 => n_215, ZN => n_253);
  g4254 : CKND1BWP7T port map(I => n_250, ZN => n_251);
  g4255 : OAI21D0BWP7T port map(A1 => CH1_Amp(0), A2 => CH1_Amp(2), B => n_246, ZN => n_249);
  g4256 : OAI21D0BWP7T port map(A1 => CH1_Amp(3), A2 => CH1_Amp(1), B => n_246, ZN => n_248);
  g4257 : AO221D0BWP7T port map(A1 => n_235, A2 => n_208, B1 => CH1_Amp(3), B2 => CH1_Amp(5), C => n_245, Z => n_247);
  g4258 : ND3D0BWP7T port map(A1 => n_246, A2 => CH1_Amp(1), A3 => n_212, ZN => n_250);
  g4259 : CKND1BWP7T port map(I => n_246, ZN => n_245);
  g4260 : ND2D0BWP7T port map(A1 => n_240, A2 => n_214, ZN => n_246);
  g4261 : OAI32D0BWP7T port map(A1 => n_208, A2 => CH1_Amp(3), A3 => n_232, B1 => CH1_Amp(4), B2 => n_239, ZN => n_244);
  g4262 : IND3D0BWP7T port map(A1 => n_234, B1 => CH1_Vel(0), B2 => n_238, ZN => n_243);
  g4263 : ND3D0BWP7T port map(A1 => n_238, A2 => n_222, A3 => CH1_Vel(3), ZN => n_242);
  g4264 : NR3D0BWP7T port map(A1 => n_235, A2 => CH1_Amp(5), A3 => n_209, ZN => n_241);
  g4265 : AOI222D0BWP7T port map(A1 => n_229, A2 => CH1_Vel(2), B1 => n_220, B2 => CH1_Vel(4), C1 => n_233, C2 => CH1_Vel(0), ZN => n_240);
  g4266 : NR2D0BWP7T port map(A1 => n_237, A2 => n_214, ZN => n_294);
  g4267 : MAOI22D0BWP7T port map(A1 => n_232, A2 => CH1_Amp(5), B1 => n_228, B2 => CH1_Amp(5), ZN => n_239);
  g4268 : INVD1BWP7T port map(I => n_237, ZN => n_238);
  g4269 : ND2D0BWP7T port map(A1 => n_231, A2 => CH1_Amp(4), ZN => n_236);
  g4270 : ND2D0BWP7T port map(A1 => n_230, A2 => CH1_Amp(5), ZN => n_237);
  g4271 : NR2D0BWP7T port map(A1 => n_231, A2 => CH1_Amp(3), ZN => n_235);
  g4272 : IND2D0BWP7T port map(A1 => CH1_Vel(2), B1 => n_233, ZN => n_234);
  g4273 : CKND1BWP7T port map(I => n_231, ZN => n_232);
  g4274 : NR2D0BWP7T port map(A1 => n_227, A2 => CH1_Vel(3), ZN => n_233);
  g4275 : IND2D0BWP7T port map(A1 => n_219, B1 => n_228, ZN => n_231);
  g4276 : IOA21D0BWP7T port map(A1 => n_218, A2 => CH1_Vel(3), B => n_227, ZN => n_229);
  g4277 : ND2D0BWP7T port map(A1 => n_228, A2 => n_209, ZN => n_230);
  g4279 : IND2D0BWP7T port map(A1 => n_221, B1 => CH1_Amp(3), ZN => n_228);
  g4280 : CKND1BWP7T port map(I => n_225, ZN => n_226);
  g4281 : IND2D0BWP7T port map(A1 => n_224, B1 => CH1_Vel(1), ZN => n_227);
  g4282 : IND2D0BWP7T port map(A1 => n_224, B1 => CH1_Vel(3), ZN => n_225);
  g4283 : CKND1BWP7T port map(I => n_223, ZN => n_222);
  g4284 : IND2D0BWP7T port map(A1 => CH1_Vel(4), B1 => n_218, ZN => n_224);
  g4285 : ND2D0BWP7T port map(A1 => n_218, A2 => CH1_Vel(4), ZN => n_223);
  g4286 : IOA21D0BWP7T port map(A1 => n_210, A2 => CH1_Vel(3), B => n_211, ZN => n_220);
  g4287 : INR2D0BWP7T port map(A1 => n_215, B1 => CH1_Amp(2), ZN => n_221);
  g4288 : INVD1BWP7T port map(I => n_217, ZN => n_216);
  g4289 : AN2D1BWP7T port map(A1 => CH1_Amp(1), A2 => CH1_Amp(2), Z => n_219);
  g4290 : NR2D0BWP7T port map(A1 => CH1_Vel(6), A2 => CH1_Vel(5), ZN => n_218);
  g4291 : NR2D0BWP7T port map(A1 => CH1_Vel(6), A2 => n_211, ZN => n_217);
  g4292 : INR2D0BWP7T port map(A1 => CH1_Amp(2), B1 => CH1_Amp(1), ZN => n_213);
  g4293 : ND2D0BWP7T port map(A1 => CH1_Amp(1), A2 => CH1_Amp(0), ZN => n_215);
  g4294 : ND2D0BWP7T port map(A1 => CH1_Vel(6), A2 => CH1_Vel(5), ZN => n_214);
  g4295 : INVD0BWP7T port map(I => CH1_Amp(0), ZN => n_212);
  g4296 : INVD0BWP7T port map(I => CH1_Vel(5), ZN => n_211);
  g4297 : INVD0BWP7T port map(I => CH1_Vel(6), ZN => n_210);
  g4299 : INVD0BWP7T port map(I => CH1_Amp(4), ZN => n_209);
  g4300 : INVD0BWP7T port map(I => CH1_Amp(5), ZN => n_208);
  g2 : INR3D0BWP7T port map(A1 => CH1_Vel(2), B1 => n_224, B2 => CH1_Vel(3), ZN => n_207);
  g4301 : OAI211D0BWP7T port map(A1 => n_141, A2 => n_196, B => n_206, C => n_174, ZN => n_280);
  g4302 : AOI221D0BWP7T port map(A1 => n_191, A2 => n_153, B1 => n_194, B2 => n_138, C => n_205, ZN => n_206);
  g4303 : OAI221D0BWP7T port map(A1 => n_201, A2 => n_154, B1 => n_147, B2 => n_196, C => n_204, ZN => n_279);
  g4304 : OAI221D0BWP7T port map(A1 => n_201, A2 => n_156, B1 => n_154, B2 => n_196, C => n_203, ZN => n_278);
  g4305 : OAI221D0BWP7T port map(A1 => n_201, A2 => n_141, B1 => n_147, B2 => n_190, C => n_202, ZN => n_281);
  g4306 : OAI22D0BWP7T port map(A1 => n_189, A2 => n_156, B1 => n_201, B2 => n_147, ZN => n_205);
  g4307 : OAI221D0BWP7T port map(A1 => n_189, A2 => n_147, B1 => n_154, B2 => n_195, C => n_200, ZN => n_282);
  g4308 : AOI221D0BWP7T port map(A1 => n_191, A2 => n_157, B1 => n_187, B2 => CH2_Vel(6), C => n_198, ZN => n_204);
  g4309 : AOI221D0BWP7T port map(A1 => n_192, A2 => CH2_Amp(0), B1 => n_182, B2 => n_148, C => n_197, ZN => n_203);
  g4310 : AOI31D0BWP7T port map(A1 => n_169, A2 => n_164, A3 => CH2_Vel(2), B => n_199, ZN => n_202);
  g4311 : OAI221D0BWP7T port map(A1 => n_189, A2 => n_141, B1 => n_147, B2 => n_195, C => n_173, ZN => n_283);
  g4312 : AO32D0BWP7T port map(A1 => n_169, A2 => n_148, A3 => CH2_Vel(4), B1 => n_194, B2 => CH2_Vel(6), Z => n_284);
  g4313 : AOI32D0BWP7T port map(A1 => n_169, A2 => n_157, A3 => CH2_Vel(2), B1 => n_191, B2 => CH2_Vel(6), ZN => n_200);
  g4314 : AOI221D0BWP7T port map(A1 => n_186, A2 => CH2_Amp(3), B1 => n_179, B2 => CH2_Amp(2), C => n_193, ZN => n_201);
  g4315 : OAI22D0BWP7T port map(A1 => n_189, A2 => n_154, B1 => n_195, B2 => n_156, ZN => n_199);
  g4316 : MOAI22D0BWP7T port map(A1 => n_195, A2 => n_165, B1 => n_188, B2 => n_138, ZN => n_198);
  g4317 : MOAI22D0BWP7T port map(A1 => n_189, A2 => n_165, B1 => n_191, B2 => n_138, ZN => n_197);
  g4318 : AOI222D0BWP7T port map(A1 => n_184, A2 => n_150, B1 => n_177, B2 => n_144, C1 => n_180, C2 => CH2_Amp(1), ZN => n_196);
  g4319 : INVD0BWP7T port map(I => n_195, ZN => n_194);
  g4320 : INR3D0BWP7T port map(A1 => n_184, B1 => CH2_Amp(2), B2 => CH2_Amp(3), ZN => n_193);
  g4321 : OAI21D0BWP7T port map(A1 => n_184, A2 => n_142, B => n_145, ZN => n_192);
  g4322 : AOI22D0BWP7T port map(A1 => n_177, A2 => n_172, B1 => n_183, B2 => CH2_Amp(5), ZN => n_195);
  g4323 : CKND1BWP7T port map(I => n_191, ZN => n_190);
  g4324 : INVD0BWP7T port map(I => n_189, ZN => n_188);
  g4325 : OAI21D0BWP7T port map(A1 => n_184, A2 => n_143, B => n_181, ZN => n_187);
  g4326 : MOAI22D0BWP7T port map(A1 => n_185, A2 => CH2_Amp(3), B1 => n_185, B2 => CH2_Amp(3), ZN => n_191);
  g4327 : AOI22D0BWP7T port map(A1 => n_177, A2 => n_175, B1 => n_178, B2 => CH2_Amp(4), ZN => n_189);
  g4328 : AO21D0BWP7T port map(A1 => n_177, A2 => n_152, B => n_150, Z => n_186);
  g4329 : ND2D0BWP7T port map(A1 => n_177, A2 => n_161, ZN => n_183);
  g4330 : OAI211D0BWP7T port map(A1 => CH2_Amp(4), A2 => n_162, B => n_177, C => n_167, ZN => n_185);
  g4331 : NR2D0BWP7T port map(A1 => n_176, A2 => n_146, ZN => n_184);
  g4332 : CKND1BWP7T port map(I => n_181, ZN => n_182);
  g4333 : OAI21D0BWP7T port map(A1 => CH2_Amp(0), A2 => CH2_Amp(2), B => n_177, ZN => n_180);
  g4334 : OAI21D0BWP7T port map(A1 => CH2_Amp(3), A2 => CH2_Amp(1), B => n_177, ZN => n_179);
  g4335 : AO221D0BWP7T port map(A1 => n_166, A2 => n_139, B1 => CH2_Amp(3), B2 => CH2_Amp(5), C => n_176, Z => n_178);
  g4336 : ND3D0BWP7T port map(A1 => n_177, A2 => CH2_Amp(1), A3 => n_143, ZN => n_181);
  g4337 : CKND1BWP7T port map(I => n_177, ZN => n_176);
  g4338 : ND2D0BWP7T port map(A1 => n_171, A2 => n_145, ZN => n_177);
  g4339 : OAI32D0BWP7T port map(A1 => n_139, A2 => CH2_Amp(3), A3 => n_163, B1 => CH2_Amp(4), B2 => n_170, ZN => n_175);
  g4340 : IND3D0BWP7T port map(A1 => n_165, B1 => CH2_Vel(0), B2 => n_169, ZN => n_174);
  g4341 : ND3D0BWP7T port map(A1 => n_169, A2 => n_153, A3 => CH2_Vel(3), ZN => n_173);
  g4342 : NR3D0BWP7T port map(A1 => n_166, A2 => CH2_Amp(5), A3 => n_140, ZN => n_172);
  g4343 : AOI222D0BWP7T port map(A1 => n_160, A2 => CH2_Vel(2), B1 => n_151, B2 => CH2_Vel(4), C1 => n_164, C2 => CH2_Vel(0), ZN => n_171);
  g4344 : NR2D0BWP7T port map(A1 => n_168, A2 => n_145, ZN => n_285);
  g4345 : MAOI22D0BWP7T port map(A1 => n_163, A2 => CH2_Amp(5), B1 => n_159, B2 => CH2_Amp(5), ZN => n_170);
  g4346 : INVD1BWP7T port map(I => n_168, ZN => n_169);
  g4347 : ND2D0BWP7T port map(A1 => n_162, A2 => CH2_Amp(4), ZN => n_167);
  g4348 : ND2D0BWP7T port map(A1 => n_161, A2 => CH2_Amp(5), ZN => n_168);
  g4349 : NR2D0BWP7T port map(A1 => n_162, A2 => CH2_Amp(3), ZN => n_166);
  g4350 : IND2D0BWP7T port map(A1 => CH2_Vel(2), B1 => n_164, ZN => n_165);
  g4351 : CKND1BWP7T port map(I => n_162, ZN => n_163);
  g4352 : NR2D0BWP7T port map(A1 => n_158, A2 => CH2_Vel(3), ZN => n_164);
  g4353 : IND2D0BWP7T port map(A1 => n_150, B1 => n_159, ZN => n_162);
  g4354 : IOA21D0BWP7T port map(A1 => n_149, A2 => CH2_Vel(3), B => n_158, ZN => n_160);
  g4355 : ND2D0BWP7T port map(A1 => n_159, A2 => n_140, ZN => n_161);
  g4356 : IND2D0BWP7T port map(A1 => n_152, B1 => CH2_Amp(3), ZN => n_159);
  g4357 : CKND1BWP7T port map(I => n_156, ZN => n_157);
  g4358 : IND2D0BWP7T port map(A1 => n_155, B1 => CH2_Vel(1), ZN => n_158);
  g4359 : IND2D0BWP7T port map(A1 => n_155, B1 => CH2_Vel(3), ZN => n_156);
  g4360 : CKND1BWP7T port map(I => n_154, ZN => n_153);
  g4361 : IND2D0BWP7T port map(A1 => CH2_Vel(4), B1 => n_149, ZN => n_155);
  g4362 : ND2D0BWP7T port map(A1 => n_149, A2 => CH2_Vel(4), ZN => n_154);
  g4363 : IOA21D0BWP7T port map(A1 => n_141, A2 => CH2_Vel(3), B => n_142, ZN => n_151);
  g4364 : INR2D0BWP7T port map(A1 => n_146, B1 => CH2_Amp(2), ZN => n_152);
  g4365 : INVD1BWP7T port map(I => n_148, ZN => n_147);
  g4366 : AN2D1BWP7T port map(A1 => CH2_Amp(1), A2 => CH2_Amp(2), Z => n_150);
  g4367 : NR2D0BWP7T port map(A1 => CH2_Vel(6), A2 => CH2_Vel(5), ZN => n_149);
  g4368 : NR2D0BWP7T port map(A1 => CH2_Vel(6), A2 => n_142, ZN => n_148);
  g4369 : INR2D0BWP7T port map(A1 => CH2_Amp(2), B1 => CH2_Amp(1), ZN => n_144);
  g4370 : ND2D0BWP7T port map(A1 => CH2_Amp(1), A2 => CH2_Amp(0), ZN => n_146);
  g4371 : ND2D0BWP7T port map(A1 => CH2_Vel(6), A2 => CH2_Vel(5), ZN => n_145);
  g4372 : INVD0BWP7T port map(I => CH2_Amp(0), ZN => n_143);
  g4373 : INVD0BWP7T port map(I => CH2_Vel(5), ZN => n_142);
  g4374 : INVD0BWP7T port map(I => CH2_Vel(6), ZN => n_141);
  g4375 : INVD0BWP7T port map(I => CH2_Amp(4), ZN => n_140);
  g4376 : INVD0BWP7T port map(I => CH2_Amp(5), ZN => n_139);
  g4377 : INR3D0BWP7T port map(A1 => CH2_Vel(2), B1 => n_155, B2 => CH2_Vel(3), ZN => n_138);
  g4222 : OAI211D0BWP7T port map(A1 => n_72, A2 => n_127, B => n_137, C => n_105, ZN => n_298);
  g4378 : AOI221D0BWP7T port map(A1 => n_122, A2 => n_84, B1 => n_125, B2 => n_69, C => n_136, ZN => n_137);
  g4379 : OAI221D0BWP7T port map(A1 => n_132, A2 => n_85, B1 => n_78, B2 => n_127, C => n_135, ZN => n_297);
  g4380 : OAI221D0BWP7T port map(A1 => n_132, A2 => n_87, B1 => n_85, B2 => n_127, C => n_134, ZN => n_296);
  g4381 : OAI221D0BWP7T port map(A1 => n_132, A2 => n_72, B1 => n_78, B2 => n_121, C => n_133, ZN => n_299);
  g4382 : OAI22D0BWP7T port map(A1 => n_120, A2 => n_87, B1 => n_132, B2 => n_78, ZN => n_136);
  g4383 : OAI221D0BWP7T port map(A1 => n_120, A2 => n_78, B1 => n_85, B2 => n_126, C => n_131, ZN => n_300);
  g4384 : AOI221D0BWP7T port map(A1 => n_122, A2 => n_88, B1 => n_118, B2 => CH3_Vel(6), C => n_129, ZN => n_135);
  g4385 : AOI221D0BWP7T port map(A1 => n_123, A2 => CH3_Amp(0), B1 => n_113, B2 => n_79, C => n_128, ZN => n_134);
  g4386 : AOI31D0BWP7T port map(A1 => n_100, A2 => n_95, A3 => CH3_Vel(2), B => n_130, ZN => n_133);
  g4387 : OAI221D0BWP7T port map(A1 => n_120, A2 => n_72, B1 => n_78, B2 => n_126, C => n_104, ZN => n_301);
  g4388 : AO32D0BWP7T port map(A1 => n_100, A2 => n_79, A3 => CH3_Vel(4), B1 => n_125, B2 => CH3_Vel(6), Z => n_302);
  g4389 : AOI32D0BWP7T port map(A1 => n_100, A2 => n_88, A3 => CH3_Vel(2), B1 => n_122, B2 => CH3_Vel(6), ZN => n_131);
  g4390 : AOI221D0BWP7T port map(A1 => n_117, A2 => CH3_Amp(3), B1 => n_110, B2 => CH3_Amp(2), C => n_124, ZN => n_132);
  g4391 : OAI22D0BWP7T port map(A1 => n_120, A2 => n_85, B1 => n_126, B2 => n_87, ZN => n_130);
  g4392 : MOAI22D0BWP7T port map(A1 => n_126, A2 => n_96, B1 => n_119, B2 => n_69, ZN => n_129);
  g4393 : MOAI22D0BWP7T port map(A1 => n_120, A2 => n_96, B1 => n_122, B2 => n_69, ZN => n_128);
  g4394 : AOI222D0BWP7T port map(A1 => n_115, A2 => n_81, B1 => n_108, B2 => n_75, C1 => n_111, C2 => CH3_Amp(1), ZN => n_127);
  g4395 : INVD0BWP7T port map(I => n_126, ZN => n_125);
  g4396 : INR3D0BWP7T port map(A1 => n_115, B1 => CH3_Amp(2), B2 => CH3_Amp(3), ZN => n_124);
  g4397 : OAI21D0BWP7T port map(A1 => n_115, A2 => n_73, B => n_76, ZN => n_123);
  g4398 : AOI22D0BWP7T port map(A1 => n_108, A2 => n_103, B1 => n_114, B2 => CH3_Amp(5), ZN => n_126);
  g4399 : CKND1BWP7T port map(I => n_122, ZN => n_121);
  g4400 : INVD0BWP7T port map(I => n_120, ZN => n_119);
  g4401 : OAI21D0BWP7T port map(A1 => n_115, A2 => n_74, B => n_112, ZN => n_118);
  g4402 : MOAI22D0BWP7T port map(A1 => n_116, A2 => CH3_Amp(3), B1 => n_116, B2 => CH3_Amp(3), ZN => n_122);
  g4403 : AOI22D0BWP7T port map(A1 => n_108, A2 => n_106, B1 => n_109, B2 => CH3_Amp(4), ZN => n_120);
  g4404 : AO21D0BWP7T port map(A1 => n_108, A2 => n_83, B => n_81, Z => n_117);
  g4405 : ND2D0BWP7T port map(A1 => n_108, A2 => n_92, ZN => n_114);
  g4406 : OAI211D0BWP7T port map(A1 => CH3_Amp(4), A2 => n_93, B => n_108, C => n_98, ZN => n_116);
  g4407 : NR2D0BWP7T port map(A1 => n_107, A2 => n_77, ZN => n_115);
  g4408 : CKND1BWP7T port map(I => n_112, ZN => n_113);
  g4409 : OAI21D0BWP7T port map(A1 => CH3_Amp(0), A2 => CH3_Amp(2), B => n_108, ZN => n_111);
  g4410 : OAI21D0BWP7T port map(A1 => CH3_Amp(3), A2 => CH3_Amp(1), B => n_108, ZN => n_110);
  g4411 : AO221D0BWP7T port map(A1 => n_97, A2 => n_70, B1 => CH3_Amp(3), B2 => CH3_Amp(5), C => n_107, Z => n_109);
  g4412 : ND3D0BWP7T port map(A1 => n_108, A2 => CH3_Amp(1), A3 => n_74, ZN => n_112);
  g4413 : CKND1BWP7T port map(I => n_108, ZN => n_107);
  g4414 : ND2D0BWP7T port map(A1 => n_102, A2 => n_76, ZN => n_108);
  g4415 : OAI32D0BWP7T port map(A1 => n_70, A2 => CH3_Amp(3), A3 => n_94, B1 => CH3_Amp(4), B2 => n_101, ZN => n_106);
  g4416 : IND3D0BWP7T port map(A1 => n_96, B1 => CH3_Vel(0), B2 => n_100, ZN => n_105);
  g4417 : ND3D0BWP7T port map(A1 => n_100, A2 => n_84, A3 => CH3_Vel(3), ZN => n_104);
  g4418 : NR3D0BWP7T port map(A1 => n_97, A2 => CH3_Amp(5), A3 => n_71, ZN => n_103);
  g4419 : AOI222D0BWP7T port map(A1 => n_91, A2 => CH3_Vel(2), B1 => n_82, B2 => CH3_Vel(4), C1 => n_95, C2 => CH3_Vel(0), ZN => n_102);
  g4420 : NR2D0BWP7T port map(A1 => n_99, A2 => n_76, ZN => n_303);
  g4421 : MAOI22D0BWP7T port map(A1 => n_94, A2 => CH3_Amp(5), B1 => n_90, B2 => CH3_Amp(5), ZN => n_101);
  g4422 : INVD1BWP7T port map(I => n_99, ZN => n_100);
  g4423 : ND2D0BWP7T port map(A1 => n_93, A2 => CH3_Amp(4), ZN => n_98);
  g4424 : ND2D0BWP7T port map(A1 => n_92, A2 => CH3_Amp(5), ZN => n_99);
  g4425 : NR2D0BWP7T port map(A1 => n_93, A2 => CH3_Amp(3), ZN => n_97);
  g4426 : IND2D0BWP7T port map(A1 => CH3_Vel(2), B1 => n_95, ZN => n_96);
  g4427 : CKND1BWP7T port map(I => n_93, ZN => n_94);
  g4428 : NR2D0BWP7T port map(A1 => n_89, A2 => CH3_Vel(3), ZN => n_95);
  g4429 : IND2D0BWP7T port map(A1 => n_81, B1 => n_90, ZN => n_93);
  g4430 : IOA21D0BWP7T port map(A1 => n_80, A2 => CH3_Vel(3), B => n_89, ZN => n_91);
  g4431 : ND2D0BWP7T port map(A1 => n_90, A2 => n_71, ZN => n_92);
  g4278 : IND2D0BWP7T port map(A1 => n_83, B1 => CH3_Amp(3), ZN => n_90);
  g4432 : CKND1BWP7T port map(I => n_87, ZN => n_88);
  g4433 : IND2D0BWP7T port map(A1 => n_86, B1 => CH3_Vel(1), ZN => n_89);
  g4434 : IND2D0BWP7T port map(A1 => n_86, B1 => CH3_Vel(3), ZN => n_87);
  g4435 : CKND1BWP7T port map(I => n_85, ZN => n_84);
  g4436 : IND2D0BWP7T port map(A1 => CH3_Vel(4), B1 => n_80, ZN => n_86);
  g4437 : ND2D0BWP7T port map(A1 => n_80, A2 => CH3_Vel(4), ZN => n_85);
  g4438 : IOA21D0BWP7T port map(A1 => n_72, A2 => CH3_Vel(3), B => n_73, ZN => n_82);
  g4439 : INR2D0BWP7T port map(A1 => n_77, B1 => CH3_Amp(2), ZN => n_83);
  g4440 : INVD1BWP7T port map(I => n_79, ZN => n_78);
  g4441 : AN2D1BWP7T port map(A1 => CH3_Amp(1), A2 => CH3_Amp(2), Z => n_81);
  g4442 : NR2D0BWP7T port map(A1 => CH3_Vel(6), A2 => CH3_Vel(5), ZN => n_80);
  g4443 : NR2D0BWP7T port map(A1 => CH3_Vel(6), A2 => n_73, ZN => n_79);
  g4444 : INR2D0BWP7T port map(A1 => CH3_Amp(2), B1 => CH3_Amp(1), ZN => n_75);
  g4445 : ND2D0BWP7T port map(A1 => CH3_Amp(1), A2 => CH3_Amp(0), ZN => n_77);
  g4446 : ND2D0BWP7T port map(A1 => CH3_Vel(6), A2 => CH3_Vel(5), ZN => n_76);
  g4447 : INVD0BWP7T port map(I => CH3_Amp(0), ZN => n_74);
  g4448 : INVD0BWP7T port map(I => CH3_Vel(5), ZN => n_73);
  g4449 : INVD0BWP7T port map(I => CH3_Vel(6), ZN => n_72);
  g4298 : INVD0BWP7T port map(I => CH3_Amp(4), ZN => n_71);
  g4450 : INVD0BWP7T port map(I => CH3_Amp(5), ZN => n_70);
  g4451 : INR3D0BWP7T port map(A1 => CH3_Vel(2), B1 => n_86, B2 => CH3_Vel(3), ZN => n_69);
  g4452 : OAI211D0BWP7T port map(A1 => n_3, A2 => n_58, B => n_68, C => n_36, ZN => n_307);
  g4453 : AOI221D0BWP7T port map(A1 => n_53, A2 => n_15, B1 => n_56, B2 => n_0, C => n_67, ZN => n_68);
  g4454 : OAI221D0BWP7T port map(A1 => n_63, A2 => n_16, B1 => n_9, B2 => n_58, C => n_66, ZN => n_306);
  g4455 : OAI221D0BWP7T port map(A1 => n_63, A2 => n_18, B1 => n_16, B2 => n_58, C => n_65, ZN => n_305);
  g4456 : OAI221D0BWP7T port map(A1 => n_63, A2 => n_3, B1 => n_9, B2 => n_52, C => n_64, ZN => n_308);
  g4457 : OAI22D0BWP7T port map(A1 => n_51, A2 => n_18, B1 => n_63, B2 => n_9, ZN => n_67);
  g4458 : OAI221D0BWP7T port map(A1 => n_51, A2 => n_9, B1 => n_16, B2 => n_57, C => n_62, ZN => n_309);
  g4459 : AOI221D0BWP7T port map(A1 => n_53, A2 => n_19, B1 => n_49, B2 => CH4_Vel(6), C => n_60, ZN => n_66);
  g4460 : AOI221D0BWP7T port map(A1 => n_54, A2 => CH4_Amp(0), B1 => n_44, B2 => n_10, C => n_59, ZN => n_65);
  g4461 : AOI31D0BWP7T port map(A1 => n_31, A2 => n_26, A3 => CH4_Vel(2), B => n_61, ZN => n_64);
  g4462 : OAI221D0BWP7T port map(A1 => n_51, A2 => n_3, B1 => n_9, B2 => n_57, C => n_35, ZN => n_310);
  g4463 : AO32D0BWP7T port map(A1 => n_31, A2 => n_10, A3 => CH4_Vel(4), B1 => n_56, B2 => CH4_Vel(6), Z => n_311);
  g4464 : AOI32D0BWP7T port map(A1 => n_31, A2 => n_19, A3 => CH4_Vel(2), B1 => n_53, B2 => CH4_Vel(6), ZN => n_62);
  g4465 : AOI221D0BWP7T port map(A1 => n_48, A2 => CH4_Amp(3), B1 => n_41, B2 => CH4_Amp(2), C => n_55, ZN => n_63);
  g4466 : OAI22D0BWP7T port map(A1 => n_51, A2 => n_16, B1 => n_57, B2 => n_18, ZN => n_61);
  g4467 : MOAI22D0BWP7T port map(A1 => n_57, A2 => n_27, B1 => n_50, B2 => n_0, ZN => n_60);
  g4468 : MOAI22D0BWP7T port map(A1 => n_51, A2 => n_27, B1 => n_53, B2 => n_0, ZN => n_59);
  g4469 : AOI222D0BWP7T port map(A1 => n_46, A2 => n_12, B1 => n_39, B2 => n_6, C1 => n_42, C2 => CH4_Amp(1), ZN => n_58);
  g4470 : INVD0BWP7T port map(I => n_57, ZN => n_56);
  g4471 : INR3D0BWP7T port map(A1 => n_46, B1 => CH4_Amp(2), B2 => CH4_Amp(3), ZN => n_55);
  g4472 : OAI21D0BWP7T port map(A1 => n_46, A2 => n_4, B => n_7, ZN => n_54);
  g4473 : AOI22D0BWP7T port map(A1 => n_39, A2 => n_34, B1 => n_45, B2 => CH4_Amp(5), ZN => n_57);
  g4474 : CKND1BWP7T port map(I => n_53, ZN => n_52);
  g4475 : INVD0BWP7T port map(I => n_51, ZN => n_50);
  g4476 : OAI21D0BWP7T port map(A1 => n_46, A2 => n_5, B => n_43, ZN => n_49);
  g4477 : MOAI22D0BWP7T port map(A1 => n_47, A2 => CH4_Amp(3), B1 => n_47, B2 => CH4_Amp(3), ZN => n_53);
  g4478 : AOI22D0BWP7T port map(A1 => n_39, A2 => n_37, B1 => n_40, B2 => CH4_Amp(4), ZN => n_51);
  g4479 : AO21D0BWP7T port map(A1 => n_39, A2 => n_14, B => n_12, Z => n_48);
  g4480 : ND2D0BWP7T port map(A1 => n_39, A2 => n_23, ZN => n_45);
  g4481 : OAI211D0BWP7T port map(A1 => CH4_Amp(4), A2 => n_24, B => n_39, C => n_29, ZN => n_47);
  g4482 : NR2D0BWP7T port map(A1 => n_38, A2 => n_8, ZN => n_46);
  g4483 : CKND1BWP7T port map(I => n_43, ZN => n_44);
  g4484 : OAI21D0BWP7T port map(A1 => CH4_Amp(0), A2 => CH4_Amp(2), B => n_39, ZN => n_42);
  g4485 : OAI21D0BWP7T port map(A1 => CH4_Amp(3), A2 => CH4_Amp(1), B => n_39, ZN => n_41);
  g4486 : AO221D0BWP7T port map(A1 => n_28, A2 => n_1, B1 => CH4_Amp(3), B2 => CH4_Amp(5), C => n_38, Z => n_40);
  g4487 : ND3D0BWP7T port map(A1 => n_39, A2 => CH4_Amp(1), A3 => n_5, ZN => n_43);
  g4488 : CKND1BWP7T port map(I => n_39, ZN => n_38);
  g4489 : ND2D0BWP7T port map(A1 => n_33, A2 => n_7, ZN => n_39);
  g4490 : OAI32D0BWP7T port map(A1 => n_1, A2 => CH4_Amp(3), A3 => n_25, B1 => CH4_Amp(4), B2 => n_32, ZN => n_37);
  g4491 : IND3D0BWP7T port map(A1 => n_27, B1 => CH4_Vel(0), B2 => n_31, ZN => n_36);
  g4492 : ND3D0BWP7T port map(A1 => n_31, A2 => n_15, A3 => CH4_Vel(3), ZN => n_35);
  g4493 : NR3D0BWP7T port map(A1 => n_28, A2 => CH4_Amp(5), A3 => n_2, ZN => n_34);
  g4494 : AOI222D0BWP7T port map(A1 => n_22, A2 => CH4_Vel(2), B1 => n_13, B2 => CH4_Vel(4), C1 => n_26, C2 => CH4_Vel(0), ZN => n_33);
  g4495 : NR2D0BWP7T port map(A1 => n_30, A2 => n_7, ZN => n_312);
  g4496 : MAOI22D0BWP7T port map(A1 => n_25, A2 => CH4_Amp(5), B1 => n_21, B2 => CH4_Amp(5), ZN => n_32);
  g4497 : INVD1BWP7T port map(I => n_30, ZN => n_31);
  g4498 : ND2D0BWP7T port map(A1 => n_24, A2 => CH4_Amp(4), ZN => n_29);
  g4499 : ND2D0BWP7T port map(A1 => n_23, A2 => CH4_Amp(5), ZN => n_30);
  g4500 : NR2D0BWP7T port map(A1 => n_24, A2 => CH4_Amp(3), ZN => n_28);
  g4501 : IND2D0BWP7T port map(A1 => CH4_Vel(2), B1 => n_26, ZN => n_27);
  g4502 : CKND1BWP7T port map(I => n_24, ZN => n_25);
  g4503 : NR2D0BWP7T port map(A1 => n_20, A2 => CH4_Vel(3), ZN => n_26);
  g4504 : IND2D0BWP7T port map(A1 => n_12, B1 => n_21, ZN => n_24);
  g4505 : IOA21D0BWP7T port map(A1 => n_11, A2 => CH4_Vel(3), B => n_20, ZN => n_22);
  g4506 : ND2D0BWP7T port map(A1 => n_21, A2 => n_2, ZN => n_23);
  g4507 : IND2D0BWP7T port map(A1 => n_14, B1 => CH4_Amp(3), ZN => n_21);
  g4508 : CKND1BWP7T port map(I => n_18, ZN => n_19);
  g4509 : IND2D0BWP7T port map(A1 => n_17, B1 => CH4_Vel(1), ZN => n_20);
  g4510 : IND2D0BWP7T port map(A1 => n_17, B1 => CH4_Vel(3), ZN => n_18);
  g4511 : CKND1BWP7T port map(I => n_16, ZN => n_15);
  g4512 : IND2D0BWP7T port map(A1 => CH4_Vel(4), B1 => n_11, ZN => n_17);
  g4513 : ND2D0BWP7T port map(A1 => n_11, A2 => CH4_Vel(4), ZN => n_16);
  g4514 : IOA21D0BWP7T port map(A1 => n_3, A2 => CH4_Vel(3), B => n_4, ZN => n_13);
  g4515 : INR2D0BWP7T port map(A1 => n_8, B1 => CH4_Amp(2), ZN => n_14);
  g4516 : INVD1BWP7T port map(I => n_10, ZN => n_9);
  g4517 : AN2D1BWP7T port map(A1 => CH4_Amp(1), A2 => CH4_Amp(2), Z => n_12);
  g4518 : NR2D0BWP7T port map(A1 => CH4_Vel(6), A2 => CH4_Vel(5), ZN => n_11);
  g4519 : NR2D0BWP7T port map(A1 => CH4_Vel(6), A2 => n_4, ZN => n_10);
  g4520 : INR2D0BWP7T port map(A1 => CH4_Amp(2), B1 => CH4_Amp(1), ZN => n_6);
  g4521 : ND2D0BWP7T port map(A1 => CH4_Amp(1), A2 => CH4_Amp(0), ZN => n_8);
  g4522 : ND2D0BWP7T port map(A1 => CH4_Vel(6), A2 => CH4_Vel(5), ZN => n_7);
  g4523 : INVD0BWP7T port map(I => CH4_Amp(0), ZN => n_5);
  g4524 : INVD0BWP7T port map(I => CH4_Vel(5), ZN => n_4);
  g4525 : INVD0BWP7T port map(I => CH4_Vel(6), ZN => n_3);
  g4526 : INVD0BWP7T port map(I => CH4_Amp(4), ZN => n_2);
  g4527 : INVD0BWP7T port map(I => CH4_Amp(5), ZN => n_1);
  g4528 : INR3D0BWP7T port map(A1 => CH4_Vel(2), B1 => n_17, B2 => CH4_Vel(3), ZN => n_0);
  csa_tree_ADD_UNS_OP_pad_groupi_g573 : FA1D0BWP7T port map(A => csa_tree_ADD_UNS_OP_pad_groupi_n_15, B => csa_tree_ADD_UNS_OP_pad_groupi_n_37, CI => csa_tree_ADD_UNS_OP_pad_groupi_n_53, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_55, S => csa_tree_ADD_UNS_OP_pad_groupi_n_56);
  csa_tree_ADD_UNS_OP_pad_groupi_g574 : FA1D0BWP7T port map(A => csa_tree_ADD_UNS_OP_pad_groupi_n_41, B => csa_tree_ADD_UNS_OP_pad_groupi_n_38, CI => csa_tree_ADD_UNS_OP_pad_groupi_n_51, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_53, S => csa_tree_ADD_UNS_OP_pad_groupi_n_54);
  csa_tree_ADD_UNS_OP_pad_groupi_g575 : FA1D0BWP7T port map(A => csa_tree_ADD_UNS_OP_pad_groupi_n_33, B => csa_tree_ADD_UNS_OP_pad_groupi_n_42, CI => csa_tree_ADD_UNS_OP_pad_groupi_n_49, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_51, S => csa_tree_ADD_UNS_OP_pad_groupi_n_52);
  csa_tree_ADD_UNS_OP_pad_groupi_g576 : FA1D0BWP7T port map(A => csa_tree_ADD_UNS_OP_pad_groupi_n_39, B => csa_tree_ADD_UNS_OP_pad_groupi_n_34, CI => csa_tree_ADD_UNS_OP_pad_groupi_n_47, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_49, S => csa_tree_ADD_UNS_OP_pad_groupi_n_50);
  csa_tree_ADD_UNS_OP_pad_groupi_g577 : FA1D0BWP7T port map(A => csa_tree_ADD_UNS_OP_pad_groupi_n_35, B => csa_tree_ADD_UNS_OP_pad_groupi_n_40, CI => csa_tree_ADD_UNS_OP_pad_groupi_n_45, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_47, S => csa_tree_ADD_UNS_OP_pad_groupi_n_48);
  csa_tree_ADD_UNS_OP_pad_groupi_g578 : FA1D0BWP7T port map(A => csa_tree_ADD_UNS_OP_pad_groupi_n_36, B => csa_tree_ADD_UNS_OP_pad_groupi_n_31, CI => csa_tree_ADD_UNS_OP_pad_groupi_n_43, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_45, S => csa_tree_ADD_UNS_OP_pad_groupi_n_46);
  csa_tree_ADD_UNS_OP_pad_groupi_g579 : FA1D0BWP7T port map(A => csa_tree_ADD_UNS_OP_pad_groupi_n_30, B => csa_tree_ADD_UNS_OP_pad_groupi_n_17, CI => csa_tree_ADD_UNS_OP_pad_groupi_n_32, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_43, S => csa_tree_ADD_UNS_OP_pad_groupi_n_44);
  csa_tree_ADD_UNS_OP_pad_groupi_g580 : FA1D0BWP7T port map(A => csa_tree_ADD_UNS_OP_pad_groupi_n_21, B => n_293, CI => csa_tree_ADD_UNS_OP_pad_groupi_n_26, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_41, S => csa_tree_ADD_UNS_OP_pad_groupi_n_42);
  csa_tree_ADD_UNS_OP_pad_groupi_g581 : FA1D0BWP7T port map(A => csa_tree_ADD_UNS_OP_pad_groupi_n_25, B => n_291, CI => csa_tree_ADD_UNS_OP_pad_groupi_n_28, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_39, S => csa_tree_ADD_UNS_OP_pad_groupi_n_40);
  csa_tree_ADD_UNS_OP_pad_groupi_g582 : FA1D0BWP7T port map(A => csa_tree_ADD_UNS_OP_pad_groupi_n_16, B => n_294, CI => csa_tree_ADD_UNS_OP_pad_groupi_n_20, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_37, S => csa_tree_ADD_UNS_OP_pad_groupi_n_38);
  csa_tree_ADD_UNS_OP_pad_groupi_g583 : FA1D0BWP7T port map(A => csa_tree_ADD_UNS_OP_pad_groupi_n_22, B => n_290, CI => csa_tree_ADD_UNS_OP_pad_groupi_n_29, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_35, S => csa_tree_ADD_UNS_OP_pad_groupi_n_36);
  csa_tree_ADD_UNS_OP_pad_groupi_g584 : FA1D0BWP7T port map(A => csa_tree_ADD_UNS_OP_pad_groupi_n_24, B => n_292, CI => csa_tree_ADD_UNS_OP_pad_groupi_n_27, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_33, S => csa_tree_ADD_UNS_OP_pad_groupi_n_34);
  csa_tree_ADD_UNS_OP_pad_groupi_g585 : FA1D0BWP7T port map(A => csa_tree_ADD_UNS_OP_pad_groupi_n_10, B => n_289, CI => csa_tree_ADD_UNS_OP_pad_groupi_n_23, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_31, S => csa_tree_ADD_UNS_OP_pad_groupi_n_32);
  csa_tree_ADD_UNS_OP_pad_groupi_g586 : MAOI222D0BWP7T port map(A => csa_tree_ADD_UNS_OP_pad_groupi_n_14, B => csa_tree_ADD_UNS_OP_pad_groupi_n_11, C => csa_tree_ADD_UNS_OP_pad_groupi_n_19, ZN => csa_tree_ADD_UNS_OP_pad_groupi_n_30);
  csa_tree_ADD_UNS_OP_pad_groupi_g587 : FA1D0BWP7T port map(A => n_299, B => n_308, CI => n_281, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_28, S => csa_tree_ADD_UNS_OP_pad_groupi_n_29);
  csa_tree_ADD_UNS_OP_pad_groupi_g588 : FA1D0BWP7T port map(A => n_301, B => n_310, CI => n_283, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_26, S => csa_tree_ADD_UNS_OP_pad_groupi_n_27);
  csa_tree_ADD_UNS_OP_pad_groupi_g589 : FA1D0BWP7T port map(A => n_300, B => n_309, CI => n_282, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_24, S => csa_tree_ADD_UNS_OP_pad_groupi_n_25);
  csa_tree_ADD_UNS_OP_pad_groupi_g590 : FA1D0BWP7T port map(A => n_298, B => n_307, CI => n_280, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_22, S => csa_tree_ADD_UNS_OP_pad_groupi_n_23);
  csa_tree_ADD_UNS_OP_pad_groupi_g591 : FA1D0BWP7T port map(A => n_302, B => n_311, CI => n_284, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_20, S => csa_tree_ADD_UNS_OP_pad_groupi_n_21);
  csa_tree_ADD_UNS_OP_pad_groupi_g592 : CKND1BWP7T port map(I => csa_tree_ADD_UNS_OP_pad_groupi_n_18, ZN => csa_tree_ADD_UNS_OP_pad_groupi_n_19);
  csa_tree_ADD_UNS_OP_pad_groupi_g593 : FA1D0BWP7T port map(A => n_279, B => n_288, CI => csa_tree_ADD_UNS_OP_pad_groupi_n_12, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_17, S => csa_tree_ADD_UNS_OP_pad_groupi_n_18);
  csa_tree_ADD_UNS_OP_pad_groupi_g594 : FA1D0BWP7T port map(A => n_303, B => n_312, CI => n_285, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_15, S => csa_tree_ADD_UNS_OP_pad_groupi_n_16);
  csa_tree_ADD_UNS_OP_pad_groupi_g595 : MAOI222D0BWP7T port map(A => n_296, B => n_287, C => csa_tree_ADD_UNS_OP_pad_groupi_n_13, ZN => csa_tree_ADD_UNS_OP_pad_groupi_n_14);
  csa_tree_ADD_UNS_OP_pad_groupi_g596 : HA1D0BWP7T port map(A => n_305, B => n_278, CO => csa_tree_ADD_UNS_OP_pad_groupi_n_12, S => csa_tree_ADD_UNS_OP_pad_groupi_n_13);
  csa_tree_ADD_UNS_OP_pad_groupi_g597 : AOI21D0BWP7T port map(A1 => n_297, A2 => n_306, B => csa_tree_ADD_UNS_OP_pad_groupi_n_9, ZN => csa_tree_ADD_UNS_OP_pad_groupi_n_11);
  csa_tree_ADD_UNS_OP_pad_groupi_g598 : CKND1BWP7T port map(I => csa_tree_ADD_UNS_OP_pad_groupi_n_9, ZN => csa_tree_ADD_UNS_OP_pad_groupi_n_10);
  csa_tree_ADD_UNS_OP_pad_groupi_g599 : NR2D0BWP7T port map(A1 => n_306, A2 => n_297, ZN => csa_tree_ADD_UNS_OP_pad_groupi_n_9);
  csa_tree_ADD_UNS_OP_pad_groupi_drc_bufs : BUFFD4BWP7T port map(I => csa_tree_ADD_UNS_OP_pad_groupi_n_56, Z => Math_Out(6));
  csa_tree_ADD_UNS_OP_pad_groupi_drc_bufs600 : BUFFD4BWP7T port map(I => csa_tree_ADD_UNS_OP_pad_groupi_n_52, Z => Math_Out(4));
  csa_tree_ADD_UNS_OP_pad_groupi_drc_bufs601 : BUFFD4BWP7T port map(I => csa_tree_ADD_UNS_OP_pad_groupi_n_46, Z => Math_Out(1));
  csa_tree_ADD_UNS_OP_pad_groupi_drc_bufs602 : BUFFD4BWP7T port map(I => csa_tree_ADD_UNS_OP_pad_groupi_n_48, Z => Math_Out(2));
  csa_tree_ADD_UNS_OP_pad_groupi_drc_bufs603 : BUFFD4BWP7T port map(I => csa_tree_ADD_UNS_OP_pad_groupi_n_50, Z => Math_Out(3));
  csa_tree_ADD_UNS_OP_pad_groupi_drc_bufs604 : BUFFD4BWP7T port map(I => csa_tree_ADD_UNS_OP_pad_groupi_n_44, Z => Math_Out(0));
  csa_tree_ADD_UNS_OP_pad_groupi_drc_bufs605 : BUFFD4BWP7T port map(I => csa_tree_ADD_UNS_OP_pad_groupi_n_54, Z => Math_Out(5));
  csa_tree_ADD_UNS_OP_pad_groupi_drc_bufs606 : BUFFD4BWP7T port map(I => csa_tree_ADD_UNS_OP_pad_groupi_n_55, Z => Math_Out(7));

end synthesised;
