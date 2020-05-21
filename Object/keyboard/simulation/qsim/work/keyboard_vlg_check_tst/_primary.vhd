library verilog;
use verilog.vl_types.all;
entity keyboard_vlg_check_tst is
    port(
        num_out         : in     vl_logic_vector(3 downto 0);
        valid_out       : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end keyboard_vlg_check_tst;
