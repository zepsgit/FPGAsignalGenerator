library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity dds is
 port(
	sys_clk: in std_logic;
	sys_rst_n: in std_logic;
	wave_select: in std_logic_vector(3 downto 0);
	data_out: out std_logic_vector(3 downto 0)
 );
 architecture rtl of dds is
	constant sin_wave: std_logic_vector(3 downto 0):="0001";
	constant squ_wave: std_logic_vector(3 downto 0):="0010";
	constant tri_wave: std_logic_vector(3 downto 0):="0100";
	constant saw_wave: std_logic_vector(3 downto 0):="1000";
	constant freq_ctrl: integer:=262144;
	constant phase_ctrl: integer:=1024;
	
	signal fre_add: std_logic_vector(31 downto 0);
	signal rom_addr_reg: std_logic_vector(13 downto 0);
	signal rom_addr: std_logic_vector(13 downto 0);
	
	component rom_wave
	
	process()