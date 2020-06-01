library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity timer is
	port (
		clk                : in std_logic;  -- Must be 1Hz
		running            : in std_logic;
		has_remaining_time : out std_logic;
		remaining_time     : out integer
	);
end timer;


architecture behavioral of timer is
signal remaining_time_sig : integer   := 120;  -- in seconds
signal has_remaining_sig  : std_logic := '0';  -- in seconds
begin
	process(clk)
	begin
		if (rising_edge(clk)) then
		
			if (running = '1') then
				-- Update remaining time.
				if (remaining_time_sig > 0) then
					remaining_time_sig <= remaining_time_sig - 1;
					has_remaining_sig <= '1';
				else
					has_remaining_sig <= '0';
				end if;
				
			else
				-- Reset countdown timer.
				remaining_time_sig <= 120;
				has_remaining_sig <= '1';
			end if;
			
		end if;
	end process;
	
	has_remaining_time <= has_remaining_sig;
	remaining_time <= remaining_time_sig;
end behavioral;