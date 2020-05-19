library ieee;
use ieee.std_logic_1164.all;

entity keyboard is
	port(	num_in:in std_logic_vector(5 downto 0);
			num_out:out std_logic_vector(3 downto 0));
end keyboard;

-- 0-9 number
-- 10,11 use for A and B
-- 12 * , 13 #
architecture a of keyboard is
	begin
		with num_in select
			num_out <= "0001" when "000100",
				  "0010" when "000010",
				  "0011" when "000001",
				  "0100" when "001100",
				  "0101" when "001010",
				  "0110" when "001001",
				  "0111" when "010100",
				  "1000" when "010010",
				  "1001" when "010001",
				  "0000" when "011010",
				  "1100" when "011100",
				  "1101" when "011001",
				  "1110" when others;
	end a;