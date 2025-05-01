module Multiplier #(
    parameter N = 4
) (
    input wire clk,
    input wire rst_n,
    input wire start,
    output reg ready,
    input wire   [N-1:0] multiplier,
    input wire   [N-1:0] multiplicand,
    output reg [2*N-1:0] product
);
    reg start_anterior;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            product <= 0;
            ready <= 0;
            start_anterior <= 0;
        end else begin
            start_anterior <= start;

            if (start && !start_anterior) begin
                product <= multiplier * multiplicand;
                ready <= 1;
            end else begin
                ready <= 0;
            end
        end
    end

endmodule
