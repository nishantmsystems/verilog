module dualportram(
din_0,
cs_0,
oe_0,
address_0,
we_0,
clk_0,
dout_0,
din_1,
cs_1,
oe_1,
address_1,
we_1,
clk_1,
dout_1,

);
parameter DATA_WIDTH = 8 ;
parameter ADDRESS_WIDTH = 8 ;


input [DATA_WIDTH-1:0] din_0;
input cs_0;
input oe_0;
input we_0;
input [ADDRESS_WIDTH-1:0] address_0;
input clk_0;
output [DATA_WIDTH-1:0] dout_0;


input [DATA_WIDTH-1:0] din_1;
input cs_1;
input oe_1;
input we_1;
input [ADDRESS_WIDTH-1:0] address_1;
input clk_1;
output [DATA_WIDTH-1:0] dout_1;

reg [DATA_WIDTH-1:0] memoryelement_0[ADDRESS_WIDTH-1:0];
reg [DATA_WIDTH-1:0] d_out_0[ADDRESS_WIDTH-1:0];
reg [DATA_WIDTH-1:0] memoryelement_1[ADDRESS_WIDTH-1:0];
reg [DATA_WIDTH-1:0] d_out_1[ADDRESS_WIDTH-1:0];

always @(posedge clk_0)begin  //WRITE
if (cs_0 && we_0 && !oe_0) begin
memoryelement_0[address_0]<=din_0;
end
end

always @(posedge clk_1)begin
if (cs_1 && we_1 && !oe_1)begin
memoryelement_1[address_1]<=din_1;
end
end

always @(posedge clk_0)begin  //READ
if(cs_0 && !we_0 && oe_0) begin
d_out_0[address_0]<=memoryelement_0[address_0];
end
end

always @(posedge clk_1)begin  //READ
if(cs_1 && !we_1 && oe_1) begin
d_out_1[address_1]<=memoryelement_1[address_1];
end
end
assign  dout_0 =d_out_0[address_0];
assign  dout_1 =d_out_1[address_1];
endmodule

