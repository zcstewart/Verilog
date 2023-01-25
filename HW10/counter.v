// Zachary Stewart
// ECE 176
// HW #10
// 2-Bit Counter with Asynchronous control
//
//
//	Module:	counter
// Inputs:  clk, asclr_n
//	Outputs: [1:0] reg_out	(2-bit output)
////////////////////////////////////////////////////////////////

//Timescale for simulation
`timescale 1ns / 100ps

//Counter Module
module counter(input clk, asclr_n, output reg [1:0] count_out);
	//Always execute when clock transitions from LOW to HIGH
	//Or, always execute when Asynchronous Clear transitions from
	//HIGH to LOW
	always @ (posedge clk, negedge asclr_n)
		begin
			//If Asynchronous Clear (Active LOW)
			if(asclr_n == 1'b0)
				begin
					//Reset count to zero
					count_out <= 2'b00;
				end
			else
				begin
					//Else, Increment count by one
					count_out <= count_out + 1'b1;
				end		
		end
endmodule
