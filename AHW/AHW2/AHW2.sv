module AHW2(SW,LEDR,BCD);

  input [17:0] SW;			// slide switches
  output [17:0] LEDR;		// Red LEDs above swithes
  output [6:0] BCD;			// from bcd7seg drive "HEX0" display

  wire [18:0] nxt_divcnt;
  
  ////////////////////////////////////////////////
  // instantiate bcd7seg to drive "HEX0" digit //
  //////////////////////////////////////////////
  bcd7seg iBCD(.num(SW[3:0]),.seg(BCD));
  
  /////////////////////////////
  // Instantiate clkdivComb //
  ///////////////////////////
  clkdivComb iCLKDIV(.divcnt({9'h1E8,SW[17:8]}), .nxt_divcnt(nxt_divcnt),
                     .hundrethSec());
  
  assign LEDR[17:8] = nxt_divcnt[9:0];
  
  ////////////////////////////////////////////////////////////////////
  // Instantiate clkdivComb and feedback nxt_divcnt to flop inputs //
  //////////////////////////////////////////////////////////////////
  div10Comb iDIV10(.cnt(SW[7:4]), .nxt_cnt(LEDR[7:4]), .ten());

  
endmodule
  
  