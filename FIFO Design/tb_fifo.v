module tb_fifo();

parameter DATA_WIDTH = 4 ;
parameter ADDRESS_WIDTH = 4 ;


reg [DATA_WIDTH-1:0] fifo_in;
wire empty;
wire full;
reg write_en;
reg read_en;
reg reset;
wire [DATA_WIDTH-1:0] fifo_out;
reg clk;
reg [32:0] inseq;
integer i;
fifo_top f(
.clk(clk),
.reset(reset),
.empty(empty),
.full(full),
.write_en(write_en),
.read_en(read_en),
.fifo_in(fifo_in),
.fifo_out(fifo_out)
);


always #10 clk=~clk;

initial begin

clk <=0;
reset <= 1;
fifo_in<=0;
write_en <=1;

end

initial begin

#60 reset <= 0;
read_en<=0;
inseq <= 32'h123456;
i<=0;
#160 write_en <=0;
#160 read_en<=1;
end
always@(posedge clk)begin
fifo_in<= inseq>>i;
i<=i+1;
end
endmodule