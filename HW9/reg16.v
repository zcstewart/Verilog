// Zachary Stewart
// ECE 176
// HW #9
// 16-bit Register with Synchronous control


//	Module:	reg16
// Inputs:  clk, sclr_n, clk_ena
//			   [15:0] datain 	(16-bit input)
//	Outputs: [15:0] reg_out	(16-bit output)

module reg16(input clk, sclr_n, clk_ena, input [15:0] datain, output reg [15:0] reg_out);
		always @ (posedge clk)
		begin
			// If clk_ena is 1 and sclr_n is 0, reg_out = 0000_0000_0000_0000
			if(clk_ena == 1'b01 && sclr_n == 1'b00)
				reg_out <= 16'b00;
			// Else if clk_ena is 1 and sclr_n is 1, reg_out = datain
			else if(clk_ena == 1'b01 && sclr_n == 1'b01)
				reg_out <= datain;
			// Else, no change to reg_out
			else
				reg_out <= reg_out;
		end
endmodule

