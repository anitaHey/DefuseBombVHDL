library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity control_unit is
	port(
		sw_in   : in std_logic_vector(3 downto 0); -- sw1, sw2, sw3, sw4
		pulse   : in std_logic;
		
		num1_out : out std_logic_vector(3 downto 0);
		num2_out : out std_logic_vector(3 downto 0);
		num3_out : out std_logic_vector(3 downto 0);
		num4_out : out std_logic_vector(3 downto 0);
		
		led_out  : out integer range 0 to 2);
end control_unit;


architecture Behavioral of control_unit is
-- Main FSM
constant GAME_READY     : integer := 0;
constant GAME_INPUT_ANS : integer := 1;
constant GAME_GUESSING  : integer := 2;
constant GAME_WIN       : integer := 3;
constant GAME_LOSE      : integer := 4;
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

begin
	process(pulse)
	begin
	
		-- This block is only executed when PS1 (pulse) is pressed.
		if (rising_edge(pulse)) then
			case game_state is
				when GAME_READY =>
					game_state <= GAME_INPUT_ANS;
					led_state <= LED_FLASHING;
					num_current <= 1;
					
				when GAME_INPUT_ANS =>
					if (num_current >= 4) then
						game_state <= GAME_GUESSING;
						led_state <= LED_COUNTDOWN;
						num_current <= 1;
					else
						num_current <= num_current + 1;
					end if;
					
				when GAME_GUESSING =>
					if (num_current >= 4) then
						game_state <= GAME_WIN;
						led_state <= LED_STOPPED;
						num_current <= 0;
					else
						num_current <= num_current + 1;
					end if;
					
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
			
		end if;
		
		-- Shows current (unsaved) number.
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
		
	end process;
	
	num1_out <= num_1;
	num2_out <= num_2;
	num3_out <= num_3;
	num4_out <= num_4;
	led_out <= led_state;
end Behavioral;