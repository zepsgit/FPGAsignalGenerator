LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
entity key_control_tb is
end key_control_tb;
architecture tb of key_control_tb is
	component key_control is
		port(
			sys_clk: in std_logic;
			sys_rst_n: in std_logic;
			key: in std_logic_vector(3 downto 0);
			wave_select: out std_logic_vector(3 downto 0)
		);
	end component;
	signal sys_clk, sys_rst_n: std_logic:='0';
	signal key, wave_select: std_logic_vector(3 downto 0);
	begin
		kc: key_control port map(
			sys_clk,
			sys_rst_n,
			key,
			wave_select
		);
		sys_clk<=not sys_clk after 0.5 ns;
		sys_rst_n<='1' after 6 ns;
		key(3 downto 0)<="1111", "1110" after 8 ns, "1111" after 9 ns,"1101" after 10 ns, "1111" after 11 ns, "1011" after 12 ns, "1111" after 13 ns,"0111" after 14 ns, "1111" after 15 ns;
end tb;