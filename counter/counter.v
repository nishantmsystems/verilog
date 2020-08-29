module counter (  input clk,      
                  input resetn,             
                  output reg[31:0] last);    


  always @ (posedge clk) begin
    if (! resetn)
      last <= 0;
    else
      last <= last + 1;
  end
endmodule