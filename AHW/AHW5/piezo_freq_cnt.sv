/////////////////////////////////////////////////////////
// piezo_freq_cnt.sv:  This design implements count   //
// register that generates note frequency for piezo  //
//                                                  //
// Student 1 Name: Andrew Miner       //
// Student 2 Name: << Enter name if applicable >> //
///////////////////////////////////////////////////
module piezo_freq_cnt(
  input clk,				// 50MHz clock
  input rst_n,				// asynch active low reset
  input clr,				// clear freq_cnt
  input [14:0] note_per,	// period of note (15-bits)
  output piezo,piezo_n
);

  ///////////////////////////////////////
  // Declare any needed internal nets //
  /////////////////////////////////////
  logic [14:0] freq_cnt;
  logic swap;

  ////////////////////////////////////////////////////
  // Implement comb logic that increments freq_cnt //
  // or clears it if clr or freq_cnt==note_per.   //
  // Use dataflow (assign statement) verilog     //
  ////////////////////////////////////////////////
  always @ (posedge clk) begin
    if (note_per == freq_cnt) {
      freq_cnt = 15h'00000;
      swap = 1;
    } else{
      freq_cnt = freq_cnt + 1;
    }
  end
  
  ///////////////////////////////////////////////////////////////////
  // instantiate 15 d_ff as a vector to realize freq_cnt register //
  /////////////////////////////////////////////////////////////////
  d_ff ifreq_cnt[14:0](.Q(freq_cnt), .clk(clk), .D(freq_cnt), .CLRN(clr), .PRN(1'b1));
  
  

  /////////////////////////////////////
  // piezo is simply freq_cnt[14] & //
  // piezo_n is inverse of that.   //
  //////////////////////////////////
  assign piezo = freq_cnt[14];
  assign piezo_n = !freq_cnt[14];
  
  
endmodule
	  
