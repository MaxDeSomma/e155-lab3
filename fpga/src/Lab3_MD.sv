// lab3_MD.sv
// Max De Somma
// mdesomma@g.hmc.edu
// 9/19/24

// This is the top module that instantiates the clk and calls the other modules
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