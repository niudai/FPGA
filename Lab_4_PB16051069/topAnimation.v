module topAnimation(
    input wire CLK,             // board clock: 100 MHz on Arty/Basys3/Nexys
    input wire RST_BTN,         // reset button
    input wire DRAW,
    input wire LEFT,
    input wire RIGHT,
    input wire TOP,
    input wire BOTTOM,
    input wire [11:0] COLOR, // 12 switches to change color         
    output wire VGA_HS_O,       // horizontal sync output
    output wire VGA_VS_O,       // vertical sync output
    output wire [3:0] VGA_R,    // 4-bit VGA red output
    output wire [3:0] VGA_G,    // 4-bit VGA green output
    output wire [3:0] VGA_B     // 4-bit VGA blue output
    );

    wire rst = RST_BTN;    // reset is active low on Arty & Nexys Video
    // wire rst = RST_BTN;  // reset is active high on Basys3 (BTNC)

    wire left = LEFT;
    wire right = RIGHT;
    wire top = TOP;
    wire bottom = BOTTOM;
    // used to control the square

    wire [9:0] x;  // current pixel x position: 10-bit value: 0-1023
    wire [8:0] y;  // current pixel y position:  9-bit value: 0-511
    wire animate;  // high when we're ready to animate at end of drawing

    // generate a 25 MHz pixel strobe
    reg [15:0] cnt = 0;
    reg pix_stb = 0;
    always @(posedge CLK)
        {pix_stb, cnt} <= cnt + 16'h4000;  // divide by 4: (2^16)/4 = 0x4000

    vga640x480 display (
        .i_clk(CLK),
        .i_pix_stb(pix_stb),
        .i_rst(rst),
        .o_hs(VGA_HS_O), 
        .o_vs(VGA_VS_O), 
        .o_x(x), 
        .o_y(y),
        .o_animate(animate)
    );

    wire sq_a, sq_b, sq_c;
    wire [11:0] sq_a_x1, sq_a_x2, sq_a_y1, sq_a_y2;  // 12-bit values: 0-4095 
    wire [11:0] sq_b_x1, sq_b_x2, sq_b_y1, sq_b_y2;
    wire [11:0] sq_c_x1, sq_c_x2, sq_c_y1, sq_c_y2;

    square #(.IX(160), .IY(120), .H_SIZE(60)) sq_a_anim (
        .i_left(left),
        .i_right(right),
        .i_top(top),
        .i_bottom(bottom),
        .i_clk(CLK), 
        .i_ani_stb(pix_stb),
        .i_rst(rst),
        .i_animate(animate),
        .o_x1(sq_a_x1),
        .o_x2(sq_a_x2),
        .o_y1(sq_a_y1),
        .o_y2(sq_a_y2)
    );

    // square #(.IX(320), .IY(240), .IY_DIR(0)) sq_b_anim (
    //     .i_clk(CLK), 
    //     .i_ani_stb(pix_stb),
    //     .i_rst(rst),
    //     .i_animate(animate),
    //     .o_x1(sq_b_x1),
    //     .o_x2(sq_b_x2),
    //     .o_y1(sq_b_y1),
    //     .o_y2(sq_b_y2)
    // );    

    // square #(.IX(480), .IY(360), .H_SIZE(100)) sq_c_anim (
    //     .i_clk(CLK), 
    //     .i_ani_stb(pix_stb),
    //     .i_rst(rst),
    //     .i_animate(animate),
    //     .o_x1(sq_c_x1),
    //     .o_x2(sq_c_x2),
    //     .o_y1(sq_c_y1),
    //     .o_y2(sq_c_y2)
    // );

    assign sq_a = ((x > sq_a_x1) & (y > sq_a_y1) &
        (x < sq_a_x2) & (y < sq_a_y2)) ? 1 : 0;

    assign VGA_R[0] = (sq_a) ? COLOR[0] : 0;
    assign VGA_R[1] = (sq_a) ? COLOR[1] : 0;
    assign VGA_R[2] = (sq_a) ? COLOR[2] : 0;
    assign VGA_R[3] = (sq_a) ? COLOR[3] : 0;
    assign VGA_G[0] = (sq_a) ? COLOR[4] : 0;
    assign VGA_G[1] = (sq_a) ? COLOR[5] : 0;
    assign VGA_G[2] = (sq_a) ? COLOR[6] : 0;
    assign VGA_G[3] = (sq_a) ? COLOR[7] : 0;
    assign VGA_B[0] = (sq_a) ? COLOR[8] : 0;
    assign VGA_B[1] = (sq_a) ? COLOR[9] : 0;
    assign VGA_B[2] = (sq_a) ? COLOR[10] : 0;
    assign VGA_B[3] = (sq_a) ? COLOR[11] : 0;  // square a is red

endmodule