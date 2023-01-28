module bit16Adder_TB;

reg [15:0] addendA, addendB;
wire [15:0] sum;

bit16Adder DUT(.addendA(addendA), .addendB(addendB), .sum(sum));

initial
	begin
	#6 addendA = 16'h23d6; addendB = 16'h1fc4;
	#6 $finish;
	end
endmodule
