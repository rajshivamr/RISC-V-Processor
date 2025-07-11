module reg_file(A1,A2,A3,WD3,WE3,clk,RD1,RD2);
input [4:0]A1,A2,A3;
input [31:0]WD3;
input clk,WE3;

output [31:0]RD1,RD2;

reg [31:0]Registers[31:0];

assign RD1 = (A1!=0)?Registers[A1]:32'h00000000;
assign RD2 = (A2!=0)?Registers[A2]:32'h00000000;

always @(posedge clk)
    begin
    if(WE3)
    begin
    Registers[A3] <= WD3;
end
   end
      initial begin
Registers[0] = 32'h00000001;
Registers[1] = 32'h00000002;
Registers[2] = 32'h00000004;
Registers[3] = 32'h00000003;
Registers[4] = 32'h00000004;
Registers[5] = 32'h00000005;
Registers[6] = 32'h00000006;
Registers[7] = 32'h00000007;
Registers[8] = 32'h00000008;
Registers[9] = 32'h00000009;
Registers[10] = 32'h00000010;
      end
endmodule
