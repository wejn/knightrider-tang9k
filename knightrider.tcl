set_device -name GW1NR-9C GW1NR-LV9QN88PC6/I5

add_file -type verilog [file normalize clockdivider.v]
add_file -type verilog [file normalize knightrider.v]
add_file -type cst [file normalize knightrider.cst]

set_option -top_module knightrider

run all
