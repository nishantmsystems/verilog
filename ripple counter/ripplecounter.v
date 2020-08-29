module dff(
input D,
input clk,
input reset,
output reg q,
output qbar
);

always @ (posedge clk or negedge reset)begin
	if (!reset)
		q <= 0;
	else 
		q <= D;
end
assign qbar = ~q;

endmodule

module ripple ( input clk,
                input reset,
                output [3:0] out);
   wire  q0;
   wire  qbar0;
   wire  q1;
   wire  qbar1;
   wire  q2;
   wire  qbar2;
   wire  q3;
   wire  qbar3;

   dff   dff0 ( .D (qbar0),
                .clk (clk),
                .reset (reset),
                .q (q0),
                .qbar (qbar0));

   dff   dff1 ( .D (qbar1),
                .clk (q0),
                .reset (reset),
                .q (q1),
                .qbar (qbar1));

   dff   dff2 ( .D (qbar2),
                .clk (q1),
                .reset (reset),
                .q (q2),
                .qbar (qbar2));

   dff   dff3 ( .D (qbar3),
                .clk (q2),
                .reset (reset),
                .q (q3),
                .qbar (qbar3));

   assign out = {qbar3, qbar2, qbar1, qbar0};

endmodule
	