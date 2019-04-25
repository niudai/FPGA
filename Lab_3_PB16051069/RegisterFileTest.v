module RegisterFileTest();
reg clk;
reg [2:0] R1, R2;
reg [2:0] W1;
reg We;
reg [31:0] D1;

wire [31:0] Out1, Out2;

RegisterFile rf(R1, R2, W1, D1, We, clk, Out1, Out2);
initial begin
clk = 0;
forever #2 clk=~clk;
end

initial begin
//R1 = 3'd1;
//R2 = 3'd2;
//#10;
W1 = 3'd3;
We = 1'b1;
D1 = 32'd15;
R1 = 3'd3;
#10;
end
endmodule