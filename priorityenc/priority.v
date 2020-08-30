module priorityen(
input [7:0] a,
input [7:0] b,
input [7:0] c,
input [7:0] d,
input [1:0] sel,
output reg [7:0] out);

always @ (sel) begin
case (sel)
'b00: out<=a; 
'b01: out<=b;
'b10: out<=c;
'b11: out<=d;
endcase
end


endmodule