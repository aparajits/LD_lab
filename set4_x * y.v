module x_m_y(out,reset,ready,x,y,clk);
input reset,clk;
input[15:0] x,y;
output[15:0] out;
output ready;
wire[15:0] pc_out,mux_out,adder_out;
wire reset_bar,ready_bar;

nand_not n1(reset_bar,reset);
nand_not n2(ready_bar,ready);

pc n3(pc_out,reset,0,ready_bar,16'b0,clk);
comparator_16bit n4( ,ready, ,pc_out,y,reset,reset_bar,0);

mux_16 n5(mux_out,reset,adder_out,16'b0);
binary_adder_16bit n7(adder_out,,x,out,0);

register n6(out,ready_bar,mux_out,clk);

endmodule
//test

module x_m_y_s;
reg[15:0] x,y;
reg clk,reset;
wire[15:0] out;
wire ready;
x_m_y n1(out,reset,ready,x,y,clk);
initial
begin
	x=123; y=456;
	reset = 1; #2;
    	clk = 0; #2; clk = 1; #2; clk = 0; #2;
    	reset = 0; #2;
    	#10;

    while(ready == 0) begin
        clk = 0; #2; clk = 1; #2; clk=0; #2;
    end
	#10;
	clk = 0; #2; clk = 1; #2; clk=0; #2;
	clk = 0; #2; clk = 1; #2; clk=0; #2;
	
end
endmodule
