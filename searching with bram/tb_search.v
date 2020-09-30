module tb_singleportramsync;
parameter DATA_WIDTH = 8 ;
parameter ADDRESS_WIDTH = 8 ;

reg [DATA_WIDTH-1:0] din;
reg cs;
reg oe;
reg we;
reg clk;
reg [ADDRESS_WIDTH-1:0] address;
wire [DATA_WIDTH-1:0] dout;
wire [DATA_WIDTH-1:0] position;

singleportram11 ss( 
.din(din),
.cs(cs),
.oe(oe),
.we(we),
.address(address),
.clk(clk),
.dout(dout),
.position(position)
);

always #10 clk=~clk;
initial begin
cs =1;
oe =0;
we =0;
clk =0;
end

initial begin
cs <=1;
oe<=0;
#10 we<=1;
#20 address<=0;
#20 din <= 165;
#30 address <=1;
#30 din <=3;
#40 address <=2;
#40 din <= 2;
#50 we <=0;
#50 address<=3;
#50 din <= 0;
#60 oe <= 1;
#70 address <=0;
#80 address <=1;
#90 address <=2;
end
endmodule