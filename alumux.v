module alumux(RD2,Imm_Ext,ALUSrc,B);
input [31:0] RD2,Imm_Ext;
input ALUSrc;
output [31:0]B;

assign B = (ALUSrc)?Imm_Ext : RD2;
endmodule
