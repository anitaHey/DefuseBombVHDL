library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity keyboard is
	port(
		row_in  : in  std_logic_vector(2 downto 0);
	   col_in  : in  std_logic_vector(2 downto 0);
		row_out : out std_logic_vector(2 downto 0);
		ans_out : out std_logic_vector(15 downto 0);
		a_out   : out std_logic_vector(3 downto 0);
		b_out   : out std_logic_vector(3 downto 0));
end keyboard;

-- 0-9 number
-- 10,11 use for A and B
-- 12 * , 13 #
architecture Behavioral of keyboard is
signal state : std_logic := '0';
signal ans   : std_logic_vector(15 downto 0) := "1001010100101110"; -- 9527
signal a     : std_logic_vector(3  downto 0) := "0111"; -- display nothing on seg7
signal b     : std_logic_vector(3  downto 0) := "0110"; -- display nothing on seg7
signal a_saved : std_logic := '0';
signal b_saved : std_logic := '0';
begin
	process(row_in)
	variable a_saved_v : std_logic := '0';
	variable b_saved_v : std_logic := '0';
	variable row_v : std_logic_vector(2 downto 0);
	begin
		--wait on row_in until (col_in = "011" or col_in = "101" or col_in = "110");
		row_v := row_in;
		
		case state is
			when '0' =>  -- Input a
				if (a_saved_v = '0' or a_saved = '0') then
					case row_v is
						when "000" =>  -- Row 1 active
							case col_in is
								when "011" => a <= "0001";  -- 1
								when "101" => a <= "0010";  -- 2
								when "110" => a <= "0011";  -- 3
								when others => null;
							end case;
						
						when "100" =>  -- Row 2 active
							case col_in is
								when "011" => a <= "0100";  -- 4
								when "101" => a <= "0101";  -- 5
								when "110" => a <= "0110";  -- 6
								when others => null;
							end case;
						
						when "010" =>  -- Row 3 active
							case col_in is
								when "011" => a <= "0111";  -- 7
								when "101" => a <= "1000";  -- 8
								when "110" => a <= "1001";  -- 9
								when others => null;
							end case;
					
						when others =>
							null;
					end case;
				end if;
				
				if (a_saved_v = '1') then
					a_saved <= '1';
					state <= '1';
				end if;
					
			when '1' =>  -- Input b
				case row_v is
					when "000" =>  -- Row 1 active
						case col_in is
							when "011" => b <= "0001";  -- 1
							when "101" => b <= "0010";  -- 2
							when "110" => b <= "0011";  -- 3
							when others => null;
						end case;
						
					when "100" =>  -- Row 2 active
						case col_in is
							when "011" => b <= "0100";  -- 4
							when "101" => b <= "0101";  -- 5
							when "110" => b <= "0110";  -- 6
							when others => null;
						end case;
						
					when "010" =>  -- Row 3 active
						case col_in is
							when "011" => b <= "0111";  -- 7
							when "101" => b <= "1000";  -- 8
							when "110" => b <= "1001";  -- 9
							when others => null;
						end case;
					
					when others =>
						null;
				end case;
				
				if (b_saved_v = '1') then
					null;
				end if;
				
		end case;
		
	end process;
	
	row_out <= row_in;
	ans_out <= ans;
	a_out <= a;
	b_out <= b;
	
end Behavioral;