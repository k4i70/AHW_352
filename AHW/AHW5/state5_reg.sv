////////////////////////////////////////////////////////////
// state5_reg.sv:  This design implements state register //
//                                                      //
// Student 1 Name: Andrew Miner          //
// Student 2 Name: Trevor Hutchison     //
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
// Forms a 5-bit state register that will be one hot.   //
// Meaning it needs to aynchronously reset to 5'b00001 //
////////////////////////////////////////////////////////
module state5_reg(
  input clk,				// clock
  input rst_n,				// asynchronous active low system reset
  input [4:0] nxt_state,	// forms next state (i.e. goes to D input of FFs)
  output [4:0] state		// output (current state)
);
  
  ////////////////////////////////////////////////////
  // Declare any needed internal signals.  Due to  //
  // all bits except LSB needed to reset, and the //
  // LSB needing to preset you will need to form //
  // two 5-bit vectors to hook to CLRN and PRN  //
  ///////////////////////////////////////////////
	//logic [4:0] rst_vec, CRLN_PRN, not_rst_vec;
  
	logic [4:0] PRN_rst_vec, CLRN_rst_vec;
  
  ///////////////////////////////////////////////////////////
  // The two 5-bit vectors for CLRN & PRN are formed with //
  // vector concatenation of a mix of rst_n and 1'b1     //
  ////////////////////////////////////////////////////////
	//assign CRLN_PRN = 1'b00001;
	
	assign PRN_rst_vec[4:0] = {1'b1, 1'b1, 1'b1, 1'b1, rst_n};
	
	assign CLRN_rst_vec[4:0] = {rst_n, rst_n, rst_n, rst_n, 1'b1};
	
	//xor xors[4:0](rst_vec, CRLN_PRN, rst_n);
	
	//not not_rst_vecs[4:0](not_rst_vec, rst_vec);
	
	//not CRLN_PRNs[4:0](not_CLRN_PRN, CLRN_PRN);
	
	
  ////////////////////////////////////////////////////////
  // instantiate 5 d_ff as a vector to implement state //
  //////////////////////////////////////////////////////
	d_ff dffs[4:0](.clk(clk), .D(nxt_state), .Q(state), .CLRN(CLRN_rst_vec), .PRN(PRN_rst_vec));
 
endmodule