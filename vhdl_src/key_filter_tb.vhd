LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY key_filter_tb IS
END key_filter_tb;
 
ARCHITECTURE behavior OF key_filter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT key_filter
    PORT(
         Clock : IN  std_logic;
         Reset : IN  std_logic;
         button_in : IN  std_logic;
         pulse_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clock : std_logic := '0';
   signal Reset : std_logic := '0';
   signal button_in : std_logic := '0';

    --Outputs
   signal pulse_out : std_logic;

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: key_filter generic map(20)   PORT MAP (
          Clock => Clock,
          Reset => Reset,
          button_in => button_in,
          pulse_out => pulse_out
        );

   -- Clock process definitions
   Clock_process :process
   begin
        Clock <= '0';
        wait for Clock_period/2;
        Clock <= '1';
        wait for Clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin        
        button_in <= '0';
        reset <= '0';
      -- hold reset state for 100 ns.
      wait for 100 ns;
        reset <= '1';
      wait for Clock_period*10;
        --first activity
        button_in <= '1';   wait for Clock_period*2;
        button_in <= '0';   wait for Clock_period*1;
        button_in <= '1';   wait for Clock_period*1;
        button_in <= '0';   wait for Clock_period*20;
        --second activity
        button_in <= '1';   wait for Clock_period*1;
        button_in <= '0';   wait for Clock_period*1;
        button_in <= '1';   wait for Clock_period*1;
        button_in <= '0';   wait for Clock_period*2;
        button_in <= '1';   wait for Clock_period*20;
        button_in <= '0';   
      wait;
   end process;

END;