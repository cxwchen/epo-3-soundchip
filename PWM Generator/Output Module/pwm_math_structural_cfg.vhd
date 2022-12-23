configuration pwm_math_structural_cfg of pwm_math is
   for structural
      for all: channel_op use configuration work.channel_op_behaviour_cfg;
      end for;
      for all: channel_adder use configuration work.channel_adder_behavioral_cfg;
      end for;
   end for;
end pwm_math_structural_cfg;
