module ALU_cell(
  input A,			// operand A input bit
  input B,			// operand B input bit
  input Rin,		// input coming from right (from bit of lesser significance)
  input Lin,		// input coming from left (from bit of greater significance)
  input [1:0] mode,	// mode bits
  output Rout,		// output to cell of leser significance
  output Lout,		// output to cell of greater significance
  output Y			// the result output
);

  ////////////////////////////////////////////////////////////////////
  // Declare any needed internal signals as type logic below here. //
  // You likely need more than just Sum.                          //
  /////////////////////////////////////////////////////////////////
  logic Sum;			// output of FA cell feeds into Y-mux
  logic Cout;
  logic NOTB;
  
  /////////////////////////////////////////////////////////////////////
  // Instantiate verilog primitives to create any needed internal   //
  // signals (A or B).  You are allowed to use assign statements   //
  // to model a simple 2:1 mux structure, otherwise all modeling  //
  // has to be done by instantiation of primitive gates.         //
  // Example mux with assign: assign B_mux = (sel) ? in1 : in0; //
  ///////////////////////////////////////////////////////////////
	not not_B(NOTB, B);
  
	assign A_mux = (mode[0]) ? A : Lin;
	assign B_mux = (mode[0]) ? NOTB : B;
  
  
  ////////////////////////////////////
  // Instance of Full Adder cell   //
  // You need to complete the ??? //
  // connections as you see fit  //
  ////////////////////////////////
  FA iFA(.A(A_mux), .B(B_mux), .Cin(Rin), .S(Sum), .Cout(Cout));

  ////////////////////////////////////////////////////////
  // Instantiate gates or infer with assign statements //
  // simple logic to drive Y output, and Rout output. //
  // (perhaps neeeded...perhaps not?)                //
  ////////////////////////////////////////////////////
	assign Y = (mode[1]) ? ((mode[0]) ? Rin : Lin) : Sum;
	assign Lout = (mode[1]) ? A : Cout;
	
	
	assign Rout = A;
	assign Cin = Rin;
	
  
  
endmodule
  
  
/////////////////////////////////////////////////////////////////////////
// Implementation of Full Adder is next.  Don't touch file below here //
///////////////////////////////////////////////////////////////////////
module FA(A,B,Cin,S,Cout);
  
  input A,B,Cin;
  output S,Cout;
  
  assign S = A^B^Cin;
  assign Cout = (A&B) | (A&Cin) | (B&Cin);
  
endmodule
