module TestBench;
    reg clk = 0;
    reg signal = 0;
    wire posedge_detected;
    wire negedge_detected;

    always #1 clk = ~clk;

    initial begin

        #2
        signal = 0; #2;
        signal = 1; #2;
        signal = 0; #2;
        signal = 1; #2;
        signal = 0; #2;
        signal = 1; #2;
        $finish;
    end

     posedge_detector posedge_inst (
         .clk(clk),
         .signal(signal),
         .posedge_detected(posedge_detected)
     );

    negedge_detector negedge_inst (
        .clk(clk),
        .signal(signal),
        .negedge_detected(negedge_detected)
    );
endmodule
