vlib work
vlog tb.v
vsim -voptargs="+acc" work.tb
add wave -position insertpoint sim:/tb/Single_Cycle_Top/alu/*
add wave -position insertpoint sim:/tb/Single_Cycle_Top/pc/*
run -all
