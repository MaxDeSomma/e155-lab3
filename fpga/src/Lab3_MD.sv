module lab3_MD(
    input logic reset,
	input logic [3:0] c,
    output logic [3:0] r,
	output logic [6:0] seg,
    output logic led1, led2
	
);
	//initialize clk at 48MHz
	HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	
	lab3_Master a1 (int_osc, reset, c, r, seg, led1, led2);
				
			
endmodule