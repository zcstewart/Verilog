// Module:	BufferModule
//
// Programmers: Calvin Smith, Zachary Stewart
// Date: 11/28/2017
//
//	Inputs:	[7:0] data_in
//				clk, rst, read_en, write_en
//	Outputs: reg [7:0] data_out
//				reg isEmpty, nearFull, nearEmpty, isFull
//
// Purpose: The purpose of this module is to implement a queue memory buffer
// 			using a First-In, First-Out (FIFO) methodology.

module BufferModule(input [7:0] data_in, input clk, rst, read_en, write_en, 
					output reg [7:0] data_out, output reg isEmpty, nearFull, nearEmpty, isFull);
					
	parameter BUFF_SIZE = 5'b1_0000;	
	reg [4:0] count;
	reg [3:0] read_pntr, write_pntr;
	reg [7:0] queueMem [0:(BUFF_SIZE-1)];
	
	// Procedural block to determine memory count
	always @ (posedge clk, posedge rst)
		begin
			// If reset button pressed, reset count
			if (rst)
				begin
					count <= 5'b0_0000;
				end
			// If read_en and write_en both pressed, count unchanged
			else if (read_en && write_en && !isEmpty && !isFull)
				count = count;
			// If only read_en pressed and not empty, decrement count
			else if (read_en && !isEmpty)
				begin
					count <= count - 1;
				end
			// If only write_en pressed and not full, increment count
			else if (write_en & !isFull)
				begin
					count <= count + 1;
				end
			// Else, count remains unchanged
			else
				begin
					count <= count;
				end
		end
	
	// Procedural block to determine read and write pointer values
	always @ (posedge clk, posedge rst)
		begin
			// If reset pressed, set read and write pointers to zero
			if (rst)
				begin
					write_pntr <= 4'b0;
					read_pntr <= 4'b0;
				end
			// If read and write both pressed, not empty and not full	
			else if (read_en && write_en && !isEmpty && !isFull)
				begin
					write_pntr <= write_pntr;
					read_pntr <= read_pntr;
				end
			// If read enable pressed and not empty
			else if(read_en && !isEmpty)
				begin
					// Increment read pointer
					read_pntr <= read_pntr + 1;
					// If read pointer increments past boundaries of array,
					// reset the pointer to the beginning of array
					if(read_pntr == 5'b1_0000)
						begin
							read_pntr = 5'b0_0000;
						end
				end				
			// If write enable pressed and not full
			else if(write_en & !isFull)
				begin
					// Increment write pointer
					write_pntr <= write_pntr + 1;
					// If write pointer increments past boundaries of array,
					// reset the pointer to the beginning of array
					if(write_pntr == 5'b1_0000)
						begin
							write_pntr = 5'b0_0000;
						end
				end
			// Otherwise, the pointers remain the same
			else
				begin
					write_pntr <= write_pntr;
					read_pntr <= read_pntr;
				end
			end
	
	// Procedural block to determine data_out
	always @ (posedge clk, posedge rst)
		begin
			// If reset, reset data_out to high-impedance (Z)
			if (rst)
				begin
					data_out <= 8'bZ;
				end
			// If read_en and write_en are pressed at the same time
			else if (read_en && write_en && !isEmpty && !isFull)
				begin
					data_out <= 8'bZ;
				end
			// If read_en is pressed and queue is not empty
 			else if (read_en && !isEmpty)
				begin
					data_out <= queueMem[read_pntr];
				end
			// If write_en is pressed and queue is not full
			else if (write_en && !isFull)
				begin
					queueMem[write_pntr] <= data_in;
				end
			// Otherwise data_out remains unchanged
			else
				begin
					data_out <= data_out;
				end
		end
	
	// This always procedural block determines that states
	// of the various flags based on the current count value
	always @ (count)
		begin
			case (count)
			// Count: 0
			5'b0_0000:
				begin
					isEmpty <= 1'b1;
					nearEmpty <= 1'b0;
					nearFull <= 1'b0;
					isFull <= 1'b0;
				end
			// Count: 1
			5'b0_0001:
				begin
					isEmpty <= 1'b0;
					nearEmpty <= 1'b1;
					nearFull <= 1'b0;
					isFull <= 1'b0;				
				end
			// Count: 2
			5'b0_0010:
				begin
					isEmpty <= 1'b0;
					nearEmpty <= 1'b1;
					nearFull <= 1'b0;
					isFull <= 1'b0;				
				end	
			// Count: 3
			5'b0_0011:
				begin
					isEmpty <= 1'b0;
					nearEmpty <= 1'b1;
					nearFull <= 1'b0;
					isFull <= 1'b0;				
				end
			// Count: 4
			5'b0_0100:
				begin
				begin
					isEmpty <= 1'b0;
					nearEmpty <= 1'b1;
					nearFull <= 1'b0;
					isFull <= 1'b0;				
				end				
				end
			// Count: 12
			5'b0_1100:
				begin
					isEmpty <= 1'b0;
					nearEmpty <= 1'b0;
					nearFull <= 1'b1;
					isFull <= 1'b0;				
				end
			// Count: 13
			5'b0_1101:
				begin
					isEmpty <= 1'b0;
					nearEmpty <= 1'b0;
					nearFull <= 1'b1;
					isFull <= 1'b0;	
				end
			// Count: 14
			5'b0_1110:
				begin
					isEmpty <= 1'b0;
					nearEmpty <= 1'b0;
					nearFull <= 1'b1;
					isFull <= 1'b0;	
				end
			// Count: 15
			5'b0_1111:
				begin
					isEmpty <= 1'b0;
					nearEmpty <= 1'b0;
					nearFull <= 1'b1;
					isFull <= 1'b0;	
				end
			// Count: 16
			5'b1_0000:
				begin
					isEmpty <= 1'b0;
					nearEmpty <= 1'b0;
					nearFull <= 1'b0;
					isFull <= 1'b1;	
				end
			// Otherwise, all flags are disabled
			default:
				begin
					isEmpty <= 1'b0;
					nearEmpty <= 1'b0;
					nearFull <= 1'b0;
					isFull <= 1'b0;
				end
			endcase
		end

endmodule
