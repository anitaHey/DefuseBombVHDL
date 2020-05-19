library verilog;
use verilog.vl_types.all;
entity key_to_seg7_vlg_check_tst is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        C               : in     vl_logic;
        D               : in     vl_logic;
        DE1             : in     vl_logic;
        DE2             : in     vl_logic;
        DE3             : in     vl_logic;
        E               : in     vl_logic;
        F               : in     vl_logic;
        G               : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end key_to_seg7_vlg_check_tst;
