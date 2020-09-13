module asyncreset(
input [2:0] d,
output reg [2:0] q,
input reset,
input clk
);

always @* begin  //For synchronous always @(posedge clk)

if (reset==1)begin
q<=1'b1;
end
else begin
q<=d;
end

end
endmodule
