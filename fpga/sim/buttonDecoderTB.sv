// buttonDecoder.sv
// Max De Somma
// mdesomma@g.hmc.edu
// 9/7/24

// This is a test bench module that tests the segmentSwitcher correctly switched the correct transistor/display on and provided the correct seg output 
module buttonDecoderTB();
 // Set up test signals
 logic clk;
 logic [3:0] c;
 logic [3:0] r;
 logic [3:0] s;

 // Instantiate the device under test
 buttonDecoder dut(.c(c), .r(r), .s(s));

 // Generate clock signal with a period of 10 timesteps.
 always
   begin
     clk = 1; #5;
     clk = 0; #5;
   end

initial
 begin
	// test different inputs
	r = 4'b1000;
	c = 4'b0001;
	#20;
	r = 4'b0100;
	c = 4'b0010;
	#20;
	r = 4'b0010;
	c = 4'b1000;
	#20;
    r = 4'b1111;
    c = 4'b0000;
    #20;
 end
endmodule