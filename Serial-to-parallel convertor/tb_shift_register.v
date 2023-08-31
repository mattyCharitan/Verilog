module tb_sr;
    parameter MSB = 16;

    reg data;
    reg clk;
    reg en;
    reg dir;
    reg rstn;
    wire [MSB-1:0] out;

    shift_reg #(MSB) sr(
        .d(data),
        .clk(clk),
        .en(en),
        .dir(dir),
        .rstn(rstn),
        .out(out)
    );
    always #10 clk =~clk;

    initial begin
        clk <=0;
        en <= 0;
        dir <= 0;
        rstn <= 0;
        data <= 4'b0001;
    end

    initial begin
        rstn <=0;
        #20 rstn <=1;
        en  <= 1;

        repeat(7) @(posedge clk)
            data <= ~data;
        #10 dir <=1;
        repeat (7) @(posedge clk)
            data <= ~data;

        repeat (7) @(posedge clk)
        $finish;
    end


endmodule
    