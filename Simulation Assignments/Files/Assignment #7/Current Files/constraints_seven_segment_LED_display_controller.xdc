# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk_100_Mhz]							
set_property IOSTANDARD LVCMOS33 [get_ports clk_100_Mhz]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk_100_Mhz]
    
# Reset signal
set_property PACKAGE_PIN R2 [get_ports reset]							
set_property IOSTANDARD LVCMOS33 [get_ports reset]

# Seven segment LED outputs
set_property PACKAGE_PIN W7 [get_ports {seven_segments_LED_output[6]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seven_segments_LED_output[6]}]
set_property PACKAGE_PIN W6 [get_ports {seven_segments_LED_output[5]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seven_segments_LED_output[5]}]
set_property PACKAGE_PIN U8 [get_ports {seven_segments_LED_output[4]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seven_segments_LED_output[4]}]
set_property PACKAGE_PIN V8 [get_ports {seven_segments_LED_output[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seven_segments_LED_output[3]}]
set_property PACKAGE_PIN U5 [get_ports {seven_segments_LED_output[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seven_segments_LED_output[2]}]
set_property PACKAGE_PIN V5 [get_ports {seven_segments_LED_output[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seven_segments_LED_output[1]}]
set_property PACKAGE_PIN U7 [get_ports {seven_segments_LED_output[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seven_segments_LED_output[0]}]

# Anode bits
set_property PACKAGE_PIN U2 [get_ports {anode_bits[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {anode_bits[0]}]
set_property PACKAGE_PIN U4 [get_ports {anode_bits[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {anode_bits[1]}]
set_property PACKAGE_PIN V4 [get_ports {anode_bits[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {anode_bits[2]}]
set_property PACKAGE_PIN W4 [get_ports {anode_bits[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {anode_bits[3]}]