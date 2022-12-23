configuration channel_op_tb_behaviour_cfg of channel_op_tb is
   for behaviour
      for all: channel_op use configuration work.channel_op_behaviour_cfg;
      end for;
   end for;
end channel_op_tb_behaviour_cfg;
