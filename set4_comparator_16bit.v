module comparator_16bit(GT,EQ,LT,a,b,GT_in,EQ_in,LT_in);
input[15:0] a,b;
output LT,EQ,GT;
input LT_in,GT_in,EQ_in;
wire[16:0] LT_I,GT_I,EQ_I;


comparator n1[15:0](
	GT_I[15:0],EQ_I[15:0],LT_I[15:0],
	a[15:0],b[15:0],
	GT_I[16:1],EQ_I[16:1],LT_I[16:1]
);
nand_and n2(LT_I[16],LT_in,1);
nand_and n3(EQ_I[16],EQ_in,1);
nand_and n4(GT_I[16],GT_in,1);

nand_not n5(LT,~LT_I[0]);
nand_not n6(EQ,~EQ_I[0]);
nand_not n7(GT,~GT_I[0]);
endmodule

//test
module cpm_16_s;
reg[15:0] A,B;
reg GT_IN,EQ_IN,LT_IN;
wire gt,lt,eq;
comparator_16bit n1(gt,eq,lt,A,B,GT_IN,EQ_IN,LT_IN);

initial
	begin
	// reset
    GT_IN = 0; EQ_IN = 1; LT_IN = 0;
    A = 32010; B = 32010;
    #10;
    A = 15123; B = 5123;
    #10;
    A = 16'b111001000; B = 16'b0;
    #10;
    A = 0; B = 0;
    #10;

    GT_IN = 0; EQ_IN = 0; LT_IN = 1;
    A = 32010; B = 32010;
    #10;
    A = 15123; B = 5123;
    #10;
    A = 12321; B = 65535;
    #10;
    A = 0; B = 0;
    #10;

    GT_IN = 1; EQ_IN = 0; LT_IN = 0;
    A = 32010; B = 32010;
    #10;
    A = 15123; B = 5123;
    #10;
    A = 12321; B = 65535;
    #10;
    A = 0; B = 0;
    #10;

end
endmodule
	
