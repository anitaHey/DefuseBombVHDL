library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity dot_display is
	port (
		row_clk     : in  std_logic;
		time_count  : in  integer;  -- Must be 1Hz
		running : in  std_logic;  -- 1 = Running, 0 = Stop
		lose : in std_logic;
		row     : out std_logic_vector(7 downto 0);
		g_col   : out std_logic_vector(7 downto 0);
		r_col   : out std_logic_vector(7 downto 0)
	);
end dot_display;


architecture behavioral of dot_display is
type g_arr is array (7 downto 0, 7 downto 0) of std_logic; -- (green, row)
type r_arr is array (7 downto 0, 7 downto 0) of std_logic; -- (red, row)
signal g_display : g_arr;
signal r_display : r_arr;
signal g_sig     : std_logic_vector(7 downto 0);
signal r_sig   : std_logic_vector(7 downto 0);
signal row_count : integer := 0;
begin
	process(time_count)
	begin
		-- Update remaining time.
		if (running = '1' ) then
			case time_count is
				when 120 =>
					g_display(7, 2) <= '1';
					g_display(7, 1) <= '1';
					g_display(6, 3) <= '1';
					g_display(6, 0) <= '1';
					g_display(5, 6) <= '1';
					g_display(5, 5) <= '1';
					g_display(5, 4) <= '1';
					g_display(5, 3) <= '1';
					g_display(5, 0) <= '1';
					g_display(4, 6) <= '1';
					g_display(4, 2) <= '1';
					g_display(4, 1) <= '1';
					g_display(3, 6) <= '1';
					g_display(3, 4) <= '1';
					g_display(3, 3) <= '1';
					g_display(3, 2) <= '1';
					g_display(3, 1) <= '1';
					g_display(2, 6) <= '1';
					g_display(2, 4) <= '1';
					g_display(2, 1) <= '1';
					g_display(1, 6) <= '1';
					g_display(1, 1) <= '1';
					g_display(0, 6) <= '1';
					g_display(0, 5) <= '1';
					g_display(0, 4) <= '1';
					g_display(0, 3) <= '1';
					g_display(0, 2) <= '1';
					g_display(0, 1) <= '1';
				when 114 =>
					g_display(2, 4) <= '0';
				when 108 =>
					g_display(3, 4) <= '0';
				when 102 =>
					g_display(3, 3) <= '0';
				when 96 =>
					g_display(3, 2) <= '0';
				when 90 =>
					g_display(3, 1) <= '0';
				when 84 =>
					g_display(2, 1) <= '0';
				when 78 =>
					g_display(1, 1) <= '0';
				when 72 =>
					g_display(0, 1) <= '0';
				when 66 =>
					g_display(0, 2) <= '0';
				when 60 =>
					g_display(0, 3) <= '0';
				when 54 =>
					g_display(0, 4) <= '0';
				when 48 =>
					g_display(0, 5) <= '0';
				when 42 =>
					g_display(0, 6) <= '0';
				when 36 =>
					g_display(1, 6) <= '0';
				when 30 =>
					g_display(2, 6) <= '0';
				when 24 =>
					g_display(3, 6) <= '0';
				when 18 =>
					g_display(4, 6) <= '0';
				when 12 =>
					g_display(5, 6) <= '0';
				when 6 =>
					g_display(5, 5) <= '0';
				when 0 =>
					g_display(5, 4) <= '0';
				when others =>
					g_display <= g_display;
			end case;
		else
			if(lose = '0') then
				for num_col in 7 to 0 loop
					for num_row in 7 to 0 loop
						g_display(num_col, num_row) <= '1';
						r_display(num_col, num_row) <= '0';
					end loop;
				end loop;
			else
				for num_col in 7 to 0 loop
					for num_row in 7 to 0 loop
						g_display(num_col, num_row) <= '0';
						r_display(num_col, num_row) <= '1';
					end loop;
				end loop;
			end if;
		end if;
	end process;
	
	process(row_clk)
	begin
		if (rising_edge(row_clk)) then
			for num in 7 to 0 loop
				g_sig(num) <= g_display(num, row_count);
				r_sig(num) <= r_display(num, row_count);
			end loop;
			
			if(row_count = 7) then
				row_count <= 0;
			else
				row_count <= row_count + 1;
			end if;
		end if;
	end process;
	
	g_col <= g_sig;
	r_col <= r_sig;
	row <= "11111111";
end behavioral;
