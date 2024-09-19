// synchronizer.sv
// Max De Somma
// mdesomma@g.hmc.edu
// 9/19/24

// This module tries to sync up the metastable human input on the button to align with the clock
module synchronizer(
    input logic clk, reset,
	input logic [3:0] c,
    output logic [3:0] r,
	output logic [6:0] seg,
    output logic led1, led2
	
);
    logic [3:0] c1;
	logic [3:0] c2;

    always @(posedge clk) begin
			c1 <= c;
			c2 <= c1;
    end

    buttonFSM synced (clk, reset, c2,seg, r, led1, led2);
endmodule