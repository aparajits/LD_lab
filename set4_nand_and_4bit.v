module nand_and_16(c,a,b);
input[15:0] a,b;
output[15:0] c;
nand_and n1[15:0](c,a,b);
endmodule
