module pc(out,reset,load,inc,d_in,clk);
input[15:0] d_in;
input reset,load,inc,clk;
output[15:0] out;
wire[15:0] p,out_inc,out_reset,out_load;
wire q,s;

binary_adder_16bit n1(p,,out,1,0);
mux_16 n2(out_inc,inc,out,p);
mux_16 n3(out_load,load,out_inc,d_in);
mux_16 n4(out_reset,reset,out_load,16'b0);
nand_or n5(s,load,inc);
nand_or n6(q,s,reset);
register n7(out,q,out_reset,clk);

endmodule
//test
module pc_s_n;
reg[15:0] d_in;
reg reset,load,inc,clk;
wire[15:0] out;
pc n1(out,reset,load,inc,d_in,clk);
initial
begin
	
	//reset
	reset = 1; load = 0; inc = 0;
	d_in = 1123; #2;
	clk = 0; #2; clk = 1; #2; clk = 0;
	#10;

	// increment
	reset = 0; inc = 1;
	d_in = 2345; #2;
	clk = 0; #2; clk = 1; #2; clk = 0;
	clk = 0; #2; clk = 1; #2; clk = 0;
	clk = 0; #2; clk = 1; #2; clk = 0;
	#10;

	// load
	reset = 0; load = 1; inc = 0;
	d_in = 5678; #2;
	clk = 0; #2; clk = 1; #2; clk = 0;
	#10;

	// store
	reset = 0; load = 0; inc = 0;
	d_in = 9876; #2;
	clk = 0; #2; clk = 1; #2; clk = 0;
	#10;
end

endmodule
