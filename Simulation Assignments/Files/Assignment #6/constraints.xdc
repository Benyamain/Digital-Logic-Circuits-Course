set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets - [get_cells <Q_OBUF_inst_i_1>]]
set_property SEVERITY {Warning} [get_drc_checks LUTLP-1]
set_property SEVERITY {Warning} [get_drc_checks NSTD-1]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets CLK_IBUF]