module Sign_Extend(In,Imm_Ext);

input [11:0]In;
output [31:0]Imm_Ext;

assign Imm_Ext ={{20{In[11]}},In[11:0]};
endmodule
