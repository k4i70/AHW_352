//////////////////////////////////////////////////////////
// clkdiv.sv:  This design implements a 19-bit divider //
// to assert hundrethSec signal assuming 50MHz clk 	  //
//                                                   //
// Student 1 Name: << Enter you name here >>        //
// Student 2 Name: << Enter name if applicable >>  //
////////////////////////////////////////////////////
module clkdiv(
  input clk,			// 50MHz
  input rst_n,			// asynch active low reset
  output hundrethSec	// pulses high 1 clk every 1/100 sec
);

  ///////////////////////////////////////////
  // Declare any needed internal signals. //
  /////////////////////////////////////////
	logic [18:0] D, Q;
  
	//assign D = nxt_divcnt;
	//assign divcnt = Q;
  ////////////////////////////////////////////////////////////////////
  // Instantiate clkdivComb and feedback nxt_divcnt to flop inputs //
  //////////////////////////////////////////////////////////////////
	clkdivComb iclkdivComb(.divcnt(Q), .nxt_divcnt(D), .hundrethSec(hundrethSec));
  
  ///////////////////////////////////////////////////////////
  // Instantiate 19 d_ff as a vector to implement counter //
  // Should be reset with clk_n.  Tie PRN inactive       //
  ////////////////////////////////////////////////////////
	d_ff id_ff[18:0](.Q(Q), .PRN(1'b1), .CLRN(rst_n), .D(D), .clk(clk));
 
  
endmodule
  