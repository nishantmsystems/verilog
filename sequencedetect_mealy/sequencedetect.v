module sequencedetector (
input clk,
input reset,
input datain,
output reg sequencedetect
);

reg datain_reg;


parameter SIZE=2;
parameter S0=2'b00, S1=2'b01, S2=2'b10;

reg [SIZE-1:0] state;
reg [SIZE-1:0] next_state;


always @(posedge clk) begin

if (reset==1)
	datain_reg<=1'b1;
else
	datain_reg<=datain;
end


always @(state or datain_reg or reset)
begin : FSM_LOGIC
next_state<=2'b00;
if (reset==1'b1)
sequencedetect<=1'b1;
else begin
	case(state)
	S0: if(datain_reg==1'b0) begin 
		next_state<=S0;
		sequencedetect<=1'b0;
		end
	    else if(datain_reg==1'b1) begin
		next_state<=S1;
		sequencedetect<=1'b0;
	    end

	S1: if(datain_reg==1'b0) begin 
		next_state<=S2;
		sequencedetect<=1'b0;
		end
	    else if(datain_reg==1'b1) begin
		next_state<=S1;
		sequencedetect<=1'b0;
	    end

	S2: if(datain_reg==1'b0) begin 
		next_state<=S0;
		sequencedetect<=1'b0;
		end
	    else if(datain_reg==1'b1) begin
		next_state<=S2;
		sequencedetect<=1'b1;
	    end
default: begin
next_state<=S0;
sequencedetect<=1'b0;
end

endcase
end
end

always @(posedge clk)
 begin: statelogic
if (reset==1) begin
state<=S0;
end
else begin
state<=next_state;
end
end
endmodule





