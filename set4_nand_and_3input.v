module nand_and_3in(z,a,b,c);
input a,b,c;
output z;
wire p;
nand_and n1(p,a,b);
nand_and n2(z,c,p);
endmodule
//test
module nand_and_3in_s;
reg a,b,c;
wire z;
nand_and_3in n1(z,a,b,c);
initial
begin
	a=1;
	b=0; c=1; #5;
	b=0; c=0; #2;
	b=1; c=0; #3;
	b=1; c=1; #23;
end
endmodule
