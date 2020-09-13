
module tb_singleportramsync;
parameter DATA_WIDTH = 8 ;
parameter ADDRESS_WIDTH = 8 ;

reg [DATA_WIDTH-1:0] din_0;
reg cs_0;
reg oe_0;
reg we_0;
reg clk_0;
reg [ADDRESS_WIDTH-1:0] address_0;
wire [DATA_WIDTH-1:0] dout_0;

reg [DATA_WIDTH-1:0] din_1;
reg cs_1;
reg oe_1;
reg we_1;
reg clk_1;
reg [ADDRESS_WIDTH-1:0] address_1;
wire [DATA_WIDTH-1:0] dout_1;

dualportram ss( 
.din_0(din_0),
.cs_0(cs_0),
.oe_0(oe_0),
.we_0(we_0),
.address_0(address_0),
.clk_0(clk_0),
.dout_0(dout_0),
.din_1(din_1),
.cs_1(cs_1),
.oe_1(oe_1),
.we_1(we_1),
.address_1(address_1),
.clk_1(clk_1),
.dout_1(dout_1)
);

always #10 clk_0=~clk_0;

always #10 clk_1=~clk_1;
initial begin
cs_0 =1;
oe_0 =0;
we_0 =0;
clk_0 =0;
cs_1 =0;
oe_1 =0;
we_1 =0;
clk_1 =0;
end

initial begin
cs_0 <=1;
oe_0<=0;
#10 we_0<=1;
#20 address_0<=0;
#20 din_0 <= 145;
#30 address_0 <=1;
#30 din_0 <= 155;
#40 address_0 <=2;
#40 din_0 <= 165;
#50 we_0 <=0;
#50 address_0<=3;
#50 din_0 <= 175;
#60 oe_0 <= 1;
#70 address_0 <=0;
#80 address_0 <=1;
#90 address_0 <=2;
cs_1 <=1;
oe_1<=0;
#110 we_1<=1;
#120 address_1<=0;
#120 din_1 <= 145;
#130 address_1 <=1;
#130 din_1 <= 155;
#140 address_1 <=2;
#140 din_1 <= 165;
#150 we_1 <=0;
#150 address_1<=3;
#150 din_1 <= 175;
#160 oe_1 <= 1;
#170 address_1 <=0;
#180 address_1 <=1;
#190 address_1 <=2;
end
endmodule