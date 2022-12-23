configuration pwm_math_tb_behavioral_cfg of pwm_math_tb is
   for behavioral
      for all: pwm_math use configuration work.pwm_math_structural_cfg;
      end for;
   end for;
end pwm_math_tb_behavioral_cfg;
