configuration channel_op_behaviour_cfg of channel_op is
   for behaviour
      for all: adder_7x7 use configuration work.adder_7x7_behavioral_cfg;
      end for;
      for all: input_sel use configuration work.input_sel_behavioral_cfg;
      end for;
      for all: var_shift use configuration work.var_shift_behavioral_cfg;
      end for;
   end for;
end channel_op_behaviour_cfg;
