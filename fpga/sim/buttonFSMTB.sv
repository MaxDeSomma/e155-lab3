// buttonFSMTB.sv
// Max De Somma
// mdesomma@g.hmc.edu
// 9/7/24

// This is a test bench module that tests the segmentSwitcher correctly switched the correct transistor/display on and provided the correct seg output 
module buttonFSMTB();
 // Set up test signals

 logic clk, reset;
 logic [3:0] c;
 logic [3:0] r;
 logic [6:0] seg;

 // Instantiate the device under test
 buttonFSM dut(.clk(clk), .reset(reset), .c(c), .seg(seg), .r(r));

 // Generate clock signal with a period of 10 timesteps.
 always
   begin
     clk = 1; #5;
     clk = 0; #5;
   end

initial
 begin
	reset = 1; #27; reset = 0;
	
	// test different inputs
	c = 4'b0000;
	#50;
	c = 4'b0010;
	#50;
	c = 4'b0000;
	#50;
	c = 4'b1000;
	#15
	c = 4'b1100;
	#50;
 end
endmodule