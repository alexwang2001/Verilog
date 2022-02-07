/*----------------------------------
  Double edge D filp-flop
  gate level design
  by Alex Wang
-----------------------------------*/

module DFF_double_edge (
    input clk,
    input d,
    output q
);
  wire q_pos_mas, q_pos_mas_bar; 
  wire q_pos_sla, q_pos_sla_bar;
  wire q_neg_mas, q_neg_mas_bar;
  wire q_neg_sla, q_neg_sla_bar;

  sr_latch sr0(d, ~d, clk, q_neg_mas, q_neg_mas_bar);
  sr_latch sr1(q_neg_mas, q_neg_mas_bar, ~clk, q_neg_sla, q_neg_sla_bar);
  sr_latch sr2(d, ~d, ~clk, q_pos_mas, q_neg_pos_bar);
  sr_latch sr3(q_pos_mas, q_pos_mas_bar, clk, q_pos_sla, q_pos_sla_bar);
  
  assign q = clk? q_pos_sla : q_neg_sla;

endmodule


module sr_latch(
  input s,
  input r,
  input ena,
  output Q,
  output Q_bar
);
  wire s_in, r_in;
  assign s_in = s & ena;
  assign r_in = r & ena;

  nor nors(Q, s_in, Q_bar);
  nor norr(Q_bar, r_in, Q);

endmodule