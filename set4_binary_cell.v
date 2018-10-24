module binary_cell(out,load,d_in,clk);
input load,d_in,clk;
output out;
wire p;

mux n1(p,load,out,d_in);
d_rising n2(out,,p,clk);

endmodule
//test

