// Zachary Stewart
// ECE 176
// Homework: 7-seg LED Display Controller
//
// Inputs: [2:0] inp 
//
// Outputs: seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g
//
// This module is designed to drive a seven segment display using a 3-bit input. The input 'inp'
// is used to select the four possible mode of operations. A default case is used to display
// another mode of operation if none of the specified inputs are observed
//
// If inp is equal to 000, assign 111_1110 to the display segments a,b,c,d,e,f, and g.
// If inp is equal to 001, assign 011_0000 to the display segments a,b,c,d,e,f, and g.
// If inp is equal to 010, assign 110_1101 to the display segments a,b,c,d,e,f, and g.
// If inp is equal to 011, assign 111_1001 to the display segments a,b,c,d,e,f, and g.
// Otherwise, assign 100_1111 to the display segments a,b,c,d,e,f, and g.

// Timescale for simulation
`timescale 1ns/ 100ps

module seven_segment_cntrl (input [2:0] inp, output reg seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g);
	// Always statement executes when inp changes value
	always @ (inp)
		
		begin
			// Case statement to determine output based on input
			// Implemented as procedural block
			case(inp)
				//	input 000 | output 111_1110
				3'b000: {seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g} = 7'b111_1110;
				//	input 001 | output 011_0000
				3'b001: {seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g} = 7'b011_0000;
				//	input 010 | output 110_1101
				3'b010: {seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g} = 7'b110_1101;
				//	input 011 | output 111_1001
				3'b011: {seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g} = 7'b111_1001;
				// input: 100, 101, 110, 111 | output: 100_1111
				default
						  {seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g} = 7'b100_1111;	
			endcase
		
		end
		
endmodule
