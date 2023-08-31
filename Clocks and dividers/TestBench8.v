module TestBench;
    reg clk = 0; 
    reg rst = 1;
    wire clk_out;

    always #1 clk = ~clk;

    div_by_8 div_by_8_inst (
        .clk(clk),
        .rst(rst),
        .clk_out(clk_out)
    );

    initial begin
        $monitor("Time=%0t clk=%b clk_out=%b", $time, clk, clk_out);
        #2 rst = 0;
        #37 $finish;
    end

endmodule