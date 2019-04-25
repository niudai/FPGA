module sortTest;
    reg clk;
    reg  [3-1:0] in1,  in2,  in3,  in4;
    wire [3-1:0] out1, out2, out3, out4;

    sort #(.NUM_VALS(4), .SIZE(3)) dut (
        .clk(clk),
        .in ({in1,  in2,  in3,  in4}),
        .out({out1, out2, out3, out4})
    );

    always @(posedge clk) begin
        in1 <= $random;
        in2 <= $random;
        in3 <= $random;
        in4 <= $random;
    end

    always @(posedge clk) begin
        $display("In:  %0d %0d %0d %0d", in1,  in2,  in3,  in4);
        $display("Out: %0d %0d %0d %0d", out1, out2, out3, out4);
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
