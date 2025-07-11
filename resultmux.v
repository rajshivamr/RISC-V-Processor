module resultmux(Readdata,Result,ResultSrc,Result_out);

input [31:0] Result,Readdata;
input ResultSrc;
output [31:0] Result_out;

assign Result_out =(ResultSrc)?Readdata : Result;

endmodule 
