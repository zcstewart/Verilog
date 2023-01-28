/*
 *	This file is a Verilog implementation of an 8-bit to 16-bit shifter
 * If shift_cntrl is 0 or 3, no shift. If shift_cntrl is 1, shift by
 * 4 bits. If shift_cntrl is 2, shift by 8 bits.
 */

module shifter (input [7:0] inp, input [1:0] shift_cntrl, output reg [15:0] shift_out);
		always @ (inp, shift_cntrl)begin
			case (shift_cntrl)
				//shift_cntrl = 0
				2'b00 :  shift_out = inp;
				//shift_cntrl = 1
				2'b01 :	shift_out = (inp << 4);
				//shift_cntrl = 2
				2'b10 : 	shift_out = (inp << 8);
				//shift_cntrl = 3
				2'b11 :	shift_out = inp;
				default: shift_out = inp;
			endcase
		end
endmodule
