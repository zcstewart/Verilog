`timescale 1ns/100ps

module mult4x4(input [3:0] dataa, datab, output reg [7:0] product);
			always @ (dataa, datab)
			begin
			product = dataa * datab;
			end
endmodule
