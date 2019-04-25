module simple_divider(quotient,remainder,ready,dividend,divider,start,clk);

   input [15:0]  dividend,divider;
   input         start, clk;
   output [15:0] quotient,remainder;
   output        ready;

//  """"""""|
//     1011 |  <----  dividend_copy
// -0011    |  <----  divider_copy
//  """"""""|    0  Difference is negative: copy dividend and put 0 in quotient.
//     1011 |  <----  dividend_copy
//  -0011   |  <----  divider_copy
//  """"""""|   00  Difference is negative: copy dividend and put 0 in quotient.
//     1011 |  <----  dividend_copy
//   -0011  |  <----  divider_copy
//  """"""""|  001  Difference is positive: use difference and put 1 in quotient.
//            quotient (numbers above)


   reg [15:0]    quotient;
   reg [31:0]    dividend_copy, divider_copy, diff;
   wire [15:0]   remainder = dividend_copy[15:0];

   reg [4:0]     bit;
   wire          ready = !bit;

   initial bit = 0;

   always @( posedge clk )

     if ( ready && start ) begin

        bit = 16;
        quotient = 0;
        dividend_copy = {16'd0,dividend};
        divider_copy = {1'b0,divider,15'd0};

     end else begin

        diff = dividend_copy - divider_copy;
        quotient = { quotient[14:0], ~diff[31] };
        divider_copy = { 1'b0, divider_copy[31:1] };
        if ( !diff[31] ) dividend_copy = diff;
        bit = bit - 1;

     end

endmodule