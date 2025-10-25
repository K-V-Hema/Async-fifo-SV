vlog list.svh
vsim -novopt -suppress 12110 tb -sv_seed 138546494
add wave -r sim:/tb/pif/*
run -all
