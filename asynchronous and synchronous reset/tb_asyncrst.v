module tb_asyncrst;

reg [2:0] d;
reg clk,reset;
wire [2:0] q;

asyncreset aa(.d(d),
.q(q),
.clk(clk),
.reset(reset)

);
always #10 clk = ~clk;


initial begin
clk<=0;
reset<=0;
assign d=3'h3;
end
initial begin
#40 reset<=0;
#80 reset<=1;
end
endmodule
