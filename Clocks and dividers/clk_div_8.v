module div_by_4(
    input clk, rst,
    output clk_out
);
    wire intermediate_clk;

    div_by_2 div_by_2_inst1 (
        .clk(clk),
        .rst(rst),
        .clk_out(intermediate_clk)
    );

    div_by_2 div_by_2_inst2 (
        .clk(intermediate_clk),
        .rst(rst),
        .clk_out(clk_out)
    );
endmodule

module div_by_8(
    input clk, rst,
    output clk_out
);
    wire first_clk_out;

    div_by_4 div_by_4_inst (
        .clk(clk),
        .rst(rst),
        .clk_out(first_clk_out)
    );

    div_by_2 div_by_2_inst (
        .clk(first_clk_out),
        .rst(rst),
        .clk_out(clk_out)
    );
endmodule