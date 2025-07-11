/*module alu_decoder(ALUOp,Op,funct3,funct7,ALUControl);

input [6:0]Op,funct7;
input [1:0]ALUOp;
input [2:0]funct3;

output [2:0]ALUControl;

wire Concatenation; 
assign Concatenation = {Op[5],funct7[5]};

assign ALUControl = (ALUOp==2'b00)?3'b000:
                    (ALUOp==2'b01)?3'b001:
           ((ALUOp==2'b10)&(funct3==3'b010))?3'b101:
           ((ALUOp==2'b10)&(funct3==3'b110))?3'b011:
           ((ALUOp==2'b10)&(funct3==3'b111))?3'b010:
       ((ALUOp==2'b10)&(funct3==3'b000)&(Concatenation==2'b11))?3'b001:
 ((ALUOp==2'b10)&(funct3==3'b000)&(Concatenation!=2'b11))?3'b000:3'b000;

endmodule*/

module alu_decoder(ALUOp,funct7,funct3,ALUControl);

input [1:0] ALUOp;
input funct7;
input [2:0] funct3;
output reg [2:0] ALUControl;


always @(*)
begin
case (ALUOp)
2'b00 : ALUControl <= 3'b010;
2'b01 : ALUControl <= 3'b110;
2'b10 : begin
case({funct7,funct3})
4'b0000 : ALUControl <= 3'b010; // add
4'b1000 : ALUControl <= 3'b110; // sub
4'b0111 : ALUControl <= 3'b000; // and
4'b0110 : ALUControl <= 3'b001; // or
default : ALUControl <= 3'bxxx;
endcase
end
endcase
end
endmodule




