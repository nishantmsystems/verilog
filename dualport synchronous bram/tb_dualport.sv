module tb_dualportramsync;
parameter DATA_WIDTH = 8 ;
parameter ADDRESS_WIDTH = 8 ;

reg [DATA_WIDTH-1:0] din_0;
reg cs_0;
reg oe_0;
reg we_0;
reg clk_0;
reg [ADDRESS_WIDTH-1:0] address_0;
reg [DATA_WIDTH-1:0] dout_0;
reg [DATA_WIDTH-1:0] tb_data;
wire [DATA_WIDTH-1:0] din_1;
reg cs_1;
reg oe_1;
reg we_1;
reg clk_1;
wire [ADDRESS_WIDTH-1:0] address_1;
wire [DATA_WIDTH-1:0] dout_1;
reg [DATA_WIDTH-1:0] a[0:100];

reg [DATA_WIDTH-1:0] b[0:100];
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



initial begin
    {clk_0, we_0, address_0, tb_data, oe_0} <= 0;

 repeat (2) @(posedge clk_0) 
    for (integer i = 0; i < 4; i= i+1) begin
      repeat (1) @(posedge clk_0) address_0 <= i; we_0 <= 1; cs_0 <=1; oe_0 <= 0; tb_data <= i;
    end
repeat (2) @(posedge clk_0) 
    for (integer i =0; i <4; i=i+1) begin
      repeat (1) @(posedge clk_0) address_0 <= i; we_0 <= 0; cs_0 <= 1; oe_0 <= 1;
    end

  end
  assign din_0 = tb_data;
endmodule