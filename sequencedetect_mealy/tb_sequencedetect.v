module tb_sequencedetect;

reg clk;
reg reset;
reg datain;
wire sequencedetect;
reg [15:0] inseq;
integer i;
sequencedetector ss(
.clk(clk),
.reset(reset),
.datain(datain),
.sequencedetect(sequencedetect)
);
always #10 clk=~clk;  
initial begin
clk<=0;
#10 reset <=1;
#15 reset<=0;
inseq = 16'b0010100110101011;
i=0;

end
always@(posedge clk)begin
datain<= inseq>>i;
i=i+1;
end
endmodule
