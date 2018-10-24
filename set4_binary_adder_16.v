module binary_adder_16bit(s,c_out,a,b,c_in);
input[16:0] a,b;
input c_in;
output[16:0] s;
output c_out;
wire[2:0] r;

binary_adder n1(s[3:0],r[0],a[3:0],b[3:0],c_in);
binary_adder n2(s[7:4],r[1],a[7:4],b[7:4],r[0]);
binary_adder n3(s[11:8],r[2],a[11:8],b[11:8],r[1]);
binary_adder n4(s[15:12],c_out,a[15:12],b[15:12],r[2]);

endmodule
//test

module binary_adder_16b;
reg[15:0] a,b;
wire[15:0] s;

binary_adder_16bit n1(s, ,a,b,0);
initial
	begin
	a=100; b=111; #10;
	a=0; b=111; #10;
	a=111; b=0; #10;
	end
endmodule
	