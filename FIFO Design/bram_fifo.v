module singleportram_fifo(
din,
cs,
oe,
address_wr,
address_rd,
we,
clk,
dout
);
parameter DATA_WIDTH = 4 ;
parameter ADDRESS_WIDTH = 4 ;


input [DATA_WIDTH-1:0] din;
input cs;
input oe;
input we;
input [ADDRESS_WIDTH-1:0] address_wr;

input [ADDRESS_WIDTH-1:0] address_rd;
input clk;
output [DATA_WIDTH-1:0] dout;


reg [DATA_WIDTH-1:0] memoryelement[10:0];
reg [DATA_WIDTH-1:0] d_out[10:0];
always @(posedge clk or posedge address_wr or posedge address_rd)begin
if (cs && we && !oe) begin
memoryelement[address_wr]<=din;
end
else if(cs && !we && oe) begin
d_out[address_rd]<=memoryelement[address_wr];
end
end
assign  dout =d_out[address_rd];
endmodule