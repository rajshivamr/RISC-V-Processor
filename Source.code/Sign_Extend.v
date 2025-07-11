module Sign_Extend(In,Imm_Ext);

input [11:0]In;
output [31:0]Imm_Ext;

assign Imm_Ext ={{20{In[11]}},In[11:0]};
endmodule
/*
module Sign_Extend(In,Imm_Ext,ImmSrc);
      
      input[31:0] In;
      input ImmSrc;
      output [31:0] Imm_Ext;
      
      assign Imm_Ext = (ImmSrc == 1'b1) ? ({{20{In[31]}},In[31:25],In[11:7]}):
                        {{20{In[31]}},In[31:20]};
endmodule
*/