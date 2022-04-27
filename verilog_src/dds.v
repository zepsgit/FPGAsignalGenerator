module dds
(
input wire sys_clk , 
input wire sys_rst_n , 
input wire [3:0] wave_select , 

output wire [7:0] data_out 
);

////
//\* Parameter and Internal Signal \//
////
//parameter define
parameter sin_wave = 4'b0001 , 
squ_wave = 4'b0010 , 
tri_wave = 4'b0100 , 
saw_wave = 4'b1000 ; 
parameter FREQ_CTRL = 32'd419430 , 
PHASE_CTRL = 12'd0 ; 

//reg define
reg [31:0] fre_add ; 
reg [13:0] rom_addr_reg; 
reg [13:0] rom_addr ; 

////
//\* Main Code \//
////
always@(posedge sys_clk or negedge sys_rst_n)
if(sys_rst_n == 1'b0)
fre_add <= 32'd0;
else
fre_add <= fre_add + FREQ_CTRL;


always@(posedge sys_clk or negedge sys_rst_n)
if(sys_rst_n == 1'b0)
begin
rom_addr <= 14'd0;
rom_addr_reg <= 14'd0;
end
else
case(wave_select)
sin_wave:
begin
rom_addr_reg <= fre_add[31:20] + PHASE_CTRL;
rom_addr <= rom_addr_reg;
end 
squ_wave:
begin
rom_addr_reg <= fre_add[31:20] + PHASE_CTRL;
rom_addr <= rom_addr_reg + 14'd4096;
end 
tri_wave:
begin
rom_addr_reg <= fre_add[31:20] + PHASE_CTRL;
rom_addr <= rom_addr_reg + 14'd8192;
end 
saw_wave:
begin
rom_addr_reg <= fre_add[31:20] + PHASE_CTRL;
rom_addr <= rom_addr_reg + 14'd12288;
end 
default:
begin
rom_addr_reg <= fre_add[31:20] + PHASE_CTRL;
rom_addr <= rom_addr_reg;
end 
endcase

////
//\* Instantiation \//
////
//------------------------- rom_wave_inst ------------------------
rom_wave rom_wave_inst
(
.address (rom_addr ), 
.clock (sys_clk ), 

.q (data_out ) 
);

endmodule