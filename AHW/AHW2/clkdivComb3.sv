//////////////////////////////////////////////////////////
// clkdivComb.sv:  This design implements a 19-bit     //
// incrementor and logic to detect 1/100th sec 	      //
// assuming 50MHz clk                                //
// Count needs to reset when it hits 1/100th		//
//                                                 //
// Student 1 Name: Andrew Miner      //
// Student 2 Name: Trevor Hutchison//
//////////////////////////////////////////////////
module clkdivComb(divcnt, nxt_divcnt, hundrethSec);


  input [18:0] divcnt;
  output [18:0] nxt_divcnt;
  output hundrethSec;
  
  // Internal signals
  logic [18:0] and_results [18:0];
  
  // Instantiate AND gates
  and and0 (divcnt[0], !hundrethSec, and_results[0]);
  and and1 (divcnt[1], !hundrethSec, and_results[1]);
  and and2 (divcnt[2], !hundrethSec, and_results[2]);
  and and3 (divcnt[3], !hundrethSec, and_results[3]);
  and and4 (divcnt[4], !hundrethSec, and_results[4]);
  and and5 (divcnt[5], !hundrethSec, and_results[5]);
  and and6 (divcnt[6], !hundrethSec, and_results[6]);
  and and7 (divcnt[7], !hundrethSec, and_results[7]);
  and and8 (divcnt[8], !hundrethSec, and_results[8]);
  and and9 (divcnt[9], !hundrethSec, and_results[9]);
  and and10(divcnt[10], !hundrethSec, and_results[10]);
  and and11(divcnt[11], !hundrethSec, and_results[11]);
  and and12(divcnt[12], !hundrethSec, and_results[12]);
  and and13(divcnt[13], !hundrethSec, and_results[13]);
  and and14(divcnt[14], !hundrethSec, and_results[14]);
  and and15(divcnt[15], !hundrethSec, and_results[15]);
  and and16(divcnt[16], !hundrethSec, and_results[16]);
  and and17(divcnt[17], !hundrethSec, and_results[17]);
  and and18(divcnt[18], !hundrethSec, and_results[18]);
  
  // Concatenate the AND gate results to get nxt_divcnt
  assign nxt_divcnt = {and_results[18], and_results[17:0]};
  
  // Implement the logic for hundrethSec
  assign hundrethSec = (divcnt == 19'h7A11F);
 
endmodule