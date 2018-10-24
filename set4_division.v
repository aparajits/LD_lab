module x_d_y(out,ready,reset,x,y,clk);
input clk,reset;
input[15:0] x,y;
output ready;
output[15:0] out;
wire[15:0] out,mux_out,subs_out,x_out,y_out;
wire reset_bar,ready_bar;
register n8(x_out,reset,x,~clk);
register n9(y_out,reset,y,~clk);
nand_not n3(ready_bar,ready);
nand_not n4(reset_bar,reset);

//pc n1(pc_out,reset,1'b0,ready_bar,16'b0,clk);
comparator_16bit n2( , ,ready,out,y_out,reset,reset_bar,0);
register n5(out,ready_bar,mux_out,clk);
mux_16 n6(mux_out,reset,subs_out,x_out);
alu n7(subs_out,0,1,0,0,1,1,out,y_out);

endmodule
//test

module x_d_y_s;
reg[15:0] x,y;
reg reset,clk;
wire[15:0] out;
wire ready;
x_d_y n1(out,ready,reset,x,y,clk);
initial
begin
	x=123; y=11;
	reset=1; #2;
	clk=0; #2; clk=1; #2; clk=0; #2;
	//clk=0; #2; clk=1; #2; clk=0; #2;
	reset=0; #5;
	x=0; y=0;
	while(ready == 0)
	begin
	clk=0; #2; clk=1; #2; clk=0; #2;
	end
	#10;
	clk=0; #2; clk=1; #2; clk=0; #2;
	clk=0; #2; clk=1; #2; clk=0; #2;
	
	
	
end
endmodule
