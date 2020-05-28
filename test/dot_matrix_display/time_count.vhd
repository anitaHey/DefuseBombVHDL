library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity time_count is
	port (
		clk : in std_logic;  -- Must be 1Hz
		running: in std_logic;
		out_time : out integer;
		lose: out std_logic
	);
end time_count;


architecture behavioral of time_count is
signal remaining_time : integer := 120;  -- in seconds
signal lose_sig : std_logic := '0';  -- in seconds
begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			-- Update remaining time.
			if (running = '1' ) then
				if(remaining_time > 0) then
					remaining_time <= remaining_time - 1;
					lose_sig <= '0';
				else
					lose_sig <= '1';
				end if;
			end if;
		end if;
	end process;
	
	lose <= lose_sig;
	out_time <= remaining_time;
end behavioral;
