configuration partial_mult_tb_behaviour_cfg of partial_mult_tb is
   for behaviour
      for all: partial_mult use configuration work.partial_mult_behavioralimp3_cfg;
      end for;
   end for;
end partial_mult_tb_behaviour_cfg;
