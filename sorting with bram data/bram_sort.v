module singleportram11(
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

integer i=0;
integer k=0;
reg [DATA_WIDTH-1:0] memoryelement[ADDRESS_WIDTH-1:0];

reg [DATA_WIDTH-1:0] temp;
reg [DATA_WIDTH-1:0] d_out[ADDRESS_WIDTH-1:0];
always @(posedge clk)begin
if (cs && we && !oe) begin
memoryelement[address]<=din;
end

else if(cs && !we && oe) begin
d_out[address]<=memoryelement[address];
end
end
always @(we)begin
for (k=0;k<3;k=k+1)begin
	for (i=0;i<3;i=i+1)
	begin
    		if(memoryelement[i+1]<memoryelement[i])
    		begin
        		temp=memoryelement[i+1];
        		memoryelement[i+1]=memoryelement[i];
        		memoryelement[i]=temp;
    		end
	end
end
end

assign  dout =d_out[address];
endmodule