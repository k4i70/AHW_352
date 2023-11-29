module ALU(
  input [7:0] A,	// A operand
  input [7:0] B,	// B operand
  input [1:0] mode,	// 00=>A/2 + B, 01=>A - B, 10=>A >>1, 11=> A << 1
  output [7:0] Y
);

  //////////////////////////////////////////////////////////////
  // Any needed defines of internal signals below here.  You //
  // may need more than the two we provided for you.        //
  ///////////////////////////////////////////////////////////
  logic [7:0] Rout;		// 8-bit signal driven by Rout's of ALU cells
  logic [7:0] Lout;		// 8-bit Signal driven by Lout's of ALU cells
  
  logic mode01, mode0NOT;

  
  /////////////////////////////////////////////////////////////////////
  // You will possibly need some logic at the MSB and LSB positions //
  // to make the operations work out.  Add that below here.        //
  //////////////////////////////////////////////////////////////////
	
	// Attempt to use mux to find if subtract input for Rin
	//not NOTmode0(mode0NOT, mode[0]);
	//and ANDmodes(mode01, mode0NOT, mode[1]);
	//assign RinLeast = (mode01) ? 1 : 0;
	
	
	// Now trying to use AND and NOT gates
	not MOTmode0(mode0NOT, mode[1]);
	and ANDmode01(mode01, mode0NOT, mode[0]);
	
	
  
  //////////////////////////////////////////////////////////
  // Vectored instantiation of 8 copies of your ALU_cell //
  // There are some ??? here that you need to figure.   //
  ///////////////////////////////////////////////////////
  ALU_cell iCell[7:0](.A(A), .B(B), .Rin({Lout[6:0], mode01}), .Lin({1'b0, Rout[7:1]}),
                      .mode(mode), .Rout(Rout), .Lout(Lout), .Y(Y));
					  
endmodule