library ieee;
use ieee.std_logic_1164.ALL;

entity de_change is
port( clk : in  std_logic;
		z   : out std_logic_vector(2 downto 0));
end de_change;

architecture a of de_change is
signal op: std_logic_vector(2 downto 0);
begin	
	process(clk)
	begin
		if (rising_edge(clk)) then
			case op is 
				when "000" =>
					op <= "100";
				when "100" =>
					op <= "010";
				when "010" =>
					op <= "110";
				when "110" =>
					op <= "000";
				when others =>
					op <= "000";
			end case;
		end if;
	end process;
	
	z <= op;
end a;