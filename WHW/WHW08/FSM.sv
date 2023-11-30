////////////////////////////////////////////////\\
// FSM.sv : Control FSM for runDetect block      \\
// that detects a run of numbers of length        \\
// 4 or greater that are all greater than          \\
// a threshold.                                     \\
//                                                  //
// Student 1 Name: << Enter your name here >>      //
// Student 2 Name: << Enter name if applicable >> //
///////////////////////////////////////////////////
module FSM(
  input clk, 			// system clock
  input rst_n,			// active low asynch reset
  input strtCapCmp,		// initiate capture and compare
  input gt,				// current sig > threshold
  input num3,			// currently 3 prev values of sig > threshold
  output logic cap,		// capture sig value as threshold and clear N_abv
  output logic inc,		// inc N_abv counter
  output logic rst_run	// reset the run counter
);

  ///////////////////////////////////////////////////////////////////////
  // NOTE: you may need to modify this for different number of states //
  // The IDLE state has been named for you.  Give your other states  //
  // meaningful names.                                              //
  ///////////////////////////////////////////////////////////////////
  typedef enum reg[2:0] {IDLE=3'b001, ???=3'b???, ???=3'b???} state_t;
  
  ///////////////////////////////////////
  // Declare nxt_state of our state_t //
  /////////////////////////////////////
  state_t nxt_state;
  
  //////////////////////////////////
  // Declare any internal signsl //
  ////////////////////////////////
  logic [2:0] state;		// might have to change width depending on # of states
  
  //////////////////////////////////////////////////////////
  // Instantiate state flops                             //
  // NOTE: perhaps you need a state4_reg or different?? //
  ///////////////////////////////////////////////////////
  state3_reg iST(.clk(clk), .rst_n(rst_n), .nxt_state(nxt_state), .state(state));
  
  //////////////////////////////////////////////
  // State transitions and outputs specified //
  // next as combinational logic with case  //
  ///////////////////////////////////////////		
  always_comb begin
	/////////////////////////////////////////////////////////////
	// Default all SM outputs & nxt_state                     //
	// OK nxt_state is done for you.  You default SM outputs //
	//////////////////////////////////////////////////////////
	nxt_state = state_t'(state);
    <<more defaults>>
	
	case (state)
	  IDLE: begin
        << fill in the secret sauce >>
	  end
      << more secret sauce >>
	endcase
  end
		
endmodule