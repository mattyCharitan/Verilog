module shift_reg #(parameter MSB = 8) (
    input d, clk, en, dir, rstn, output reg [MSB-1:0] out
);
    reg [MSB-1:0] shift_register;

    always @(posedge clk) begin
        if (rstn)
            out<=0;
        else begin
            if(en)
                case (dir)
                    0: out<= {out[MSB-2:0],d};
                    1: out<= {d,out[MSB-1:1]};     
                endcase
            else
                out<=out;
        end
    end
endmodule