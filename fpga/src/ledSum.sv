// ledSum.sv
// Max De Somma
// mdesomma@g.hmc.edu
// 9/7/24

// This is a sub module displays the summation of the two hexadecimal numbers on 5 leds

module ledSum(
	input logic [3:0] s1, s2,
	output logic [4:0] sum
);
	always_comb begin
		sum = s1 + s2;
	end
endmodule


