module pc(PC_Next,clk,rst,PC);

input [31:0]PC_Next;
input clk,rst;

output reg [31:0]PC;

always @(posedge clk)
   begin
       if(rst)
      PC <= 32'b00000000;
      
      else

      PC <= PC_Next;

  end
endmodule
