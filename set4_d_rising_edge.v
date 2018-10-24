module d_rising(q,q_bar,d,clk);
input d,clk;
output q,q_bar;
wire p,clk;

nand_not n2(clk_bar,clk); 
d_latch n1(p, ,d,clk_bar);
d_latch n3(q,q_bar,p,clk);

endmodule
//test
module d_rising_s;
reg d,clk;
wire q,q_bar;
d_rising n1(q,q_bar,d,clk);
initial
	begin
	d=1;
	clk=0; #2;
	clk=1; #2;
	clk=1; #2;
	clk=0; #2;
	d=0;
	clk=1; #2;
	clk=0; #2;
	clk=1; #2;
	clk=1; #2;
	clk=0; #2;
	end
endmodule
