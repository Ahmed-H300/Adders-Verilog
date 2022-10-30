`include "ripple_adder.v"
`include "FullAdder.v"
module carrySaveAdder #(parameter N=32)(input [N-1:0] x, input [N-1:0] y, input [N-1:0] z, output [N:0] sum, output carry);

wire [N-1:0] c1;
wire [N-1:0] c2;
wire [N-1:0] s1;
wire [N-1:0] s2;

genvar i;
generate
for(i = 0; i < N; i = i + 1)
FullAdder FA(x[i], y[i], z[i], s1[i], c1[i]);
endgenerate

assign c2[N-1] = 0;
assign c2[N-2:0] = s1[N-1:1];

ripple_adder #(N) RA(c2, c1, s2, carry);

assign sum[0] = s1[0];
assign sum[N:1] = s2[N-1:0];

endmodule