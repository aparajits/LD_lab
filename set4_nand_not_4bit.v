module nand_not_4bit(c,a);
input[4:0] a;
output[4:0] c;
nand_not n1[4:0](c,a);
endmodule
