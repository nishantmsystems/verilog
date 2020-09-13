module singleportram(
din,
cs,
oe,
address,
we,
clk,
dout
);
parameter DATA_WIDTH = 8 ;
parameter ADDRESS_WIDTH = 8 ;


input [DATA_WIDTH-1:0] din;
input cs;
input oe;
input we;
input [ADDRESS_WIDTH-1:0] address;
input clk;
output [DATA_WIDTH-1:0] dout;


reg [DATA_WIDTH-1:0] memoryelement[ADDRESS_WIDTH-1:0];
reg [DATA_WIDTH-1:0] d_out[ADDRESS_WIDTH-1:0];
always @(posedge clk)begin
if (cs && we && !oe) begin
memoryelement[address]<=din;
end
end
always @(*)begin
if(cs && !we && oe) begin
d_out[address]<=memoryelement[address];
end
end
assign  dout =d_out[address];
endmodule

