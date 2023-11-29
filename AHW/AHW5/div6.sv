//////////////////////////////////////////////////////////
// div6.sv:  This design implements a 4-bit counter    //
// to assert inc_nxt signal every 6 clks if enabled	  //
//                                                   //
// Student 1 Name: << Enter you name here >>        //
// Student 2 Name: << Enter name if applicable >>  //
////////////////////////////////////////////////////
module div6(
  input clk,			// 50MHz
  input rst_n,			// asynch active low reset
  input en,				// only increment when enabled
  output [3:0] cnt,		// BCD digit for this divider  
  output inc_nxt		// if count full and enable then increment
						// next counter up the food chain
);

  ///////////////////////////////////////////
  // Declare any needed internal signals. //
  /////////////////////////////////////////
	logic [3:0] nxt_cnt;
	logic six;
  
  ////////////////////////////////////////////////////////////////////
  // Instantiate clkdivComb and feedback nxt_divcnt to flop inputs //
  //////////////////////////////////////////////////////////////////
	div6Comb idiv6Comb(.cnt(cnt), .nxt_cnt(nxt_cnt), .six(six)); 
  
  /////////////////////////////////////////////////////////////
  // Instantiate 4 d_en_ff as a vector to implement counter //
  // Should be reset with rst_n.  Tie PRN inactive.  Only  //
  // enabled when enable signal high.                     //
  /////////////////////////////////////////////////////////
	d_en_ff id_en_ff[3:0](.Q(cnt), .EN(en), .CLRN(rst_n), .D(nxt_cnt), .clk(clk));
  
				  
  //////////////////////////////////////////////////////
  // When this counter full and enabled we increment //
  // the next counter up the food chain.            //
  ///////////////////////////////////////////////////
	and iand(inc_nxt, six, en);
  
  
endmodule
  