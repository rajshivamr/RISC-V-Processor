`include "CU_main_decoder.v"
`include "CU_alu_decoder.v"

module Control_Unit_Top(Op,PCSrc,ResultSrc,Memwrite,ALUSrc,Regwrite,funct3,funct7,ALUControl,jump,Branch,MemRead);

input funct7;
input [6:0]Op;
input [2:0]funct3;
output Regwrite,ALUSrc,Memwrite,ResultSrc,PCSrc,MemRead,Branch,jump;

output [2:0]ALUControl;

wire [1:0]ALUOp;

main_decoder main_decoder(
	
	.Op(Op),
	.PCSrc(PCSrc),
	.ResultSrc(ResultSrc),
	.Memwrite(Memwrite),
	.ALUSrc(ALUSrc),
	.Branch(Branch),
        .MemRead(MemRead),
        .jump(jump),
	.Regwrite(Regwrite),
	.ALUOp(ALUOp)
);

alu_decoder alu_decoder(
	.ALUOp(ALUOp),
	
	.funct3(funct3),
	.funct7(funct7),
	.ALUControl(ALUControl)
);
endmodule

