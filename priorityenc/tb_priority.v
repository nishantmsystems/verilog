module tb_priority;
reg [7:0] a;
reg [7:0] b;
reg [7:0] c;
reg [7:0] d;
reg [1:0] sel;
wire [7:0] out;

priorityen pr(.a(a),
.b(b),
.c(c),
.d(d),
.sel(sel),
.out(out));

initial begin
a<=1;
b<=6;
c<=10;
d<=12;
#10 sel <='b00;
$monitor ("out=0x%0h", out);
#20 sel <= 'b01;
$monitor ("out=0x%0h", out);
#40 sel <= 'b10;
$monitor ("out=0x%0h", out);
#60 sel <= 'b11;
$monitor ("out=0x%0h", out);
end
endmodule

