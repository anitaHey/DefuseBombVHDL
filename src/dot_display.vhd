library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity dot_display is
	port (
		row     : in std_logic_vector(7 downto 0);
		time_count  : in  integer;  -- Must be 1Hz
		state : in  integer range 0 to 2;  -- 0 = ready  1 = running  2 = stopped
		g_col   : out std_logic_vector(7 downto 0);
		r_col   : out std_logic_vector(7 downto 0)
	);
end dot_display;


architecture behavioral of dot_display is
constant DOT_READY  : integer := 0;
constant DOT_RUNNING : integer := 1;
constant DOT_STOPPED   : integer := 2;

type g_arr is array (7 downto 0, 7 downto 0) of std_logic; -- (green, row)
type r_arr is array (7 downto 0, 7 downto 0) of std_logic; -- (red, row)
signal g_display : g_arr;
signal r_display : r_arr;
signal g_sig     : std_logic_vector(7 downto 0) := "00000000";
signal r_sig   : std_logic_vector(7 downto 0) := "00000000";
signal row_count : integer := 0;
begin
	process(time_count)
	begin
		-- Update remaining time.
		case state is
			when DOT_RUNNING =>
				case time_count is
					when 120 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
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
					when 119 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
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
					when 118 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
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
					when 117 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
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
					when 116 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
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
					when 115 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
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
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
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
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 113 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
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
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 112 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
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
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 111 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
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
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 110 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
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
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 109 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
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
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 108 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(3, 3) <= '1';
						g_display(3, 2) <= '1';
						g_display(3, 1) <= '1';
						g_display(2, 6) <= '1';
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 107 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(3, 3) <= '1';
						g_display(3, 2) <= '1';
						g_display(3, 1) <= '1';
						g_display(2, 6) <= '1';
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 106 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(3, 3) <= '1';
						g_display(3, 2) <= '1';
						g_display(3, 1) <= '1';
						g_display(2, 6) <= '1';
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 105 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(3, 3) <= '1';
						g_display(3, 2) <= '1';
						g_display(3, 1) <= '1';
						g_display(2, 6) <= '1';
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 104 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(3, 3) <= '1';
						g_display(3, 2) <= '1';
						g_display(3, 1) <= '1';
						g_display(2, 6) <= '1';
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 103 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(3, 3) <= '1';
						g_display(3, 2) <= '1';
						g_display(3, 1) <= '1';
						g_display(2, 6) <= '1';
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 102 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(3, 2) <= '1';
						g_display(3, 1) <= '1';
						g_display(2, 6) <= '1';
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 101 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(3, 2) <= '1';
						g_display(3, 1) <= '1';
						g_display(2, 6) <= '1';
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 100 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(3, 2) <= '1';
						g_display(3, 1) <= '1';
						g_display(2, 6) <= '1';
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 99 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(3, 2) <= '1';
						g_display(3, 1) <= '1';
						g_display(2, 6) <= '1';
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 98=>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(3, 2) <= '1';
						g_display(3, 1) <= '1';
						g_display(2, 6) <= '1';
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 97 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(3, 2) <= '1';
						g_display(3, 1) <= '1';
						g_display(2, 6) <= '1';
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 96 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(3, 1) <= '1';
						g_display(2, 6) <= '1';
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 95 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(3, 1) <= '1';
						g_display(2, 6) <= '1';
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 94 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(3, 1) <= '1';
						g_display(2, 6) <= '1';
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 93 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(3, 1) <= '1';
						g_display(2, 6) <= '1';
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 92 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(3, 1) <= '1';
						g_display(2, 6) <= '1';
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 91 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(3, 1) <= '1';
						g_display(2, 6) <= '1';
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 90 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 89 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 88 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 87 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 86 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 85 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(2, 1) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 84 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 83 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 82 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 81 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 80 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 79 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(1, 1) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 78 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 77 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 76 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 75 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 74 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 73 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
						g_display(0, 1) <= '1';
					when 72 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
					when 71 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
					when 70 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
					when 69 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
					when 68 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
					when 67 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
						g_display(0, 2) <= '1';
					when 66 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
					when 65 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
					when 64 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
					when 63 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
					when 62 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
					when 61 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
						g_display(0, 3) <= '1';
					when 60 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
					when 59 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
					when 58 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
					when 57 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
					when 56 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
					when 55 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
						g_display(0, 4) <= '1';
					when 54 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
					when 53 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
					when 52 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
					when 51 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
					when 50 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
					when 49 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
						g_display(0, 5) <= '1';
					when 48 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
					when 47 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
					when 46 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
					when 45 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
					when 44 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
					when 43 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
						g_display(0, 6) <= '1';
					when 42 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
					when 41 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
					when 40 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
					when 39 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
					when 38 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
					when 37 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
						g_display(1, 6) <= '1';
					when 36 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
					when 35 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
					when 34 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
					when 33 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
					when 32 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
					when 31 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
						g_display(2, 6) <= '1';
					when 30 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
					when 29 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
					when 28 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
					when 27 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
					when 26 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
					when 25 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
						g_display(3, 6) <= '1';
					when 24 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
					when 23 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
					when 22 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
					when 21 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
					when 20 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
					when 19 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 6) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
					when 18 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
					when 17 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
					when 16 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
					when 15 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
					when 14 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
					when 13 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 6) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
					when 12 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
					when 11 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
					when 10 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
					when 9 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
					when 8 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
					when 7 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 5) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
					when 6 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
					when 5 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
					when 4 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
					when 3 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
					when 2 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 4) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
					when 1 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
						g_display(7, 2) <= '1';
						g_display(7, 1) <= '1';
						g_display(6, 3) <= '1';
						g_display(6, 2) <= '1';
						g_display(6, 1) <= '1';
						g_display(6, 0) <= '1';
						g_display(5, 3) <= '1';
						g_display(5, 2) <= '1';
						g_display(5, 1) <= '1';
						g_display(5, 0) <= '1';
						g_display(4, 2) <= '1';
						g_display(4, 1) <= '1';
					when 0 =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '1';
							end loop;
						end loop;
					when others =>
						for num_col in 7 downto 0 loop
							for num_row in 7 downto 0 loop
								g_display(num_col, num_row) <= '0';
								r_display(num_col, num_row) <= '0';
							end loop;
						end loop;
				end case;
				
			when DOT_STOPPED =>
				for num_col in 7 downto 0 loop
					for num_row in 7 downto 0 loop
						g_display(num_col, num_row) <= '1';
						r_display(num_col, num_row) <= '0';
					end loop;
				end loop;
				
			when DOT_READY =>
				for num_col in 7 downto 0 loop
					for num_row in 7 downto 0 loop
						g_display(num_col, num_row) <= '0';
						r_display(num_col, num_row) <= '0';
					end loop;
				end loop;
		end case;
	end process;
	
	process(row)
	begin
		case row is
			when "10000000" =>
				row_count <= 7;
			when "01000000" =>
				row_count <= 6;
			when "00100000" =>
				row_count <= 5;
			when "00010000" =>
				row_count <= 4;
			when "00001000" =>
				row_count <= 3;
			when "00000100" =>
				row_count <= 2;
			when "00000010" =>
				row_count <= 1;
			when "00000001" =>
				row_count <= 0;
			when others =>
				row_count <= 0;
		end case;
		
		for num in 7 downto 0 loop
			g_sig(num) <= g_display(num, row_count);
			r_sig(num) <= r_display(num, row_count);
		end loop;
	end process;
	
	g_col <= g_sig;
	r_col <= r_sig;
end behavioral;
