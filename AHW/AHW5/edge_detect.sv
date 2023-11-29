/////////////////////////////////////////////////////////
// rise_edge_detect.sv:  This design implements a     //
// circuit that interfaces to a PB swtich and  	     //
// gives a 1 clk wide puse on a rise of the signal. //
//                                                 //
// Student 1 Name: Andrew Miner      //
// Student 2 Name: Trevor Hutchison//
//////////////////////////////////////////////////
module edge_detect(
  input clk,			// hook to CLK of flops
  input rst_n,			// hook to PRN
  input sig,			// signal we are detecting a rising edge on
  output sig_chng		// high for 1 clock cycle on rise of sig
);

	//////////////////////////////////////////
	// Declare any needed internal signals //
	////////////////////////////////////////
	logic NOTrst_n;
	
	logic [2:0] D;
	//logic [3:0] DCarries;
	
	
	//not NOTrst(NOTrst_n, rst_n);
	///////////////////////////////////////////////////////
	// Instantiate flops to synchronize and edge detect //
	/////////////////////////////////////////////////////
	
	d_ff dff1(.Q(D[2]), .CLRN(rst_n), .PRN(1'b1), .D(sig), .clk(clk));
	d_ff dff2(.Q(D[1]), .CLRN(rst_n), .PRN(1'b1), .D(D[2]), .clk(clk));
	d_ff dff3(.Q(last_sig), .CLRN(rst_n), .PRN(1'b1), .D(D[1]), .clk(clk));
	
	
  
	//////////////////////////////////////////////////////////
	// Infer any needed logic (data flow) to form sig_rise //
	////////////////////////////////////////////////////////
	xor D2num(sig_chng, D[1], last_sig); 
	
endmodule