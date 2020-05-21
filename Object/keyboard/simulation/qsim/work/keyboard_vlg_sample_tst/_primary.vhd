library verilog;
use verilog.vl_types.all;
entity keyboard_vlg_sample_tst is
    port(
        Column          : in     vl_logic_vector(2 downto 0);
        Row             : in     vl_logic_vector(2 downto 0);
        valid_in        : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end keyboard_vlg_sample_tst;
