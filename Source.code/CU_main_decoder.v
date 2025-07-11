module main_decoder(Op,PCSrc,ResultSrc,Memwrite,ALUSrc,Branch,Regwrite,ALUOp,MemRead,jump);
input [6:0]Op;
output PCSrc,MemRead,ResultSrc,Memwrite,Branch,jump,Regwrite,ALUSrc;
output [1:0]ALUOp;

reg [8:0] control;
assign {ALUSrc,ResultSrc,RegWrite,MemRead,MemWrite,Branch,jump,ALUOp} = control;
always @(*)
begin
case(Op)
7'b0110011 : control <= 9'b001000010; // R-type
7'b0000011 : control <= 9'b111100000; // lw-type
7'b0100011 : control <= 9'b1x0010000; // s-type
7'b1100011 : control <= 9'b0x0001001; // sb-type
7'b0010011 : control <= 9'b101000011; // I-type
7'b1100111 : control <= 9'b111xx0100; // jalr-type
7'b1101111 : control <= 9'b111xx0100; // jal-type
default : control    <= 9'bxxxxxxxxx;
endcase
end

endmodule
