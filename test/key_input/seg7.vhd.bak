library ieee;
use ieee.std_logic_1164.all;

entity seg7 is
	port(	clk:in std_logic_vector(2 downto 0);
			num_a, num_b:in std_logic_vector(3 downto 0);
			num_out:out std_logic_vector(6 downto 0));
end seg7;

architecture a of seg7 is
	begin
		process(clk)
			begin
			case clk is
				when "000" =>
					case num_a is
						when "0000" =>
							num_out <= "1111110";
						when "0001" =>
							num_out <= "0110000";
						when "0010" =>
							num_out <= "1101101";
						when "0011" =>
							num_out <= "1111001";
						when "0100" =>
							num_out <= "0110011";
						when "0101" =>
							num_out <= "1011011";
						when "0110" =>
							num_out <= "1011111";
						when "0111" =>
							num_out <= "1110000";
						when "1000" =>
							num_out <= "1111111";
						when "1001" =>
							num_out <= "1111011";
						when others =>
							num_out <= "0000000";
					end case;
				when "100" =>
					num_out <= "1110111";
				when "010" =>
					case num_b is
						when "0000" =>
							num_out <= "1111110";
						when "0001" =>
							num_out <= "0110000";
						when "0010" =>
							num_out <= "1101101";
						when "0011" =>
							num_out <= "1111001";
						when "0100" =>
							num_out <= "0110011";
						when "0101" =>
							num_out <= "1011011";
						when "0110" =>
							num_out <= "1011111";
						when "0111" =>
							num_out <= "1110000";
						when "1000" =>
							num_out <= "1111111";
						when "1001" =>
							num_out <= "1111011";
						when others =>
							num_out <= "0000000";
					end case;
				when "110" =>
					num_out <= "0011111";
				when others =>
					num_out <= "0000000";
			end case;
		end process;
	end a;