LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
entity key_control is
	port(
		sys_clk: in std_logic;
		sys_rst_n: in std_logic;
		key: in std_logic_vector(3 downto 0);
		wave_select: out std_logic_vector(3 downto 0)
	);
end key_control;
architecture rtl of key_control is
	constant sin_wave: std_logic_vector(3 downto 0):="0001";
	constant squ_wave: std_logic_vector(3 downto 0):="0010";
	constant tri_wave: std_logic_vector(3 downto 0):="0100";
	constant saw_wave: std_logic_vector(3 downto 0):="1000";
	begin
		process(sys_clk, sys_rst_n)
			begin
				if(sys_rst_n='0') then
					wave_select<="0000";
				elsif(key(0)='0') then
					wave_select<=sin_wave;
				elsif (key(1)='0') then
					wave_select<=squ_wave;
				elsif (key(2)='0') then
					wave_select<=tri_wave;
				elsif (key(3)='0') then
					wave_select<=saw_wave;
				else
					wave_select<="0000";
				end if;
		end process;
end rtl;