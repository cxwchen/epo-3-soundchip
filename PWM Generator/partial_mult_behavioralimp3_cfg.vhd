configuration partial_mult_behavioralimp3_cfg of partial_mult is
   for behavioralimp3
      for all: adder5x4 use configuration work.adder5x4_behavioral_cfg;
      end for;
      for all: vel_shifter use configuration work.vel_shifter_behavioral_cfg;
      end for;
   end for;
end partial_mult_behavioralimp3_cfg;
