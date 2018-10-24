module nand_xor(c,a,b);
input a,b;
output c;
wire p,r,q;
nand n1(p,a,b);
nand n2(q,a,p);
nand n3(r,b,p);
nand n4(c,q,r);
endmodule

module nand_xor_s;
reg a,b;
wire c;
nand_xor n1(c,a,b);
initial
	begin
	a=1; b=0; #10;
	a=0; b=0; #10; 
	a=0; b=1; #10;
	a=1; b=1; #10;	
	end
endmodule
