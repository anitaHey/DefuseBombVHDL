library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity keypad is
    port( 	clk_1k : in std_logic;
				clk : in std_logic;
            col : in std_logic_vector(2 downto 0);
            row : out std_logic_vector(2 downto 0);
            seg_com : out std_logic_vector(2 downto 0);
				code_k : out std_logic_vector(3 downto 0);
            seg_data : out std_logic_vector(7 downto 0));
end keypad;

architecture input_keypad_arch of keypad is

    component keypad_scan is
        port( clk_1k : in std_logic;
                col : in std_logic_vector(2 downto 0);
                row : buffer std_logic_vector(2 downto 0);
                strobe : out std_logic;
                code_k : out std_logic_vector(3 downto 0));
    end component;

    component d_7seg is
        port( clk : in std_logic;
                d0 : in integer range 0 to 9;
                d1 : in integer range 0 to 9;
                d2 : in integer range 0 to 9;
                d3 : in integer range 0 to 9;
                seg_com : out std_logic_vector(2 downto 0);
                seg_data : out std_logic_vector(7 downto 0));
    end component;

    signal key : std_logic_vector(3 downto 0);
    signal d0, d1, d2, d3 : integer range 0 to 9;
    signal strobe : std_logic;

begin
    p_shift : process(strobe, key)
    begin
        if(key = "1010" or key = "1011") then
            d0 <= 0;
            d1 <= 0;
            d2 <= 0;
            d3 <= 0;
        elsif strobe'event and strobe = '1' then
            d3 <= d2;
            d2 <= d1;
            d1 <= d0;
            d0 <= conv_integer(key);
        end if;
    end process;

    keyin : keypad_scan port map(clk_1k, col, row, strobe, code_k);
    disp : d_7seg port map(clk, d0, d1, d2, d3, seg_com, seg_data);
end input_keypad_arch;