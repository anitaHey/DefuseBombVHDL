library ieee;
use ieee.std_logic_1164.all;

entity seg7 is
	port(
			num1_in  : in std_logic_vector(3 downto 0);
			num2_in  : in std_logic_vector(3 downto 0);
			num3_in  : in std_logic_vector(3 downto 0);
			num4_in  : in std_logic_vector(3 downto 0);
			row_in  : in std_logic_vector(2 downto 0);
			num_out : out std_logic_vector(6 downto 0));
end seg7;

architecture Behavioral of seg7 is
signal op : std_logic_vector(3 downto 0);
begin
	process(row_in)
	begin
		case row_in is
			when "000"  => op <= num1_in;
			when "100"  => op <= num2_in;
			when "010"  => op <= num3_in;
			when "110"  => op <= num4_in;
			when others => null;
		end case;
	end process;
	
	with op select
	num_out  <= "1111110" when "0000",
					"0110000" when "0001",
					"1101101" when "0010",
					"1111001" when "0011",
					"0110011" when "0100",
					"1011011" when "0101",
					"1011111" when "0110",
					"1110000" when "0111",
					"1111111" when "1000",
					"1111011" when "1001",
					"1111101" when "1010",
					"0011111" when "1011",
					"0000000" when others;
end Behavioral;