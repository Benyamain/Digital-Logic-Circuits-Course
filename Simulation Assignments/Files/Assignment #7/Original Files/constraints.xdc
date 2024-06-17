## Clock signal
set_property -dict { PACKAGE_PIN W5 IOSTANDARD LVCMOS33 } [get_ports { clk_100MHz }];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { clk_100MHz }];

## Switches
set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 } [get_ports { start }];
set_property -dict { PACKAGE_PIN V16 IOSTANDARD LVCMOS33 } [get_ports { stop }];
set_property -dict { PACKAGE_PIN W16 IOSTANDARD LVCMOS33 } [get_ports { reset }];

## Buttons
set_property -dict { PACKAGE_PIN U18 IOSTANDARD LVCMOS33 } [get_ports { btnC }];

## 7-segment display
set_property -dict { PACKAGE_PIN W7 IOSTANDARD LVCMOS33 } [get_ports { segment[0] }];
set_property -dict { PACKAGE_PIN W6 IOSTANDARD LVCMOS33 } [get_ports { segment[1] }];
set_property -dict { PACKAGE_PIN U8 IOSTANDARD LVCMOS33 } [get_ports { segment[2] }];
set_property -dict { PACKAGE_PIN V8 IOSTANDARD LVCMOS33 } [get_ports { segment[3] }];
set_property -dict { PACKAGE_PIN U5 IOSTANDARD LVCMOS33 } [get_ports { segment[4] }];
set_property -dict { PACKAGE_PIN V5 IOSTANDARD LVCMOS33 } [get_ports { segment[5] }];
set_property -dict { PACKAGE_PIN U7 IOSTANDARD LVCMOS33 } [get_ports { segment[6] }];

set_property -dict { PACKAGE_PIN U2 IOSTANDARD LVCMOS33 } [get_ports { anode[0] }];
set_property -dict { PACKAGE_PIN U4 IOSTANDARD LVCMOS33 } [get_ports { anode[1] }];
set_property -dict { PACKAGE_PIN V4 IOSTANDARD LVCMOS33 } [get_ports { anode[2] }];
set_property -dict { PACKAGE_PIN W4 IOSTANDARD LVCMOS33 } [get_ports { anode[3] }];