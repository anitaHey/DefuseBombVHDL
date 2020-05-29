library ieee;
use ieee.std_logic_1164.ALL;

entity keyboard_debounce is
port( row_in  : in  std_logic_vector(2 downto 0);
		col_in  : in  std_logic_vector(2 downto 0);
		col_out : out std_logic_vector(2 downto 0));
end keyboard_debounce;

architecture Behavioral of keyboard_debounce is
signal counter : integer := 10000;
signal locked  : std_logic := '1';
begin	
	process(row_in)
	begin
		-- When locked is true, output col_out as "111" (no key pressed).
		if (locked = '1') then
			col_out <= "111";
			counter <= counter - 1;
			
			if (counter = 0) then
				locked <= '0';
			end if;
						
		elsif (col_in = "011" or col_in = "101" or col_in = "110") then
			col_out <= col_in;
			locked <= '1';
			counter <= 10000;
		end if;
		
	end process;
end Behavioral;