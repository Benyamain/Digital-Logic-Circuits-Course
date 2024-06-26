## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
#set_property PACKAGE_PIN W5 [get_ports clk]							
#	set_property IOSTANDARD LVCMOS33 [get_ports clk]
#	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 
## Switches
set_property PACKAGE_PIN V17 [get_ports {S[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {S[0]}]
set_property PACKAGE_PIN V16 [get_ports {S[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {S[1]}]
set_property PACKAGE_PIN W16 [get_ports {S[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {S[2]}]
set_property PACKAGE_PIN W17 [get_ports {S[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {S[3]}]
	
##7 segment display
set_property PACKAGE_PIN W7 [get_ports {D[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {D[6]}]
set_property PACKAGE_PIN W6 [get_ports {D[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {D[5]}]
set_property PACKAGE_PIN U8 [get_ports {D[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {D[4]}]
set_property PACKAGE_PIN V8 [get_ports {D[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {D[3]}]
set_property PACKAGE_PIN U5 [get_ports {D[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {D[2]}]
set_property PACKAGE_PIN V5 [get_ports {D[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {D[1]}]
set_property PACKAGE_PIN U7 [get_ports {D[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {D[0]}]
	
## LEDs
#set_property PACKAGE_PIN U16 [get_ports {S[4]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {S[4]}]