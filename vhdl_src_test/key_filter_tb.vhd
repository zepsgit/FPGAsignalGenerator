library ieee;
use ieee.std_logic_1164.all;
entity key_filter_tb is
end key_filter_tb;
architecture tb of key_filter_tb is
	
	component key_filter is
		port(
		sys_clk: in std_logic;
		sys_rst_n: in std_logic;
		key_in: in std_logic;
		key_flag: out std_logic
	);
	end component;
	signal sys_rst_n, key_in, key_flag: std_logic;
	signal sys_clk: std_logic;
	begin
		kf: key_filter  port map(sys_clk,
												sys_rst_n,
												key_in,
												key_flag
												);
		sys_clk<=not sys_clk after 0.5 ns;
		sys_rst_n<='0', '1' after 5 ns;
		key_in<='0','1' after 1 ns, '0' after 3 ns, 
		'1' after 3.5 ns, '0' after 5 ns, '1' after 15 ns,
		'0' after 16 ns, '1' after 16.5 ns, '0' after 17 ns,
			'1' after 18 ns;
		
end tb;