library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity row_scanner is
	port (
		clk : in  std_logic;
		row : out std_logic_vector(7 downto 0)
	);
end row_scanner;


architecture behavioral of row_scanner is
signal op : std_logic_vector(7 downto 0) := "01000000";
begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			op <= op(0) & op(7 downto 1);
		end if;
	end process;
	
	row <= op;
end behavioral;
