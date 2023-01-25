// Zachary Stewart
// ECE 176 HW 12
// Hierarchichal Multiplier
//
// Inputs: start, reset_a, clk,
//			  [7:0] dataa, datab
//
// Outputs: seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g, done_flag,
//				[15:0] product8x8_out
//////////////////////////////////////////////////////////////////////////

// Top Level Module
module mult8x8(input [7:0] dataa, datab, input start, reset_a, clk,
					output seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g,
					done_flag, output [15:0] Product8x8_out);
	
	// Wires to represent internal connections
	wire sclr_n, clk_ena;
	wire [1:0] count, sel, shift;
	wire [2:0] state_out;
	wire [3:0] aout, bout;
	wire [7:0] product;
	wire [15:0] sum, shift_out;

	// Multiplexer 1 (U1)
	mux4 U1 (.mux_sel(sel[1]), .mux_in_a(dataa[3:0]), .mux_in_b(dataa[7:4]),
				.mux_out(aout[3:0]));
	
	// Multiplexer 2 (U2)
	mux4 U2 (.mux_sel(sel[0]), .mux_in_a(datab[3:0]), .mux_in_b(datab[7:4]),
				.mux_out(bout[3:0]));
	
	// 4x4 Multiplier (U3)
	mult4x4 U3 (.dataa(aout[3:0]), .datab(bout[3:0]), .product(product[7:0]));
	
	// Shifter (U4)
	shifter U4 (.inp(product[7:0]), .shift_cntrl(shift[1:0]), 
					.shift_out(shift_out[15:0]));
	
	// Counter (U5)
	counter U5 (.clk(clk), .asclr_n(~start), .count_out(count));
	
	// Multiplier Control (U6)
	mult_control U6 (.clk(clk), .reset_a(reset_a), .start(start), 
						  .count(count[1:0]), .input_sel(sel[1:0]), 
						  .shift_sel(shift[1:0]), .state_out(state_out[2:0]), 
						  .done(done_flag), .clk_en(clk_ena), .sclr_n(sclr_n));
	
	// 16-Bit Register (U7)
	reg16 U7 (.clk(clk), .sclr_n(sclr_n), .clk_ena(clk_ena), 
				 .datain(sum[15:0]), .reg_out(Product8x8_out[15:0]));
	
	// Adder (U8)
	adder U8 (.dataa(shift_out[15:0]), .datab(Product8x8_out[15:0]),
				 .sum(sum[15:0]));
	
	// Seven Segment Control (U9) 
	seven_segment_cntrl U9 (.inp(state_out[2:0]), .seg_a(seg_a), .seg_b(seg_b),
									.seg_c(seg_c), .seg_d(seg_d), .seg_e(seg_e), 
									.seg_f(seg_f), .seg_g(seg_g));

endmodule
