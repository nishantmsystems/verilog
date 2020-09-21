module fifo_top #(parameter DATA_WIDTH = 4 ,
parameter ADDRESS_WIDTH = 4 , parameter RAM_DEPTH =10)(
input clk,
input reset,
output reg empty,
output reg full,
input write_en,
input read_en,
input [DATA_WIDTH:0] fifo_in,
output [DATA_WIDTH:0] fifo_out
);

reg [ADDRESS_WIDTH-1:0] write_ptr =0;

reg [ADDRESS_WIDTH-1:0] read_ptr;

always @(posedge clk) begin
	if(reset==1)begin
		full<=0;
		empty<=1;
	end
	else if(reset==0 && write_en==1 && read_en==0 && full!=1) begin
		write_ptr=write_ptr+1;
		read_ptr=write_ptr+1;
		empty<=0;
		if (write_ptr==RAM_DEPTH) begin
			full=1;
		end
	end
	else if (reset==0 && write_en==0 && read_en==1 && empty!=1) begin	
		read_ptr=read_ptr-1;
		write_ptr=read_ptr-1;
		full<=0;
		if (read_ptr ==0 && full !=1 ) begin
			empty=1;
			write_ptr=0;
		end
		
	end
end

singleportram_fifo DP_RAM(
.din(fifo_in),
.cs (1),
.oe (read_en),
.address_wr(write_ptr),
.address_rd (read_ptr),
.we (write_en),
.clk(clk),
.dout(fifo_out)
);

endmodule

