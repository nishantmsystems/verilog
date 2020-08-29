module tb_ripple;
   reg clk;
   reg rstn;
   wire [3:0] out;

   ripple r0   (  .clk (clk),
                  .reset (rstn),
                  .out (out));

   always #5 clk = ~clk;

   initial begin
	#0 clk <=0;
     #100 rstn <= 0;
     #100 rstn <= 1;

   end
endmodule