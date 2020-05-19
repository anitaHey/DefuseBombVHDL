library ieee;
use ieee.std_logic_1164.all;

entity keyboard is
	port(
		--clk     : in  std_logic;
		Row: in std_logic_vector (2 downto 0);
	   Column : in std_logic_vector (2 downto 0);
		num_out : out std_logic_vector(3 downto 0));  -- value (in binary)
end keyboard;

-- 0-9 number
-- 10,11 use for A and B
-- 12 * , 13 #
architecture a of keyboard is
--signal op : std_logic;
	signal num_in : std_logic_vector(5 downto 0);
begin
	--process(clk)
	--begin
	--	if (rising_edge(clk)) then
	--	end if;
	--	
	--end process;
	num_in <= Row & Column;
	with num_in select
		num_out <=  "0001" when "000011",
						"0010" when "000101",
						"0011" when "000110",
						"0100" when "100011",
						"0101" when "100101",
						"0110" when "100110",
						"0111" when "010011",
						"1000" when "010101",
						"1001" when "010110",
						"0000" when "110011",
						"1100" when "110101",
						"1101" when "110110",
						"1110" when others;
end a;