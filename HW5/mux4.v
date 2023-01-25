`timescale 1ns/100ps

module mux4 (input mux_sel, input [3:0] mux_in_a, mux_in_b, output reg [3:0] mux_out);
	always @ (mux_sel, mux_in_a, mux_in_b) begin
			if (mux_sel) mux_out = mux_in_b;
			else mux_out = mux_in_a;
	end
endmodule
