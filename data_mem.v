module data_mem(Result,WD,WE,clk,Readdata);

input [31:0]Result,WD;
input clk,WE;
output reg [31:0]Readdata;

// decalaring data memory

reg [31:0]data_mem[255:0];

//assign Readdata= (WE==1'b0)? data_mem[Result]:32'h00000000;

always @(posedge clk)
begin
if(WE)
 begin
 data_mem[Result] <= WD;

end
else
Readdata<=data_mem[Result];
end
endmodule
