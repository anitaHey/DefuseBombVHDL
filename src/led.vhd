library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity led is
	port (
		state          : in integer range 0 to 3;  -- 0 = Flash (Ready); 1 = Countdown (In-game); 2 = Stopped (Win/Lose)
		remaining_time : in integer;
		clk            : in std_logic;
		z              : out std_logic_vector(11 downto 0) -- There are 12 LEDs
	);
end led;


architecture behavioral of led is
-- LED State (can be set/updated via `state` port)
constant LED_FLASHING  : integer := 0;
constant LED_COUNTDOWN : integer := 1;
constant LED_STOPPED   : integer := 2;
constant LED_RESET     : integer := 3;
-- LED Output signal
signal op : std_logic_vector(11 downto 0) := "000000000001";
signal reset : std_logic := '0';
begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			case state is
				when LED_FLASHING  =>
					if (reset = '0') then
						reset <= '1';
						op <= "000000000001";
					else
						op <= op(0) & op(11 downto 1);  -- Rotates right `op` by one bit.
					end if;
				
				when LED_COUNTDOWN =>
					reset <= '0';
					-- Update led output if needed.
					if    (remaining_time >= 120) then op <= "111111111111";
					elsif (remaining_time >= 110) then op <= "111111111110";
					elsif (remaining_time >= 100) then op <= "111111111100";
					elsif (remaining_time >=  90) then op <= "111111111000";
					elsif (remaining_time >=  80) then op <= "111111110000";
					elsif (remaining_time >=  70) then op <= "111111100000";
					elsif (remaining_time >=  60) then op <= "111111000000";
					elsif (remaining_time >=  50) then op <= "111110000000";
					elsif (remaining_time >=  40) then op <= "111100000000";
					elsif (remaining_time >=  30) then op <= "111000000000";
					elsif (remaining_time >=  20) then op <= "110000000000";
					elsif (remaining_time >=  10) then op <= "100000000000";
					elsif (remaining_time >=   0) then op <= "000000000000";
					else                   null;
					end if;
					
				when LED_STOPPED =>
					null;
				
				when others =>
					null;
				
			end case;
		end if;
	end process;
	
	z <= op;
end behavioral;
