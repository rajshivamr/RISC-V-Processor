module instr_mem(a,RD);


input [31:0]a;
output [31:0]RD;

reg [31:0]mem[31:0];

initial
begin
mem[0] = 32'h002081B3; // add $1, $2, $3..... 0000000_00010_00001_000_00011_0110011
mem[1] = 32'h403202B3; // add $4, $3, $5......0000000_00011_00100_000_00011_0110011
mem[2] = 32'h403202B3; // sub $4, $3, $5
mem[3] = 32'h0013F333; // and $7, $1, $6
end
assign RD = mem[a];

endmodule
