/////////////////////////////////////////////////////////
// rise_edge_detect.sv:  This design implements a     //
// circuit that interfaces to a PB swtich and  	     //
// gives a 1 clk wide puse on a rise of the signal. //
//                                                 //
// Student 1 Name: Andrew Miner      //
// Student 2 Name: Trevor Hutchison//
//////////////////////////////////////////////////
module rise_edge_detect(
  input clk,			// hook to CLK of flops
  input rst_n,			// hook to PRN
  input sig,			// signal we are detecting a rising edge on
  output sig_rise		// high for 1 clock cycle on rise of sig
);

	//////////////////////////////////////////
	// Declare any needed internal signals //
	////////////////////////////////////////
	logic NOTrst_n, NOTlast_sig;
	
	logic [2:0] D;
	//logic [3:0] DCarries;
	
	
	//not NOTrst(NOTrst_n, rst_n);
	///////////////////////////////////////////////////////
	// Instantiate flops to synchronize and edge detect //
	/////////////////////////////////////////////////////
	//assign D[3] = PB_out;
	//assign DCarries = {sig, D[2:0]};	
	//assign last_sig = D[0];
	//d_ff d_ffs[3:0](.Q(D), .PRN(NOTrst_n), .CLRN(1'b1), .D(DCarries), .clk(clk)); 
	
	d_ff dff1(.Q(D[2]), .PRN(rst_n), .CLRN(1'b1), .D(sig), .clk(clk));
	d_ff dff2(.Q(D[1]), .PRN(rst_n), .CLRN(1'b1), .D(D[2]), .clk(clk));
	d_ff dff3(.Q(last_sig), .PRN(rst_n), .CLRN(1'b1), .D(D[1]), .clk(clk));
	
	
  
	//////////////////////////////////////////////////////////
	// Infer any needed logic (data flow) to form sig_rise //
	////////////////////////////////////////////////////////
	not NOTlastsig(NOTlast_sig, last_sig);
	and D2num(sig_rise, D[1], NOTlast_sig); 
	
endmodule