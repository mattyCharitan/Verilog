module negedge_detector (
    input wire clk,
    input wire signal,
    output wire negedge_detected
);
    reg signal_prev;

    always @(posedge clk) begin
        signal_prev <= signal;
    end

    assign negedge_detected = (signal == 1'b0) && (signal_prev == 1'b1);
endmodule
