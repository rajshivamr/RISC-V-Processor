module PC_adder(PC,PCPlus4);

input [31:0]PC;
output reg [31:0] PCPlus4;


always @(*)begin
PCPlus4 =PC +1;
end
endmodule
