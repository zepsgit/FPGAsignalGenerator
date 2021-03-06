library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_unsigned.all;
entity key_filter is
	--generic(CNT_MAX: integer:=999999);
	port(
		sys_clk: in std_logic;
		sys_rst_n: in std_logic;
		key_in: in std_logic;
		key_flag: out std_logic
	);
end key_filter;

architecture rtl of key_filter is
	constant CNT_MAX: integer:=20;
	signal cnt_20ms: std_logic_vector(19 downto 0);
	begin
		process(sys_clk)
			begin
				if (sys_clk'event and sys_clk='1') then
					if sys_rst_n='0' then
						cnt_20ms<=(others=>'0');
					elsif key_in='1' then
						cnt_20ms<=(others=>'0');
					elsif (cnt_20ms=CNT_MAX and key_in='0') then
						cnt_20ms<=cnt_20ms;
					else 
						cnt_20ms<=cnt_20ms+'1';
					end if;
				end if;
		end process;
		
		process(sys_clk)
			begin
				if(sys_rst_n='0') then
					key_flag<='0';
				elsif cnt_20ms=CNT_MAX-1 then
					key_flag<='1';
				else 
					key_flag<='0';
				end if;
		end process;
	end rtl;