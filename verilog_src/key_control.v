module key_control
(
	input wire sys_clk,
	input wire sys_rst_n,
	input wire [3:0] key,
	
	output reg[3:0] wave_select
);

parameter sin_wave=4'b0001,
		  squ_wave=4'b0010,
		  tri_wave=4'b0100,
		  saw_wave=4'b1000;

parameter CNT_MAX = 20'd999_999;
wire key3;
wire key2;
wire key1;
wire key0;
always@(posedge sys_clk or negedge sys_rst_n)
	if(sys_rst_n==1'b0)
		wave_select<=4'b0000;
	else if(key0==1'b1)
		wave_select<=sin_wave;
	else if(key1==1'b1)
		wave_select<=squ_wave;
	else if(key2==1'b1)
		wave_select<=tri_wave;
	else if(key3==1'b1)
		wave_select<=saw_wave;
	else
		wave_select<=wave_select;
	//instantiate key_filter
	key_filter
	#(.CNT_MAX(CNT_MAX))
	key_filter_inst3
	(
		.sys_clk(sys_clk),
		.sys_rst_n(sys_rst_n),
		.key_in(key[3]),
		.key_flag(key3)
	);
	
	key_filter
	#(.CNT_MAX(CNT_MAX))
	key_filter_inst2
	(
		.sys_clk(sys_clk),
		.sys_rst_n(sys_rst_n),
		.key_in(key[2]),
		.key_flag(key2)
	);
	
	key_filter
	#(.CNT_MAX(CNT_MAX))
	key_filter_inst1
	(
		.sys_clk(sys_clk),
		.sys_rst_n(sys_rst_n),
		.key_in(key[1]),
		.key_flag(key1)
	);
	
	key_filter
	#(.CNT_MAX(CNT_MAX))
	key_filter_inst0
	(
		.sys_clk(sys_clk),
		.sys_rst_n(sys_rst_n),
		.key_in(key[0]),
		.key_flag(key0)
	);
	
endmodule

	