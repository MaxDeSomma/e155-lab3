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
		
	assign reset = ~resetInv;
	synchronizer a2 (toggle, reset, c, r, seg, led1, led2);
endmodule