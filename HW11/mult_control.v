//	ECE 176 HW 11 mult_control
// Multiplier Control State Machine (Moore Machine)
//
// Programmer: Zachary Stewart
// Date: 2017/10/29
//
// Description: 
///////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module mult_control (clk,reset_a,start,count,input_sel,shift_sel,
							state_out,done,clk_en,sclr_n);
	
	// Declare input ports
	input clk, reset_a, start;
	input [1:0] count;
	
	// Declare output ports
	output reg [1:0] input_sel, shift_sel;
	output reg done, clk_en, sclr_n;
	output reg [2:0] state_out;
	
	
	// Registers to implement the functionality of the state
	// machine. These are the state variables
	reg [2:0] curState, nextState;
	
	// The parameter equates a numerical value to the different
	// possible states.
	parameter IDLE = 3'b000,
				 LSB = 3'b001,
				 MID = 3'b010,
				 MSB = 3'b011,
				 CALC_DONE = 3'b100,
				 ERR = 3'b101;
				 
	// This always block implements the functionality of reset_a
	// reset_a is a synchronous reset
	always @ (posedge clk, posedge reset_a)
		begin
			if(reset_a == 1'b1)
				curState <= IDLE;
			else
				curState <= nextState;
		end

	// This always block uses shorthand notation (*) to have 
	// Verilog implement the sensitivity list automatically
	always @ *
		begin
			// Case statement is used to determine the next
			// state depending on the current state and the
			// input received. 
			case(curState)
				IDLE:
					if(start == 1'b1)
						begin
						nextState = LSB;
						end
					else
						begin
						nextState = IDLE;
						end
				
				LSB:
					if(start == 1'b0 && count == 2'b00)
						begin
						nextState = MID;
						end
					
					else
						begin
						nextState = ERR;
						end
						
				MID:
					if(start == 1'b0 && count == 2'b10)
						begin
						nextState = MSB;
						end
					
					else if(start == 1'b0 && count == 2'b01)
						begin
						nextState = MID;
						end
					
					else
						begin
						nextState = ERR;
						end
						
				MSB:
					if(start == 1'b0 && count == 2'b11)
						begin
						nextState = CALC_DONE;
						end
						
					else
						begin
						nextState = ERR;
						end
						
				CALC_DONE:
					if(start == 1'b0)
						begin
						nextState = IDLE;
						end
						
					else
						begin
						nextState = ERR;
						end
						
				ERR:
					if(start == 1'b1)
						begin
						nextState = LSB;
						end
						
					else
						begin
						nextState = ERR;
						end
			endcase
		end
		
	// This always block initializes the outputs of the
	// mult_control module to the intial values contained
	// at the IDLE state. Afterwards, a case statement is
	// used to determine the outputs based on the current state.
	always @ *
		begin
			// Initial output values
			input_sel = 2'bxx;
			shift_sel = 2'bxx;
			done = 1'b0;
			clk_en = 1'b0;
			sclr_n = 1'b1;
			
			// Case statement to determine output values
			case(curState)
			
				// Idle State Outputs
				IDLE:
					if(start == 1'b1)
						begin
						input_sel = 2'bxx;
						shift_sel = 2'bxx;
						done = 1'b0;
						clk_en = 1'b1;
						sclr_n = 1'b0;
						end
						
				// LSB State Outputs
				LSB:
					if(start == 1'b0 && count == 2'b00)
						begin
						input_sel = 2'b00;
						shift_sel = 2'b00;
						done = 1'b0;
						clk_en = 1'b1;
						sclr_n = 1'b1;
						end
						
					else
						begin
						input_sel = 2'bXX;
						shift_sel = 2'bXX;
						done = 1'b0;
						clk_en = 1'b0;
						sclr_n = 1'b1;
						end
						
				// MID State Outputs
				MID:
					if(start == 1'b0 && count == 2'b10)
						begin
						input_sel = 2'b10;
						shift_sel = 2'b01;
						done = 1'b0;
						clk_en = 1'b1;
						sclr_n = 1'b1;
						end
					
					else if(start == 1'b0 && count == 2'b01)
						begin
						input_sel = 2'b01;
						shift_sel = 2'b01;
						done = 1'b0;
						clk_en = 1'b1;
						sclr_n = 1'b1;
						end
						
					else
						begin
						input_sel = 2'bxx;
						shift_sel = 2'bxx;
						done = 1'b0;
						clk_en = 1'b0;
						sclr_n = 1'b1;
						end
						
				// MSB State Outputs
				MSB:
					if(start == 1'b0 && count == 2'b11)
						begin
						input_sel = 2'b11;
						shift_sel = 2'b10;
						done = 1'b0;
						clk_en = 1'b1;
						sclr_n = 1'b1;
						end
						
					else
						begin
						input_sel = 2'bxx;
						shift_sel = 2'bxx;
						done = 1'b0;
						clk_en = 1'b0;
						sclr_n = 1'b1;
						end
				
				// CALC_DONE State Outputs
				CALC_DONE:
					if(start == 1'b0)
						begin
						input_sel = 2'bxx;
						shift_sel = 2'bxx;
						done = 1'b1;
						clk_en = 1'b0;
						sclr_n = 1'b1;
						end
						
					else
						begin
						input_sel = 2'bxx;
						shift_sel = 2'bxx;
						done = 1'b0;
						clk_en = 1'b0;
						sclr_n = 1'b1;
						end
				
				// ERR State Outputs
				ERR:
					if(start == 1'b1)
						begin
						input_sel = 2'bxx;
						shift_sel = 2'bxx;
						done = 1'b0;
						clk_en = 1'b1;
						sclr_n = 1'b0;
						end
						
					else
						begin
						input_sel = 2'bxx;
						shift_sel = 2'bxx;
						done = 1'b0;
						clk_en = 1'b0;
						sclr_n = 1'b1;
						end
			endcase	
		end
	
	// This always statement is used to convert the 
	// parameterized states to binary outputs for
	// the multiplier
	always @ (curState)
		begin
			case(curState)
				IDLE:
					state_out = 3'b000;
				LSB:
					state_out = 3'b001;
				MID:
					state_out = 3'b010;
				MSB:
					state_out = 3'b011;
				CALC_DONE:
					state_out = 3'b100;
				ERR:
					state_out = 3'b101;
				default:
					state_out = 3'b000;
			endcase
		end	
endmodule
