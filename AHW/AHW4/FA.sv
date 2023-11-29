///////////////////////////////////////////////////
// FA.sv  This design will take in 3 bits       //
// and add them to produce a sum and carry out //
////////////////////////////////////////////////
module FA(
  input 	A,B,Cin,	// three input bits to be added
  output	S,Cout		// Sum and carry out
);

	/////////////////////////////////////////////////
	// Declare any internal signals as type logic //
	///////////////////////////////////////////////
	logic XORout, ANDout, ANDout2;
	
	/////////////////////////////////////////////////
	// Implement Full Adder as structural verilog //
	///////////////////////////////////////////////
	xor XOR1(XORout, A, B);
	and AND1(ANDout, A, B);
	xor XOR2(S, XORout, Cin);
	and AND2(ANDout2, XORout, Cin);
	xor XOR3(Cout, ANDout2, ANDout);
	
endmodule
