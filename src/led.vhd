library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity led is
	port (
		clk   : in std_logic;
		state : in integer range 0 to 2;  -- 0 = Flash (Ready); 1 = Countdown (In-game); 2 = Stopped (Win/Lose)
		z     : out std_logic_vector(11 downto 0) -- There are 12 LEDs
	);
end led;


architecture behavioral of led is
-- LED State (can be set/updated via `state` port)
constant LED_FLASHING  : integer := 0;
constant LED_COUNTDOWN : integer := 1;
constant LED_STOPPED   : integer := 2;
-- LED Output signal
signal op : std_logic_vector(11 downto 0) := "000000000001";
signal remaining_time : integer := 6000;  -- in seconds
begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			case state is
				when LED_FLASHING  =>
					op <= op(0) & op(11 downto 1);  -- Rotates right `op` by one bit.
				
				when LED_COUNTDOWN =>
					-- Update remaining time.
					if (remaining_time > 0) then
						remaining_time <= remaining_time - 1;
					end if;
					-- Update led output if needed.
					case remaining_time is
						when 6000 => op <= "111111111111";
						when 5500 => op <= "111111111110";
						when 5000 => op <= "111111111100";
						when 4500 => op <= "111111111000";
						when 4000 => op <= "111111110000";
						when 3500 => op <= "111111100000";
						when 3000 => op <= "111111000000";
						when 2500 => op <= "111110000000";
						when 2000 => op <= "111100000000";
						when 1500 => op <= "111000000000";
						when 1000 => op <= "110000000000";
						when  500 => op <= "100000000000";
						when    0 => op <= "000000000000";
						when others => op <= op;
					end case;
					
				when LED_STOPPED   => null;
				
				when others        => null;
				
			end case;
		end if;
	end process;
	
	z <= op;
end behavioral;
