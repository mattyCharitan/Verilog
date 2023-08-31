module div_by_2 (input clk, rst output reg clk_out);
    always @(posedge clk or rst)
        if(rst)
            clk_out <= clk;
        else
            clk_out <= ~clk_out;
endmodule
