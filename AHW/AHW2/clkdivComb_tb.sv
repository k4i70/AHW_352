module clkdivComb_tb();

  reg [18:0] divcnt;
  
  wire [18:0] nxt_divcnt;
  wire hundrethSec;
  
  //////////////////////
  // Instantiate DUT //
  ////////////////////
  clkdivComb iDUT(.divcnt(divcnt), .nxt_divcnt(nxt_divcnt), .hundrethSec(hundrethSec));
  
  initial begin
    divcnt = 19'h00000;
	#5;
	if (nxt_divcnt!==19'h00001) begin
	  $display("ERR: Increment of 0x000000 should be 0x000001");
	  $stop();
	end
	if (hundrethSec!==1'b0) begin
	  $display("ERR: hundrethSec should be 0");
	  $stop();
	end
	$display("GOOD: passed first test");
	
	divcnt = 19'h7A11E;
	#5;
	if (nxt_divcnt!==19'h7A11F) begin
	  $display("ERR: Increment of 0x7A11E should be 0x7A1FF");
	  $stop();
	end
	if (hundrethSec!==1'b0) begin
	  $display("ERR: hundrethSec should be 0");
	  $stop();
	end
	$display("GOOD: passed second test");
	
	divcnt = 19'h7A11F;
	#5;
	if (nxt_divcnt!==19'h00000) begin
	  $display("ERR: Count shoud reset at 0x7A11F");
	  $stop();
	end
	if (hundrethSec!==1'b1) begin
	  $display("ERR: hundrethSec should be 1");
	  $stop();
	end
	$display("Yahoo! all tests passed!");
	$stop();
  end
  
endmodule
  