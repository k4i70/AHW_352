module div10_tb();

  reg clk,rst_n;
  reg [4:0] indx;
  reg en;
  
  wire inc_nxt;
  
  //////////////////////
  // Instantiate DUT //
  ////////////////////
  div10 iDUT(.clk(clk), .rst_n(rst_n), .en(en), .cnt(), .inc_nxt(inc_nxt));
  
  initial begin
    rst_n = 0;
	clk = 0;
	en = 1;	
	@(negedge clk);
	rst_n = 1;
	
	$display("INFO: running loop to 16");
	for (indx=0; indx<16; indx++) begin
	  en = indx[0];		// only enabled every other time
	  @(negedge clk);
	  if (inc_nxt!==1'b0) begin
	    $display("ERR: at time %t inc_nxt should be 0",$time);
		$stop();
	  end
	end
	$display("GOOD: Loop check passed");
	@(negedge clk);
	if (inc_nxt!==1'b1) begin
	  $display("ERR: at time %t inc_nxt should be 1",$time);
	  $stop();
	end
	$display("GOOD: one last check");

	@(negedge clk);
	if (inc_nxt!==1'b0) begin
	  $display("ERR: at time %t inc_nxt should return to 0",$time);
	  $stop();
	end
	$display("YAHOO! all tests pass");	
	$stop();
  end
  
  always
    #5 clk = ~ clk;		// keep clock toggling
  
endmodule
  