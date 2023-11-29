/////////////////////////////////////////////////////////
// div10Comb.sv:  This design implements a 4-bit      //
// incrementor and logic to divide by 10 	         //
//                                                  //
// Student 1 Name: << Enter you name here >>       //
// Student 2 Name: << Enter name if applicable >> //
///////////////////////////////////////////////////
module div10Comb(cnt, nxt_cnt, ten);

  input [3:0] cnt;			// div10 requires a 4-bit counter
  output [3:0] nxt_cnt;  	// incremented version of cnt
  output ten;				// assert when cnt = 0x9
  
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
  // Use vectored instantiation to place the 4 AND    //
  // gates that knock the count down to zero when we //
  // hit 1/100th of a second                        //
  ///////////////////////////////////////////////////
  	assign CinCarries = {Carries[2:0],Cin};
  	assign Cout = Carries[3];

    FA fa6[3:0] (.A(cnt), .B(4'h0000), .Cin(CinCarries), .S(S), .Cout(Carries));
    
	and and6[3:0] (nxt_cnt, S, !ten);
  
  ////////////////////////////////////////////////////
  // Implement logic (ANDs/ORs used to detect when //
  // cnt == 0x9 (only need to detect the 1's)     //
  /////////////////////////////////////////////////
  and and10(ten, cnt[0], cnt[3]);

 
endmodule