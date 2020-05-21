library ieee;
use ieee.std_logic_1164.all;

entity keyboard is
	port(
		--clk     : in  std_logic;
		Row: in std_logic_vector (2 downto 0);
	   Column : in std_logic_vector (2 downto 0);
		valid_in: in std_logic;
		num_out : out std_logic_vector(3 downto 0); -- value (in binary)
		valid_out: out std_logic);
end keyboard;

-- 0-9 number
-- 10,11 use for A and B
-- 12 * , 13 #
architecture a of keyboard is
--signal op : std_logic;
	signal num_in : std_logic_vector(5 downto 0);
	signal check :std_logic := '0';
	signal notValid : std_logic := '0';
	signal save : std_logic_vector(3 downto 0);
begin
	process(num_in)
	begin
		if(valid_in = '1' and notValid = '0') then
	--		notValid <= '1';
	--		check <= '1';
	--		num_in <= Row & Column;
	--		case num_in is
	--			when "000011" =>
	--				save <= "0001";
	--			when "000101" =>
	--				save <= "0010";
	--			when "000110" =>
	--				save <= "0011";
	--			when "100011" =>
	--				save <= "0100";
	--			when "100101" =>
	--				save <= "0101";
	--			when "100110" =>
	--				save <= "0110";
	--			when "010011" =>
	--				save <= "0111";
	--			when "010101" =>
	--				save <= "1000";
	--			when "010110" =>
	--				save <= "1001";
	--			when "110011" =>
	--				save <= "1100";
	--			when "110101" =>
	--				save <= "0000";
	--			when "110110" =>
	--				save <= "1101";
	--			when others =>
	--				save <= "1110";
	--				notValid <= '0';
	--				check <= '0';
	--		end case;
			save <= "0101";
			valid_out <= notValid;
			num_out <= save;
		elsif(check = '0') then
			valid_out <= '0';
			save <= "1110";
			num_out <= "1110";
		else
			num_out <= save;
		end if;
	end process;
end a;