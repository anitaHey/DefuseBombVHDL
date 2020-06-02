library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity control_unit is
	port(
		sw_in   : in std_logic_vector(3 downto 0); -- sw1, sw2, sw3, sw4
		pulse   : in std_logic;
		has_remaining_time : in std_logic;
		
		num1_out : out std_logic_vector(3 downto 0);
		num2_out : out std_logic_vector(3 downto 0);
		num3_out : out std_logic_vector(3 downto 0);
		num4_out : out std_logic_vector(3 downto 0);
		
		led_out  : out integer range 0 to 2;
		timer_running : out std_logic
	);
end control_unit;


architecture Behavioral of control_unit is
-- Main FSM
constant GAME_READY     : integer := 0;
constant GAME_INPUT_ANS : integer := 1;
constant GAME_GUESSING  : integer := 2;
constant GAME_SHOW_HINT : integer := 3;
constant GAME_WIN       : integer := 4;
constant GAME_LOSE      : integer := 5;
signal game_state       : integer := GAME_READY;  -- Default state when system starts

-- LED State (can be set/updated via `state` port)
constant LED_FLASHING   : integer := 0;
constant LED_COUNTDOWN  : integer := 1;
constant LED_STOPPED    : integer := 2;
signal led_state        : integer := LED_FLASHING;  -- Default LED state when system starts

-- Seg7 Buffer (4-digit buffer)
constant NUM_EMPTY      : std_logic_vector(3 downto 0) := "1111";
signal num_1            : std_logic_vector(3 downto 0);
signal num_2            : std_logic_vector(3 downto 0);
signal num_3            : std_logic_vector(3 downto 0);
signal num_4            : std_logic_vector(3 downto 0);
signal num_current      : integer := 0;

-- Saved numbers
signal num_ans          : std_logic_vector(15 downto 0);
signal num_guessed      : std_logic_vector(15 downto 0);

-- Hints (_A_B)
signal hint_a           : std_logic_vector(3 downto 0);
signal hint_b           : std_logic_vector(3 downto 0);

begin
	process(pulse)
	variable num_1_v     : std_logic_vector(3 downto 0);
	variable num_2_v     : std_logic_vector(3 downto 0);
	variable num_3_v     : std_logic_vector(3 downto 0);
	variable num_4_v     : std_logic_vector(3 downto 0);
	variable num_ans_v   : std_logic_vector(15 downto 0);
	variable num_guessed_v: std_logic_vector(15 downto 0);
	begin
	
		-- This block is only executed when PS1 (pulse) is pressed.
		if (rising_edge(pulse)) then
			case game_state is
				when GAME_READY =>
					game_state <= GAME_INPUT_ANS;
					led_state <= LED_FLASHING;
					num_current <= 1;
					
				when GAME_INPUT_ANS =>
					if (num_current >= 5) then
						game_state <= GAME_GUESSING;
						led_state <= LED_COUNTDOWN;
						num_current <= 1;
						-- Save num_ans
						num_1_v := num_1;
						num_2_v := num_2;
						num_3_v := num_3;
						num_4_v := num_4;
						num_ans <= num_1_v & num_2_v & num_3_v & num_4_v;
					else
						num_current <= num_current + 1;
					end if;
					
				when GAME_GUESSING =>
					if (num_current >= 5) then
						num_1_v := num_1;
						num_2_v := num_2;
						num_3_v := num_3;
						num_4_v := num_4;
						
						if (num_1_v & num_2_v & num_3_v & num_4_v = num_ans) then
							game_state <= GAME_WIN;
						else
							game_state <= GAME_SHOW_HINT;
							num_current <= 0;
							-- Save num_guessed
							num_guessed_v := num_1_v & num_2_v & num_3_v & num_4_v;
							
							-- Show Hint (_A_B)
							for i in 4 downto 1 loop
								for j in 4 downto 1 loop
									if (i = j and num_guessed_v(4 * i - 1 downto 4 * i - 4) = num_ans(4 * j - 1 downto 4 * j - 4)) then
										hint_a <= hint_a + 1;
									elsif (num_guessed_v(4 * i - 1 downto 4 * i - 4) = num_ans(4 * j - 1 downto 4 * j - 4)) then
										hint_b <= hint_b + 1;
									end if;
								end loop;
							end loop;
						end if;
						
					else
						num_current <= num_current + 1;
					end if;
					
				when GAME_SHOW_HINT =>
					game_state <= GAME_GUESSING;
					num_current <= 1;
					hint_a <= "0000";
					hint_b <= "0000";
					
				when GAME_WIN =>
					game_state <= GAME_READY;
					led_state <= LED_FLASHING;
					num_current <= 0;
					
				when GAME_LOSE =>
					game_state <= GAME_READY;
					led_state <= LED_FLASHING;
					num_current <= 0;
					
				when others => null;
			end case;
			
			
			-- If time is up, then transit to GMAE_LOSE.
			--if (has_remaining_time = '0') then
			--	game_state <= GAME_LOSE;
			--end if;
			
		end if;
		
		
		-- Shows current (unsaved) number.
		if (game_state = GAME_SHOW_HINT) then
			num_1 <= hint_a;
			num_2 <= "1010"; -- A
			num_3 <= hint_b;
			num_4 <= "1011"; -- b
		else
			case num_current is
				when 1 =>
					num_1 <= sw_in;
				when 2 =>
					num_2 <= sw_in;
				when 3 =>
					num_3 <= sw_in;
				when 4 =>
					num_4 <= sw_in;
				when others =>
					null;
			end case;
		end if;
		
		
	end process;
	
	num1_out <= num_1;
	num2_out <= num_2;
	num3_out <= num_3;
	num4_out <= num_4;
	led_out <= led_state;
	
	-- timer_running is set to `true` when led is in countdown state.
	with led_state select
	timer_running <=  '1' when LED_COUNTDOWN,
							'0' when others;
end Behavioral;