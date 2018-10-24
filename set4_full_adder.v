module full_adder(s,c_out,a,b,c_in);
input a,b,c_in;
output s,c_out;
wire s_b,p,q;

half_adder n1(s_b,p,a,b);
half_adder n2(s,q,s_b,c_in);
nand_or n3(c_out,p,q);

endmodule

//test

module full_adder_new;
reg a,b,c_in;
wire s,c_out;

full_adder n1(s,c_out,a,b,c_in);
initial
	begin
	a=0; 
	b=0; c_in=0; #10;
	b=0; c_in=1; #10;
	b=1; c_in=0; #10;
	b=1; c_in=1; #10;
	a=1;
	b=0; c_in=0; #10;
	b=0; c_in=1; #10;
	b=1; c_in=0; #10;
	b=1; c_in=1; #10;
	end
endmodule	
