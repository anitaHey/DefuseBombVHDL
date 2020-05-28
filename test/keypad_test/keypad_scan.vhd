library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity keypad_scan is
    port( clk_1k : in std_logic;
            col : in std_logic_vector(2 downto 0);
            row : buffer std_logic_vector(2 downto 0);
            strobe : out std_logic;
            code_k : out std_logic_Vector(3 downto 0));
end keypad_scan;

architecture keypad_scan_arch of keypad_scan is
    signal scan : integer range 0 to 3;
    signal k : std_logic_vector(0 to 11);
    signal t1 : std_logic;

begin
    p_scan : process(clk_1k)
    begin
        if clk_1k'event and clk_1k = '1' then
            if scan /= 3 then
                scan <= scan + 1;
            else
                scan <= 0;
            end if;
        end if;
    end process;

    p_row : process(clk_1k, scan)
    begin
        if clk_1k'event and clk_1k = '1' then
            case scan is 
                when 0 => row <= "000";
                when 1 => row <= "100";
                when 2 => row <= "010";
                when 3 => row <= "110";
            end case;
        end if;
    end process;

    p_r0 : process(clk_1k, row)
    begin
        if clk_1k'event and clk_1k = '1' and row = "000" then
            k(1) <= not col(0);
            k(2) <= not col(1);
            k(3) <= not col(2);
        end if;
    end process;

    p_r1 : process(clk_1k, row)
    begin
        if clk_1k'event and clk_1k = '1' and row = "100" then
            k(4) <= not col(0);
            k(5) <= not col(1);
            k(6) <= not col(2);
        end if;
    end process;

    p_r2 : process(clk_1k, row)
    begin
        if clk_1k'event and clk_1k = '1' and row = "010" then
            k(7) <= not col(0);
            k(8) <= not col(1);
            k(9) <= not col(2);
        end if;
    end process;

    p_r3 : process(clk_1k, row)
    begin
        if clk_1k'event and clk_1k = '1' and row = "110" then
            k(10) <= not col(0);
            k(0) <= not col(1);
            k(11) <= not col(2);

        end if;
    end process;

    p_stb : process(clk_1k, k, t1)
        variable sin : std_logic;
    begin
        sin := not (k(0) or k(1) or k(2) or k(3) or k(4) or k(5) or k(6) or k(7) or k(8) or k(9) or k(10) or k(11));
        if clk_1k'event and clk_1k = '1' then
            t1 <= sin;
        end if;
        strobe <= sin or (not t1);
    end process;

    p_enc : process(k)
    begin
        if k(11) = '1' then code_k <= "1011";
        elsif k(10) = '1' then code_k <= "1010";
        elsif k(9) = '1' then code_k <= "1001";
        elsif k(8) = '1' then code_k <= "1000";
        elsif k(7) = '1' then code_k <= "0111";
        elsif k(6) = '1' then code_k <= "0110";
        elsif k(5) = '1' then code_k <= "0101";
        elsif k(4) = '1' then code_k <= "0100";
        elsif k(3) = '1' then code_k <= "0011";
        elsif k(2) = '1' then code_k <= "0010";
        elsif k(1) = '1' then code_k <= "0001";
        elsif k(0) = '1' then code_k <= "0000";
        else code_k <= "1111";
        end if;
    end process;
end keypad_scan_arch;