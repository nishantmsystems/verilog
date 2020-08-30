module tb_ring;

  reg clk;
  reg rstn;
  wire [3:0] out;

  ringcounter 	r0 (.clk (clk),
                .rstn (rstn),
                .out (out));

  always #10 clk = ~clk;

  initial begin
    {clk, rstn} <= 0;

    $monitor ("T=%0t out=%b", $time, out);
    repeat (2) @(posedge clk);
    rstn <= 1;
    repeat (15) @(posedge clk);
    $finish;
  end
endmodule