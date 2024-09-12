// segmentSwitcher.sv
// Max De Somma
// mdesomma@g.hmc.edu
// 9/7/24

// This is a sub module that has a switches between led1 and led2 to power transistors that provide current
// to specific seven segment displays

module segmentSwitcher(
	input logic [3:0] s1, s2,
	input logic clk,
	output logic led1, led2,
	output logic [6:0] seg,
	output logic [4:0] sum
);
	// Internal high-speed oscillator
	
	
	logic toggle = 0;
	logic [3:0] s = s1;
	logic [24:0] counter = 0;
		
	// use a flip flop to flip toggle at around 240Hz
	always_ff @(posedge clk) begin
			counter <= counter + 1;
			if(counter == 102416) begin
					counter <= 0;
					toggle <= ~toggle;
					// depending on which display shoudl be on assign s to input s1 or s2
					if(toggle == 0) s = s1;
					else s = s2;
			end
		end
	
	// assign led1 and led2 so that one is off while the other is on
	assign led1 = toggle;
	assign led2 = ~toggle;

	// connect sevenSegment and ledSum
	sevenSegment a1(s,seg);
	ledSum a2(s1,s2,sum);

endmodule