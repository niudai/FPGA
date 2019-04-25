module divideTest;
    reg clk, rst, error, done;
    reg [4:0] in1, in2;
    wire [4:0] q, r;

    divide #(.SIZE(5)) dut (
        .x(in1),
        .y(in2),
        .rst(rst),
        .clk(clk),
        .q(q),
        .r(r),
        .error(error),
        .done(done)
    );

    always @(posedge clk) begin
      in1 <= $random;
      in2 <= $random;
      rst <= 1'b1;
    end

    always @(posedge clk) begin
        $display("In: %0d %0d", in1, in2);
        $display("Out: %0d %0d", out1, out2);
    end

    initial begin
        #100;
        $finish;
    end

    always begin
        clk = 1'b0; #5;
        clk = 1'b1; #5;
    end
endmodule

