library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity LEDFlashing is
	port (
		clk : in std_logic;
		z   : out std_logic_vector(11 downto 0) -- There are 12 LEDs
	);
end LEDFlashing;


architecture behavioral of LEDFlashing is
signal op : std_logic_vector(11 downto 0) := "000000000001";
begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			-- Rotate right `op` by one bit.
			op <= op(0) & op(11 downto 1);
		end if;
	end process;
	
	z <= op;
end behavioral;
