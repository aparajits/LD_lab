module comparator(aGb,aEb,aLb,a,b,aGb_in,aEb_in,aLb_in);
input aLb_in,aGb_in,aEb_in,a,b;
output aLb,aGb,aEb;
wire a_bar,b_bar,q,aLbs,aGbs;
nand_not n1(a_bar,a);
nand_not n2(b_bar,b);

nand_and_3in n3(aLbs,a_bar,b,aEb_in);
nand_or n7(aLb,aLbs,aLb_in);

nand_xnor n4(q,a,b);
nand_and n6(aEb,q,aEb_in);

nand_and_3in n5(aGbs,a,b_bar,aEb_in);
nand_or n8(aGb,aGbs,aGb_in);

endmodule
//test
module comparator_s;
reg aLb_in,aGb_in,aEb_in,a,b;
wire aLb,aGb,aEb;
comparator n1(aGb,aEb,aLb,a,b,aGb_in,aEb_in,aLb_in);
initial
	begin	
	aLb_in=0; aGb_in=0; aEb_in=1; #20;
	a=1;b=0; #5;
	a=0; b=1; #5;
	a=1; b=1; #5;
	end
endmodule
