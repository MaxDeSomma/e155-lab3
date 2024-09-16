module lab3_Master(
    input logic clk, resetInv,
	input logic [3:0] c,
    output logic [3:0] r,
	output logic [6:0] seg,
    output logic led1, led2
	
);
	logic reset;
	logic [3:0] c1,c2,c3;
	logic [24:0] counter = 0;
	logic toggle = 0;
	always_ff @(posedge clk) begin
            counter <= counter + 1;
			if(counter == 1000) begin
					counter <= 0;
					toggle <= ~toggle;
			end
		end

	always_ff @(posedge toggle) begin
		c1<=c;
	end
	always_ff @(posedge toggle) begin
		c2<=c1;
	end
	always_ff @(posedge toggle) begin
		c3<=c2;
	end
	assign reset = ~resetInv;
	buttonFSM a2 (toggle, reset, c3, seg, r, led1, led2);
endmodule