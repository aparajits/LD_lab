module negator(a_b,a);
input[15:0] a;
output[15:0] a_b;

nand_not n1[15:0](a_b,a);

endmodule
//test

module negator_sn;
reg[15:0] a;
wire[15:0] c;

negator n1(c,a);
initial
	begin
	a=1100; #10;
	a=0; #10;
	end
endmodule
