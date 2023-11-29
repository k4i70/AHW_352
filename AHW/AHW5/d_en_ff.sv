////////////////////////////////////////////////////////
// d_en_ff.sv: Models a FF with active high enable   //
//                                                  //
// Student 1 Name: Andrew Miner    //
// Student 2 Name: Trevor Hutchison //
///////////////////////////////////////////////////
module d_en_ff(
  input clk,
  input D,			// D input to be flopped
  input CLRN,		// asynch active low clear (reset)
  input EN,			// enable signal
  output logic Q
);

  ////////////////////////////////////////////////////
  // Declare any needed internal sigals below here //
  //////////////////////////////////////////////////
	logic Difenable;
  
  ///////////////////////////////////////////////////
  // Infer logic needed to feed D input of simple //
  // flop to form an enabled flop (use dataflow) //
  ////////////////////////////////////////////////
	assign Difenable = (EN) ? D : Q;
  
  //////////////////////////////////////////////
  // Instantiate simple d_ff without enable  //
  // and tie PRN inactive.  Connect D input //    
  // to logic you inferred above.          //
  //////////////////////////////////////////
	d_ff denabled_ff(.Q(Q), .PRN(1'b1), .CLRN(CLRN), .D(Difenable), .clk(clk));

endmodule
