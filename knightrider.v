module knightrider (sys_clk, sys_rst_n, led);
    input sys_clk; // clk input
    input sys_rst_n; // reset button
    output wire [5:0] led; // 6 LEDs

	wire slow_clk;
	reg [2:0] index;
	reg count_up;

	clock_divider u0 (
		.clk(sys_clk),
		.sys_rst_n(sys_rst_n),
		.slow_clk(slow_clk)
	);

	always @(posedge sys_clk or negedge sys_rst_n) begin
		if (!sys_rst_n) begin
			count_up <= 1'b1;
			index = 3'd0;
		end else begin
			if (index >= 4'd5)
				count_up <= 1'b0;
			else if (index == 4'd0)
				count_up <= 1'b1;

			if (slow_clk)
				if (count_up)
					index <= index + 1'd1;
				else
					index <= index - 1'd1;
		end
	end

	assign led[5:0] = ~(1'b1 << index);

endmodule
