module nand_and(c,a,b);
input a,b;
output c;
wire p;
nand n1(p,a,b);
nand n2(c,p,p);
endmodule
