module tb_modcounter;
parameter SIZE=4;
parameter N=10;

reg clk;
reg rstn;
wire [SIZE-1:0] out;

modncounter m0(.clk(clk),
.rstn(rstn),
.out(out)
);
 always #10 clk = ~clk;

  initial begin
    clk <= 0;
    rstn<=0;

    $monitor ("T=%0t rstn=%0b out=0x%0h", $time, rstn, out);
    repeat(2) @ (posedge clk);
    rstn <= 1;

    repeat(20) @ (posedge clk);
    $finish;
  end
endmodule