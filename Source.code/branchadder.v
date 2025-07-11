module branchadder(PC,Imm_Ext,PCBranch);
input [31:0] PC,Imm_Ext;
output [31:0] PCBranch;
 assign PCBranch = PC+Imm_Ext;
endmodule
