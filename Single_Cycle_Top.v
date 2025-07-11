`include "p_c.v"
`include "Reg_file.v"
`include "Instr_mem.v"
`include "Sign_Extend.v"
`include "alu.v"
`include "Control_Unit_top.v"
`include "data_mem.v"
`include "PC_adder.v"
`include "branchadder.v"
`include "resultmux.v"
`include "alumux.v"
`include "muxpc.v"
`include"and_gate.v"


module Single_Cycle_Top(clk,rst);

input clk,rst; 

wire [31:0] PC,RD_Instr,RD1,RD2,Imm_Ext,Result,PCPlus4,Readdata,Result_out,B,PC_Next,PCBranch,WD;
wire [2:0] ALUControl;
wire Regwrite,Memwrite,ALUSrc,ResultSrc,MemRead,Branch,jump,PCSrc,Z;


pc pc(
     .PC_Next(PC_Next),
     .clk(clk),
     .rst(rst),
     .PC(PC)
);

instr_mem instr_mem(
        .a(PC),
        
        .RD(RD_Instr)
);

reg_file reg_file(
        .A1(RD_Instr[19:15]),
        .A2(RD_Instr[24:20]),
        .A3(RD_Instr[11:7]),
        .WD3(Result_out),
        .WE3(Regwrite),
        .clk(clk),
      
        .RD1(RD1),
        .RD2(RD2)
);

Sign_Extend Sign_Extend(
        .In(RD_Instr[11:0]),
       
        .Imm_Ext(Imm_Ext)
);

alu alu(
        .A(RD1),
        .B(B),
        .ALUControl(ALUControl),
        .Result(Result),
        .Z(Z)
);

Control_Unit_Top Control_Unit_Top(.Op(RD_Instr[6:0]),
              .PCSrc(PCSrc),
              .ResultSrc(ResultSrc),
              .Memwrite(Memwrite),
              .ALUSrc(ALUSrc),
              .Regwrite(Regwrite),
         .MemRead(MemRead), .Branch(Branch),.jump(jump),
              .funct3(RD_Instr[14:12]),
              .funct7(RD_Instr[30]),
              .ALUControl(ALUControl)
);
 
data_mem data_mem(
              .Result(Result),
              .WD(RD2),
              .WE(Memwrite),
              .clk(clk),
              .Readdata(Readdata)
             
);

PC_adder PC_adder(
                 .PC(PC),
                 
                 .PCPlus4(PCPlus4)
);

branchadder branchadder(
                  .PC(PC),
                  .Imm_Ext(Imm_Ext),
                  .PCBranch(PCBranch)
);

resultmux resultmux(
                  .Readdata(Readdata),
                  .Result(Result),
                  .ResultSrc(ResultSrc),
                  .Result_out(Result_out)
);

alumux  alumux(   
                 .RD2(RD2),
                 .Imm_Ext(Imm_Ext),
                 .ALUSrc(ALUSrc),
                 .B(B)
);

muxpc  muxpc( 
                 .PCPlus4(PCPlus4),
                 .PCBranch(PCBranch),
                 .PCSrc(PCSrc),
                 .PC_Next(PC_Next)
);
and_gate gate1(.PCSrc(PCSrc), .Branch(Branch), .Z(Z));

endmodule
