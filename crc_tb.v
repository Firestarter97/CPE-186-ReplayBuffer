//`include "crc.v"

module crc_tb;

reg clk_t;
reg rst_t;
reg we_t;
reg [95:0] tlp_in_t;

wire [95:0] crc_out_t;

crc UUT(.clk(cl_t),.rst(rst_t),.tlp_in(tlp_in_t),.crc_out(crc_out_t));

always 
#5 clk_t = ~clk_t;

initial
begin

tlp_in_t = 96'h123456789abcdefffff12345;
#100;
tlp_in_t = 96'h123456789fffff123456ffff;
#100;
tlp_in_t = 96'h987654321abcdefffff12345;
#100;
tlp_in_t = 96'h987654321fffffffff123456;
#100;
tlp_in_t = 96'h12345678912345ffffff1234;
#100;
#20 $finish;
end

endmodule
