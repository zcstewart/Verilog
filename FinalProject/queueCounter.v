// Verilog Module
//
// 

module queueCounter (input clk, rst, write_en, read_en, isFull, isEmpty, 
							output reg [3:0] count_out);
		
		always @ (posedge clk, posedge rst)
			begin
				// If reset button pressed, reset count
				if (rst)
					begin
						count = 8'b0;
					end
				// If read_en and write_en both pressed, count unchanged
				else if (read_en && write_en && !isEmpty && !isFull)
					count = count;
				// If only read_en pressed and not empty, decrement count
				else if (read_en && !isEmpty)
					begin
						count = count - 1;
					end
				// If only write_en pressed and not full, increment count
				else if (write_en & !isFull)
					begin
						count = count + 1;
					end
				// Else, count remains unchanged
				else
					begin
						count = count;
					end
			end
		
		
endmodule
