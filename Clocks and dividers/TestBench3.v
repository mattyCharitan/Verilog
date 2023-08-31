module TestBench;
    reg clk = 0;
    reg rst = 0; 
    wire clk_out;

    div_by_3 div_by_3_inst (
        .clk(clk),
        .rst(rst),
        .clk_out(clk_out)
    );

    initial begin
        #5 rst = 1;      
        #10 rst = 0;     
        #500 $finish;    
    end

    always #5 clk = ~clk; // Generate a clock signal with a period of 10 time units

endmodule
