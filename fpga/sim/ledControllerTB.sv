// ledControllerTB.sv
// Max De Somma
// mdesomma@g.hmc.edu
// 9/14/24

// This is a test bench module that tests the segmentSwitcher correctly switched the correct transistor/display on and provided the correct seg output 
module ledControllerTB();
 // Set up test signals

 logic clk, reset, en, led1, led2;
 logic [3:0] s;
 logic [6:0] seg;

 // Instantiate the device under test
 ledController dut(.clk(clk), .reset(reset), .s(s), .en(en), .seg(seg), .led1(led1), .led2(led2));

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
	s = 4'b0100;
    #13;
    en =1;
    #10;
    en = 0;
    #7;
	#50;
	s = 4'b0110;
    #13;
    en =1;
    #10;
    en = 0;
    #7;
	#50;
	// s = 4'b0110;
	// #50;
	// s = 4'b1001;
	// #50;
 end
endmodule