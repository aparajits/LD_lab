module mux_16(z,s,a,b);
input[15:0] a,b;
output[15:0] z;
input s;

mux n1[15:0](z,s,a,b);

endmodule
//test
module mux_16_s;
reg[15:0] a,b;
reg s;
wire[15:0] z;

mux_16 n1(z,s,a,b);
initial
	begin
	a=11; b=10; s=0;#10;
	a=11; b=10; s=1; #10;
	end
endmodule	
