library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity LEDScore is
	port (
                clk : in std_logic;  -- Must be 1Hz
		z   : out std_logic_vector(11 downto 0) -- There are 12 LEDs
	);
end LEDScore;


architecture behavioral of LEDScore is
signal op : std_logic_vector(11 downto 0) := "111111111111";
signal remaining_time : integer := 60;  -- in seconds
begin
	process(clk)
	begin
		if (rising_edge(clk)) then
                        -- Update remaining time.
                        remaining_time <= remaining_time - 1;

                        -- Update led output if needed.
                        case remaining_time is
                                when 60 =>
                                        op <= "111111111111";
                                when 55 =>
                                        op <= "111111111110";
                                when 50 =>
                                        op <= "111111111100";
                                when 45 =>
                                        op <= "111111111000";
                                when 40 =>
                                        op <= "111111110000";
                                when 35 =>
                                        op <= "111111100000";
                                when 30 =>
                                        op <= "111111000000";
                                when 25 =>
                                        op <= "111110000000";
                                when 20 =>
                                        op <= "111100000000";
                                when 15 =>
                                        op <= "111000000000";
                                when 10 =>
                                        op <= "110000000000";
                                when  5 =>
                                        op <= "100000000000";
                                when  0 =>
                                        op <= "000000000000";
                                when others =>
                                        op <= op;
                        end case;
		end if;
	end process;
	
        if (remaining_time > 0) then
	        z <= op;
        end if;
end behavioral;
