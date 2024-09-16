module lab2_MD(
    input logic reset
	input logic [3:0] c,
    output logic [3:0] r,
	output logic [6:0] seg,
    output logic led1, led2
	
);
	//initialize clk at 48MHz
	HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	segmentSwitcher a1 (s1, s2, int_osc, led1, led2, seg, sum);
				
			
endmodule