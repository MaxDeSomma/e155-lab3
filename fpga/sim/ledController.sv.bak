module ledController(
    input logic clk, reset,
    input logic [3:0] s,
    input logic en,
    output logic [6:0] seg,
    output logic led1, led2
);
    	logic toggle = 0;
	logic [3:0] s1,s2, ledNum;
    	logic [24:0] counter = 0;
		
	// use a flip flop to flip toggle at around 240Hz
	always_ff @(posedge clk) begin
            if(reset) begin
                s1 = 4'b0;
                s2 = 4'b0;
            end
            if(en) begin
                s2 <= s1;
                s1 <= s;
            end

	counter <= counter + 1;
			if(counter == 102416) begin
					counter <= 0;
					toggle <= ~toggle;
					// depending on which display shoudl be on assign s to input s1 or s2
					if(toggle == 0) ledNum = s1;
					else ledNum = s2;
			end
		end
	
	// assign led1 and led2 so that one is off while the other is on
	assign led1 = toggle;
	assign led2 = ~toggle;

	// connect sevenSegment and ledSum
	sevenSegment a1(ledNum,seg);

endmodule