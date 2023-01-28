//Zachary Stewart 105903414 ECE 176
//Homework One Verilog BCD to Excess-3 Code Converter



module bcdEX3Converter(b3,b2,b1,b0,e3,e2,e1,e0);
	//Binary Input: MSB=b3 LSB=b0
	input b3, b2, b1, b0;
	//Excess-3 Output: MSB=e3 LSB=e0
	output e3, e2, e1, e0;
	//Intermediary wires between AND and OR logic gates
	wire x1, x2, x3, x4, x5;

	//	***First attempt with assign statements***
	//assign e3 = b3 | (b2&b1)| (b2&b0);
	//assign e2 = (b2&~b1&~b0) | (~b2&b0) | (~b2&b1);
	//assign e1 = b1~^b0;  //XNOR
	//assign e0 = ~b0;

	//	***Second attempt with primitive instantiation**
	

	//AND Gate G1
	//Output: x1
	//Inputs: b2, b1
	and #1	G1(x1,b2,b1);
	
	//AND Gate G2
	//Output: x2
	//Inputs: b2, b0
	and #1	G2(x2,b2,b0);
	
	//AND Gate G3
	//Output: x3
	//Inputs: b2, ~b1, ~b0
	and #1	G3(x3,b2,~b1,~b0);
	
	//AND Gate G4
	//Output: x4
	//Inputs: ~b2, b1
	and #1	G4(x4,~b2,b1);
	
	//AND Gate G5
	//Output: x5
	//Inputs: ~b2, b0
	and #1	G5(x5,~b2,b0);
	
	//OR Gate O1
	//Output: e3
	//Inputs: x1, x2
	or #1 O1(e3,x1,x2);
	
	//OR Gate O2
	//Output: e2
	//Inputs: x3, x4, x5
	or #1 O2(e2,x3,x4,x5);
	
	//XNOR Gate XN
	//Output: e1
	//Inputs: b1, b0
	xnor #1 XN(e1,b1,b0);
	
	//NOT Gate NO
	//Output: e0
	//Inputs: ~b0
	not #1 NO(e0,~b0);
	
endmodule
