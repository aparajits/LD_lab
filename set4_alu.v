module alu(out,zx,nx,zy,ny,f,no,a,b);
input[15:0] a,b;
output[15:0] out;
input nx,zx,ny,zy,f,no;
wire[15:0] a,b,p,q,p_bar,q_bar,r,s,t,u,v,v_bar;

mux_16 n5(p,zx,a,16'b0);
mux_16 n6(q,zy,b,16'b0);

negator n1(p_bar,p);
negator n2(q_bar,q);

mux_16 n3(r,nx,p,p_bar);
mux_16 n4(s,ny,q,q_bar);

binary_adder_16bit n7(t,,r,s,1'b0);
nand_and_16 n8(u,r,s);

mux_16 n9(v,f,u,t);
negator n10(v_bar,v);

mux_16 n11(out,no,v,v_bar);

endmodule
//test
module alu_n;
reg[15:0] a,b;
reg nx,ny,zx,zy,f,no;
wire[15:0] out;

alu n1(out,zx,nx,zy,ny,f,no,a,b);
initial
	begin
	a=100; b=10;
	zx=0  ; nx=1  ;zy=1  ;ny=1  ;f=1  ;no=1  ; #10;
	
	end
endmodule
