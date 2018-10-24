module mux(z,s,a,b);
input a,b,s;
output z;
wire s_bar,p,q;

nand_not n1(s_bar,s);
nand_and n2(p,s_bar,a);
nand_and n3(q,s,b);
nand_or n4(z,p,q);

endmodule
