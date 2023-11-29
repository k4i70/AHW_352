/////////////////////////////////////////////////////////
// div6Comb.sv:  This design implements a 4-bit       //
// incrementor and logic to divide by 6 	         //
//                                                  //
// Student 1 Name: << Enter you name here >>       //
// Student 2 Name: << Enter name if applicable >> //
///////////////////////////////////////////////////
module div6Comb(cnt, nxt_cnt, six);

  input [3:0] cnt;			// div6 requires a 3-bit counter but we use 4-bit
  output [3:0] nxt_cnt;  	// incremented version of cnt
  output six;				// assert when cnt = 0x5

  ////////////////////////////////////////////////////////
  // Declare any needed internal signals of type logic //
  //////////////////////////////////////////////////////
  logic [3:0] S;  
  logic [3:0] Carries;	
  logic Cout;
  logic Cin;
  assign Cin = 1'b1;

  logic [3:0] CinCarries;
  
  
  ///////////////////////////////////////////////////////
  // Use vectored instantiation to place the 4 AND   //
  // gates that knock the count down to zero when we //
  // hit 1/100th of a second                        //
  ///////////////////////////////////////////////////
	assign CinCarries = {Carries[2:0],Cin};
	assign Cout = Carries[3];

	FA fa1[3:0] (.A(cnt), .B(4'h0000), .Cin(CinCarries), .S(S), .Cout(Carries));
    
	and ands[3:0] (nxt_cnt, S, !six);
  
  ////////////////////////////////////////////////////
  // Implement logic (ANDs/ORs used to detect when //
  // cnt == 0x5 (only need to detect the 1's)     //
  /////////////////////////////////////////////////
  and and6(six, cnt[2], cnt[0]);

 
endmodule