library verilog;
use verilog.vl_types.all;
entity key_to_seg7 is
    port(
        DE1             : out    vl_logic;
        clk             : in     vl_logic;
        DE2             : out    vl_logic;
        DE3             : out    vl_logic;
        A               : out    vl_logic;
        RK1             : in     vl_logic;
        RK2             : in     vl_logic;
        RK3             : in     vl_logic;
        B               : out    vl_logic;
        C               : out    vl_logic;
        D               : out    vl_logic;
        E               : out    vl_logic;
        F               : out    vl_logic;
        G               : out    vl_logic
    );
end key_to_seg7;
