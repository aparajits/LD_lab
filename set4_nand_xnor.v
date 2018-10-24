module nand_xnor(c,a,b);
input a,b;
output c;
wire p;
nand_xor n1(p,a,b);
nand n2(c,p,p);
endmodule
//test
module nand_xnor_s;
reg a,b;
wire c;
nand_xnor n1(c,a,b);
initial
	begin
	a=0; b=0; #10;
	a=1; b=0; #10;
	a=0; b=1; #10;
	a=1; b=1; #10;
	end
endmodule
