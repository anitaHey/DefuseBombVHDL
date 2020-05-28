library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity d_7seg is
    port( clk : in std_logic;
            d0 : in integer range 0 to 9;
            d1 : in integer range 0 to 9;
            d2 : in integer range 0 to 9;
            d3 : in integer range 0 to 9;
            seg_com : out std_logic_vector(2 downto 0);
            seg_data : out std_logic_vector(7 downto 0));
end d_7seg;

architecture d_7seg_arch of d_7seg is
    signal scan : integer range 0 to 3 := 0;

        function dec_7_seg(bcd : integer range 0 to 9) return std_logic_vector is
            variable res : std_logic_vector(7 downto 0);

        begin
            if(bcd = "0000") then res := "00111111";
            elsif(bcd = "0001") then res := "00000110";
            elsif(bcd = "0010") then res := "01011011";
            elsif(bcd = "0011") then res := "01001111";
            elsif(bcd = "0100") then res := "01100110";
            elsif(bcd = "0101") then res := "01101101";
            elsif(bcd = "0110") then res := "01111101";
            elsif(bcd = "0111") then res := "00100111";
            elsif(bcd = "1000") then res := "01111111";
            elsif(bcd = "1001") then res := "01100111";
            else res := "11000000";
            end if;
            return res;
        end dec_7_seg;

begin
    p_scan : process(clk)
    begin
        if clk'event and clk = '1' then
            if scan /= 3 then
                scan <= scan + 1;
            else
                scan <= 0;
            end if;
        end if;
    end process;

    p_disp : process(scan, d0, d1, d2, d3)
    begin
        case scan is
            when 0 => 
                seg_data <= dec_7_seg(d0);
                seg_com <= "000";
            when 1 => 
                seg_data <= dec_7_seg(d1);
                seg_com <= "100";
            when 2 => 
                seg_data <= dec_7_seg(d2);
                seg_com <= "010";
            when 3 =>
                seg_data <= dec_7_seg(d3);
                seg_com <= "110";
            when others =>
                seg_data <= x"00";
                seg_com <= "111";
        end case;
    end process;
end d_7seg_arch;