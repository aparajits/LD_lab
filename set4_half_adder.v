module half_adder(s,c_out,a,b);
input a,b;
output s,c_out;

nand_xor n1(s,a,b);
nand_and n2(c_out,a,b);

endmodule
