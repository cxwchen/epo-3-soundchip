configuration input_sel_tb_behaviour_cfg of input_sel_tb is
   for behaviour
      for all: input_sel use configuration work.input_sel_behavioral_cfg;
      end for;
   end for;
end input_sel_tb_behaviour_cfg;
