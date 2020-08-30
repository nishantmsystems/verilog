module modncounter 
# (parameter N = 10,
     parameter SIZE = 4) (
input clk, 
input rstn,
output reg [SIZE-1:0] out
);
integer i;
always @(posedge clk) begin
	if(!rstn) begin
		out<=0;
	end
	else begin
		if (out==N-1)
			out<=0;
		else
			out<=out+1;
	end
end
endmodule

