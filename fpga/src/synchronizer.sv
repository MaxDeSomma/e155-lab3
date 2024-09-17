module synchronizer(
    input logic clk, reset,
	input logic [3:0] c,
    output logic [3:0] r,
	output logic [6:0] seg,
    output logic led1, led2
	
);
    logic [3:0] c1;
	logic [3:0] c2;

    always_ff @(posedge clk) begin
		if (reset) begin
			c1 <= 4'b0000;
			c2 <= 4'b0000;
		end
		else begin
			c1 <= c;
			c2 <= c1;
		end
    end

    buttonFSM synced (clk, reset, c,seg, r, led1, led2);
endmodule