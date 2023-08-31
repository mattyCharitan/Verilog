module div_by_3 (
    input clk,
    input rst,
    output clk_out
);

    reg [1:0] cnt;

    always @(posedge clk or posedge rst)
        if (rst)
            cnt <= 0;
        else
            cnt <= cnt[1] ? 2'b00 : cnt + 1'b01;

    assign clk_out = ~cnt[1];

endmodule
