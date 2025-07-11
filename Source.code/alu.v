module alu(A,B,ALUControl,Result,Z);

input [31:0]A,B;
input [2:0]ALUControl;

output reg [31:0]Result;
output Z;


always @(*)
begin
case(ALUControl)
3'b000 : Result = A&B;
3'b001 : Result = A|B;
3'b010 : Result = A+B;
3'b110 : Result = A-B;
default : Result = 32'h00000000;
endcase
end

assign Z= (Result==0)?1'b1 : 1'b0;
endmodule
