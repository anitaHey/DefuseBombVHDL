library verilog;
use verilog.vl_types.all;
entity keyboard is
    port(
        Row             : in     vl_logic_vector(2 downto 0);
        Column          : in     vl_logic_vector(2 downto 0);
        valid_in        : in     vl_logic;
        num_out         : out    vl_logic_vector(3 downto 0);
        valid_out       : out    vl_logic
    );
end keyboard;
