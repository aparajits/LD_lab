module binary_adder(s,c_out,a,b,c_in);
input[3:0] a,b;
input c_in;
output[3:0] s;
output c_out;
wire[0:2] r;
full_adder n1(s[0],r[0],a[0],b[0],c_in);
full_adder n2(s[1],r[1],a[1],b[1],r[0]);
full_adder n3(s[2],r[2],a[2],b[2],r[1]);
full_adder n4(s[3],c_out,a[3],b[3],r[2]);

endmodule
//test

module binary_adder_n;
reg[3:0] a,b;
wire[3:0] s;
wire c_out;

binary_adder n1(s,c_out,a,b,0);
initial
	begin
	a=10; b=111; #10;
	a=11; b=0; #10;
	end
endmodule
