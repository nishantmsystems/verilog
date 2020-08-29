module tb_counter;
  reg clk;                     
  reg rstn;                   
  wire [31:0] out;              

  // Instantiate counter design and connect with Testbench variables
  counter   c0 ( .clk (clk),
                 .resetn (rstn),
                 .last (out));


  always #10 clk = ~clk;

  initial begin

    clk <= 0;
    rstn <= 0;


    #20   rstn <= 1;
    #80   rstn <= 0;
    #50   rstn <= 1;

 
    #200 $finish;
  end
endmodule