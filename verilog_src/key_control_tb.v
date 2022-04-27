`timescale 1ns/1ns 
module key_control_tb();
parameter CNT_1MS=20'd19,
CNT_11MS = 21'd69 ,
CNT_41MS = 22'd149 ,
CNT_51MS = 22'd199 ,
CNT_60MS = 22'd249 ;

//wire define
wire [3:0] wave_select ;

//reg define
reg sys_clk ;
reg sys_rst_n ;
reg [21:0] tb_cnt ;
reg key_in ;
reg [1:0] cnt_key ;
reg [3:0] key ;

//defparam define
defparam key_control_inst.CNT_MAX = 24;

initial begin
	sys_clk = 1'b0;
	sys_rst_n <=1'b0;
	key <= 4'b0000;
	#200
	sys_rst_n <= 1'b1;
end

always #10 sys_clk = ~sys_clk;

always@(posedge sys_clk or negedge sys_rst_n)
if(sys_rst_n == 1'b0)
tb_cnt <= 22'b0;
else if(tb_cnt == CNT_60MS)
tb_cnt <= 22'b0;
else
tb_cnt <= tb_cnt + 1'b1;

always@(posedge sys_clk or negedge sys_rst_n)
if(sys_rst_n == 1'b0)
key_in <= 1'b1;
else if((tb_cnt >= CNT_1MS && tb_cnt <= CNT_11MS)
||(tb_cnt >= CNT_41MS && tb_cnt <= CNT_51MS))
key_in <= {$random} % 2;
else if(tb_cnt >= CNT_11MS && tb_cnt <= CNT_41MS)
key_in <= 1'b0;
else
key_in <= 1'b1;

always@(posedge sys_clk or negedge sys_rst_n)
if(sys_rst_n == 1'b0)
cnt_key <= 2'd0;
else if(tb_cnt == CNT_60MS)
cnt_key <= cnt_key + 1'b1;
else
cnt_key <= cnt_key;

always@(posedge sys_clk or negedge sys_rst_n)
if(sys_rst_n == 1'b0)
key <= 4'b1111;
else
case(cnt_key)
0: key <= {3'b111,key_in};
1: key <= {2'b11,key_in,1'b1};
2: key <= {1'b1,key_in,2'b11};
3: key <= {key_in,3'b111};
default:key <= 4'b1111;
endcase

////
//\* Instantiation \//
////
//------------- key_control_inst -------------
key_control key_control_inst
(
.sys_clk (sys_clk ), //50MHz
.sys_rst_n (sys_rst_n ), 
.key (key ), 

.wave_select (wave_select)
);

endmodule