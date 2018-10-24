module d_latch(q,q_bar,d,clk);
input d,clk;
output q,q_bar;

nand n1(p,d,clk);
nand_not n2(d_bar,d);
nand n3(t,clk,d_bar);
nand n4(q,q_bar,p);
nand n5(q_bar,t,q);

endmodule
