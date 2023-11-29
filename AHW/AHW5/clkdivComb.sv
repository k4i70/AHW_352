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

  input [18:0] divcnt;	// with a 50MHz clk you need 19-bits for 0.01 sec
  output [18:0] nxt_divcnt;  	// incremented version of divcnt
  output hundrethSec;				// assert when divcnt = 0x7A11F
  
  ////////////////////////////////////////////////////////
  // Declare any needed internal signals of type logic //
  //////////////////////////////////////////////////////

  logic [18:0] S;  
  logic [18:0] Carries;	
  logic Cout;
  logic Cin;
  assign Cin = 1'b1;

  logic [18:0] CinCarries;
  
  ///////////////////////////////////////////////////////
  // Use vectored instantiation to place the 18 AND   //
  // gates that knock the count down to zero when we //
  // hit 1/100th of a second                        //
  ///////////////////////////////////////////////////
  assign CinCarries = {Carries[17:0],Cin};
  assign Cout = Carries[18];

  FA fa1[0:18] (.A(divcnt), .B(19'h000000), .Cin(CinCarries), .S(S), .Cout(Carries));
    
  and ands[0:18] (nxt_divcnt, S, !hundrethSec);

  ///////////////////////////////////////////////////////
  // Implement logic (ANDs/ORs used to detect when    //
  // divcnt == 0x7A11F (only need to detect the 1's) //
  ////////////////////////////////////////////////////

  and and100(hundrethSec, divcnt[0], divcnt[1], divcnt[2], divcnt[3], divcnt[4], divcnt[8], divcnt[13], divcnt[15], divcnt[16], divcnt[17], divcnt[18]);
 
endmodule