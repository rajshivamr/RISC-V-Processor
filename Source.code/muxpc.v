module muxpc(PCPlus4,PCBranch,PCSrc,PC_Next);
input [31:0] PCPlus4,PCBranch;
input PCSrc;
output [31:0]PC_Next;

assign PC_Next = (PCSrc==1)? PCBranch : PCPlus4;
endmodule
