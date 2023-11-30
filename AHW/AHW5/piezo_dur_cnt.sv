/////////////////////////////////////////////////////////
// piezo_dur_cnt.sv:  This design implements a period //
// counter to control duration of piezo note         //
//                                                  //
// Student 1 Name: Andrew Miner       //
// Student 2 Name: << Enter name if applicable >> //
///////////////////////////////////////////////////
module piezo_dur_cnt(
  input clk,				// 50MHz clock
  input rst_n,				// asynch active low reset
  input clr,				// clear dur_cnt
  input en,					// enable pulsed high at 0.01 period
  input [7:0] note_dur,		// duration of note in 1/100th of sec
  output note_over
);

  ///////////////////////////////////////
  // Declare any needed internal nets //
  /////////////////////////////////////
  wire [7:0] dur_cnt;
  wire [7:0] nxt_dur_cnt;

  ////////////////////////////////////////////////////
  // Implement comb logic that increments dur_cnt  //
  // or clears it if clr or freq_cnt==note_per.   //
  // Use dataflow (assign statement) verilog     //
  ////////////////////////////////////////////////
  assign nxt_dur_cnt = (clr) ? 15'h0000 : ((dur_cnt==note_dur) ? 15'h00 : dur_cnt+1);
  
  
  ////////////////////////////////////////////////////////////////////
  // instantiate 8 d_en_ff as a vector to realize dur_cnt register //
  //////////////////////////////////////////////////////////////////
  d_en_ff inxt_dur_cnt[7:0](.Q(dur_cnt), .clk(clk), .D(nxt_dur_cnt), .CLRN(rst_n), .EN(en));
  
  

  //////////////////////////////////////////
  // note_over is when dur_cnt==note_dur //
  ////////////////////////////////////////
  assign note_over = (dur_cnt==note_dur) ? 1 : 0;
  
endmodule
	  