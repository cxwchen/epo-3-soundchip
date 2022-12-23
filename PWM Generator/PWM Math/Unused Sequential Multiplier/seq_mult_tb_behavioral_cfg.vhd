configuration seq_mult_tb_behavioral_cfg of seq_mult_tb is
   for behavioral
      for all: seq_mult use configuration work.seq_mult_behavioral_cfg;
      end for;
   end for;
end seq_mult_tb_behavioral_cfg;
