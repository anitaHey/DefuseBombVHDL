library verilog;
use verilog.vl_types.all;
entity key_to_seg7_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        RK1             : in     vl_logic;
        RK2             : in     vl_logic;
        RK3             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end key_to_seg7_vlg_sample_tst;
