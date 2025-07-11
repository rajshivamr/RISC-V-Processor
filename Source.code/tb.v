`include "Single_Cycle_Top.v"

module tb;
reg clk,rst;

Single_Cycle_Top Single_Cycle_Top(
           .clk(clk),
           .rst(rst)
);

initial 
begin
clk=0;
forever #5 clk=~clk;

end

initial
begin
rst=1'b1;
@(posedge clk)
rst=1'b0;

end 

initial
begin
#1000;
$finish;
end

endmodule

