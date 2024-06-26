###################################################################

# Created by write_sdc on Mon Dec 28 22:16:07 2015

###################################################################
set sdc_version 1.9

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current mA
set_load -pin_load 10 [get_ports rst]
set_load -pin_load 10 [get_ports {m[31]}]
set_load -pin_load 10 [get_ports {m[30]}]
set_load -pin_load 10 [get_ports {m[29]}]
set_load -pin_load 10 [get_ports {m[28]}]
set_load -pin_load 10 [get_ports {m[27]}]
set_load -pin_load 10 [get_ports {m[26]}]
set_load -pin_load 10 [get_ports {m[25]}]
set_load -pin_load 10 [get_ports {m[24]}]
set_load -pin_load 10 [get_ports {m[23]}]
set_load -pin_load 10 [get_ports {m[22]}]
set_load -pin_load 10 [get_ports {m[21]}]
set_load -pin_load 10 [get_ports {m[20]}]
set_load -pin_load 10 [get_ports {m[19]}]
set_load -pin_load 10 [get_ports {m[18]}]
set_load -pin_load 10 [get_ports {m[17]}]
set_load -pin_load 10 [get_ports {m[16]}]
set_load -pin_load 10 [get_ports {m[15]}]
set_load -pin_load 10 [get_ports {m[14]}]
set_load -pin_load 10 [get_ports {m[13]}]
set_load -pin_load 10 [get_ports {m[12]}]
set_load -pin_load 10 [get_ports {m[11]}]
set_load -pin_load 10 [get_ports {m[10]}]
set_load -pin_load 10 [get_ports {m[9]}]
set_load -pin_load 10 [get_ports {m[8]}]
set_load -pin_load 10 [get_ports {m[7]}]
set_load -pin_load 10 [get_ports {m[6]}]
set_load -pin_load 10 [get_ports {m[5]}]
set_load -pin_load 10 [get_ports {m[4]}]
set_load -pin_load 10 [get_ports {m[3]}]
set_load -pin_load 10 [get_ports {m[2]}]
set_load -pin_load 10 [get_ports {m[1]}]
set_load -pin_load 10 [get_ports {m[0]}]
set_load -pin_load 10 [get_ports {q[31]}]
set_load -pin_load 10 [get_ports {q[30]}]
set_load -pin_load 10 [get_ports {q[29]}]
set_load -pin_load 10 [get_ports {q[28]}]
set_load -pin_load 10 [get_ports {q[27]}]
set_load -pin_load 10 [get_ports {q[26]}]
set_load -pin_load 10 [get_ports {q[25]}]
set_load -pin_load 10 [get_ports {q[24]}]
set_load -pin_load 10 [get_ports {q[23]}]
set_load -pin_load 10 [get_ports {q[22]}]
set_load -pin_load 10 [get_ports {q[21]}]
set_load -pin_load 10 [get_ports {q[20]}]
set_load -pin_load 10 [get_ports {q[19]}]
set_load -pin_load 10 [get_ports {q[18]}]
set_load -pin_load 10 [get_ports {q[17]}]
set_load -pin_load 10 [get_ports {q[16]}]
set_load -pin_load 10 [get_ports {q[15]}]
set_load -pin_load 10 [get_ports {q[14]}]
set_load -pin_load 10 [get_ports {q[13]}]
set_load -pin_load 10 [get_ports {q[12]}]
set_load -pin_load 10 [get_ports {q[11]}]
set_load -pin_load 10 [get_ports {q[10]}]
set_load -pin_load 10 [get_ports {q[9]}]
set_load -pin_load 10 [get_ports {q[8]}]
set_load -pin_load 10 [get_ports {q[7]}]
set_load -pin_load 10 [get_ports {q[6]}]
set_load -pin_load 10 [get_ports {q[5]}]
set_load -pin_load 10 [get_ports {q[4]}]
set_load -pin_load 10 [get_ports {q[3]}]
set_load -pin_load 10 [get_ports {q[2]}]
set_load -pin_load 10 [get_ports {q[1]}]
set_load -pin_load 10 [get_ports {q[0]}]
create_clock [get_ports clk]  -period 5  -waveform {0 2.5}
set_input_delay -clock clk  -max 0.2  [get_ports rst]
set_input_delay -clock clk  -max 0.2  [get_ports {m[31]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[30]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[29]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[28]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[27]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[26]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[25]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[24]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[23]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[22]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[21]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[20]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[19]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[18]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[17]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[16]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[15]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[14]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[13]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[12]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[11]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[10]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[9]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[8]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[7]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[6]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[5]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[4]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[3]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[2]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[1]}]
set_input_delay -clock clk  -max 0.2  [get_ports {m[0]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[31]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[30]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[29]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[28]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[27]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[26]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[25]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[24]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[23]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[22]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[21]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[20]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[19]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[18]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[17]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[16]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[15]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[14]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[13]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[12]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[11]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[10]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[9]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[8]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[7]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[6]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[5]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[4]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[3]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[2]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[1]}]
set_input_delay -clock clk  -max 0.2  [get_ports {q[0]}]
set_output_delay -max 0.5  [get_ports {result_reg[31]}]
set_output_delay -max 0.5  [get_ports {result_reg[30]}]
set_output_delay -max 0.5  [get_ports {result_reg[29]}]
set_output_delay -max 0.5  [get_ports {result_reg[28]}]
set_output_delay -max 0.5  [get_ports {result_reg[27]}]
set_output_delay -max 0.5  [get_ports {result_reg[26]}]
set_output_delay -max 0.5  [get_ports {result_reg[25]}]
set_output_delay -max 0.5  [get_ports {result_reg[24]}]
set_output_delay -max 0.5  [get_ports {result_reg[23]}]
set_output_delay -max 0.5  [get_ports {result_reg[22]}]
set_output_delay -max 0.5  [get_ports {result_reg[21]}]
set_output_delay -max 0.5  [get_ports {result_reg[20]}]
set_output_delay -max 0.5  [get_ports {result_reg[19]}]
set_output_delay -max 0.5  [get_ports {result_reg[18]}]
set_output_delay -max 0.5  [get_ports {result_reg[17]}]
set_output_delay -max 0.5  [get_ports {result_reg[16]}]
set_output_delay -max 0.5  [get_ports {result_reg[15]}]
set_output_delay -max 0.5  [get_ports {result_reg[14]}]
set_output_delay -max 0.5  [get_ports {result_reg[13]}]
set_output_delay -max 0.5  [get_ports {result_reg[12]}]
set_output_delay -max 0.5  [get_ports {result_reg[11]}]
set_output_delay -max 0.5  [get_ports {result_reg[10]}]
set_output_delay -max 0.5  [get_ports {result_reg[9]}]
set_output_delay -max 0.5  [get_ports {result_reg[8]}]
set_output_delay -max 0.5  [get_ports {result_reg[7]}]
set_output_delay -max 0.5  [get_ports {result_reg[6]}]
set_output_delay -max 0.5  [get_ports {result_reg[5]}]
set_output_delay -max 0.5  [get_ports {result_reg[4]}]
set_output_delay -max 0.5  [get_ports {result_reg[3]}]
set_output_delay -max 0.5  [get_ports {result_reg[2]}]
set_output_delay -max 0.5  [get_ports {result_reg[1]}]
set_output_delay -max 0.5  [get_ports {result_reg[0]}]
