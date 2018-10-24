module register(out,load,d_in,clk);
input clk,load;
input[15:0] d_in;
output[15:0] out;

binary_cell n1[15:0](out,load,d_in,clk);

endmodule
//test
module regs_s;
reg[15:0] d_in;
reg load,clk;
wire[15:0] out;
register n1(out,load,d_in,clk);
initial
begin
	// initialize
	load = 1;
	d_in = 16'b0; #2;
	clk = 0; #2; clk = 1;#2; clk = 0;
	load = 0;
	#10;

	// check load
	load = 1; #2;
	d_in = 1234;
	clk = 0; #2; clk = 1;#2; clk = 0;
	load = 0;
	#10;

	// check not load
	clk = 0; #2; clk = 1;#2; clk = 0;
	clk = 0; #2; clk = 1;#2; clk = 0;
	
end

endmodule
