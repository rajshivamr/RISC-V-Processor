module and_gate(PCSrc,Z,Branch);
input Z,Branch;
output PCSrc;

assign PCSrc=Z&Branch;
endmodule
