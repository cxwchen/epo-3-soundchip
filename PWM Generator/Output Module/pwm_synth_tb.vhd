configuration pwm_synth_tb of pwm_math_tb is
   for behavioral
      for all: pwm_math use configuration work.pwm_math_synthesised_cfg;
      end for;
   end for;
end pwm_synth_tb;
