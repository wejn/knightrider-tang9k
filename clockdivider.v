module clock_divider(clk, sys_rst_n, slow_clk);
    input wire clk;
    input wire sys_rst_n;
    output reg slow_clk;

    parameter COUNTER_SIZE = 21;
    parameter INCREMENT = 1'd1;

    reg [COUNTER_SIZE-1:0] count;
    reg pulse;

    always @ (posedge clk or negedge sys_rst_n)
    begin
        if (!sys_rst_n)
            {slow_clk, count} <= 0;
        else
            {slow_clk, count} <= count + INCREMENT;
    end
endmodule

