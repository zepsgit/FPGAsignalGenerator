module top_dds
(
input wire sys_clk , 
input wire sys_rst_n , 
input wire [3:0] key , 

output wire [7:0] dac_data 
);

////
//\* Parameter and Internal Signal \//
////
//wire define
wire [3:0] wave_select ; 

////
//\* Instantiation \//
////
//-------------------------- dds_inst -----------------------------
dds dds_inst
(
.sys_clk (sys_clk ), 
.sys_rst_n (sys_rst_n ), 
.wave_select (wave_select), 

.data_out (dac_data ) 
);

//----------------------- key_control_inst ------------------------
key_control key_control_inst
(
.sys_clk (sys_clk ), 
.sys_rst_n (sys_rst_n ), 
.key (key ), 

.wave_select (wave_select) 
);

endmodule