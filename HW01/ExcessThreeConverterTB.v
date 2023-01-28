//Zachary Stewart 105903414 ECE 176
module testBenchBCDex3;

reg b3,b2,b1,b0;
wire e3,e2,e1,e0;

bcdEX3Converter DUT(b3,b2,b1,b0,e3,e2,e1,e0);

initial
	begin
	$monitor($time, "%b%b%b%b -> %b%b%b%b", b3,b2,b1,b0,e3,e2,e1,e0);

	#5 b0 = 0; b1 = 0; b2 = 0; b3 = 0;	//0000->0011
	#5 b0 = 1; b1 = 0; b2 = 0; b3 = 0;	//0001->0100
	#5 b0 = 0; b1 = 1; b2 = 0; b3 = 0;	//0010->0101
	#5 b0 = 1; b1 = 1; b2 = 0; b3 = 0;	//0011->0110
	#5 b0 = 0; b1 = 0; b2 = 1; b3 = 0;	//0100->0111
	#5 b0 = 1; b1 = 0; b2 = 1; b3 = 0;	//0101->1000
	#5 b0 = 0; b1 = 1; b2 = 1; b3 = 0;	//0110->1001
	#5 b0 = 1; b1 = 1; b2 = 1; b3 = 0;	//0111->1010
	#5 b0 = 0; b1 = 0; b2 = 0; b3 = 1;	//1000->1011
	#5 b0 = 1; b1 = 0; b2 = 0; b3 = 1;	//1001->1100
	#5 $finish;
	end
	
endmodule