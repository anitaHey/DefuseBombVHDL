library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity led is
	port (
		clk     : in std_logic;
		running : in std_logic;  -- 1 = Running, 0 = Stop
		z       : out std_logic_vector(11 downto 0) -- There are 12 LEDs
	);
end led;


architecture behavioral of led is
signal op : std_logic_vector(11 downto 0) := "000000000001";
begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			if (running = '1') then
				-- Rotate right `op` by one bit.
				op <= op(0) & op(11 downto 1);
			else
				op <= "000000000000";
			end if;
		end if;
	end process;
	
	z <= op;
end behavioral;
