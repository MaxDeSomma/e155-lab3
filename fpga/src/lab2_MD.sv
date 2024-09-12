// lab2_MD.sv
// Max De Somma
// mdesomma@g.hmc.edu
// 9/7/24

// This is a top module that initiallizes a clk using the high speed oscillator onboard, as well as connect the submodule segmentSwitcher
module lab2_MD(
	input logic [3:0] s1, s2,
	output logic led1, led2,
	output logic [6:0] seg,
	output logic [4:0] sum
);
	//initialize clk at 48MHz
	HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	segmentSwitcher a1 (s1, s2, int_osc, led1, led2, seg, sum);
				
			
endmodule