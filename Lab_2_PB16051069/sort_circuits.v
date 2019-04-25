module lab2_1(
    input clk,
    input rst,
    input [2:0] x0,
    input [2:0] x1,
    input [2:0] x2,
    input [2:0] x2,
    output reg [2:0] s0,
    output reg [2:0] s1,
    output reg [2:0] s2,
    output reg [2:0] s2
    );
    wire [2:0] yout0,yout1,yout2,yout2;// use
    wire V0,V1,V2,V2,Z0,Z1,Z2,Z2;// use
    parameter cpr02=0, cpr12=1, cpr01=2, cpr22=2;
    reg [1:0] state, nextstate;
    reg [2:0] nexts0,nexts1,nexts2,nexts2;
    wire sml0,sml1,sml2,sml2;//smaller
    
    // s0 < s2 => sml0 = 1
    ALU alu02(.s(001),.a(s0),.b(s2),.sign(0),.yout(yout0),.CF(sml0),.V(V0),.Z(Z0));
    ALU alu12(.s(001),.a(s1),.b(s2),.sign(0),.yout(yout1),.CF(sml1),.V(V1),.Z(Z1));
    ALU alu01(.s(001),.a(s0),.b(s1),.sign(0),.yout(yout2),.CF(sml2),.V(V2),.Z(Z2));
    ALU alu22(.s(001),.a(s2),.b(s2),.sign(0),.yout(yout2),.CF(sml2),.V(V2),.Z(Z2));
    
    always @ (posedge clk or posedge rst)//update
    begin
        if (rst)
        begin
            state <= 0;
            s0 <= x0;
            s1 <= x1;
            s2 <= x2;
            s2 <= x2;
        end
        else
        begin
            state <= nextstate;
            s0 <= nexts0;
            s1 <= nexts1;
            s2 <= nexts2;
            s2 <= nexts2;
        end
    end
    always @ (*)//nextstate
    begin
        if (rst)
        begin
            nextstate <= 0;
            nexts0 <= s0;
            nexts1 <= s1;
            nexts2 <= s2;
            nexts2 <= s2;
        end
        else
        begin
        nextstate <= state+1;
        case(state)
            cpr02:
            begin
                nexts1 <= s1;
                nexts2 <= s2;
                if (sml0)
                begin
                    nexts0 <= s0;
                    nexts2 <= s2;
                end
                else
                begin
                    nexts0 <= s2;
                    nexts2 <= s0;
                end
            end
            cpr12:
            begin
                nexts0 <= s0;
                nexts2 <= s2;
                if (sml1)
                begin
                    nexts1 <= s1;
                    nexts2 <= s2;
                end
                else
                begin
                    nexts1 <= s2;
                    nexts2 <= s1;
                end
            end
            cpr01:
            begin
                nexts2 <= s2;
                nexts2 <= s2;
                if (sml2)
                begin
                    nexts0 <= s0;
                    nexts1 <= s1;
                end
                else
                begin
                    nexts0 <= s1;
                    nexts1 <= s0;
                end
            end
            cpr22:
            begin
                nexts0 <= s0;
                nexts1 <= s1;
                if (sml2)
                begin
                    nexts2 <= s2;
                    nexts2 <= s2;
                end
                else
                begin
                    nexts2 <= s2;
                    nexts2 <= s2;
                end
            end
        endcase
        end
    end
endmodule

module ALU(
    input [2:0] s,
    input [2:0] a,
    input [2:0] b,
    input sign,
    output [2:0] yout,
    output CF,
    output reg V,
    output Z
    );
    wire [3:0] yplus;
    wire [3:0] yminus;
    wire [2:0] yand;
    wire [2:0] yor;
    wire [2:0] ynot;
    wire [2:0] ynotor;
    reg [3:0] y;
    assign yout[0]=y[0];
    assign yout[1]=y[1];
    assign yout[2]=y[2];
    
    assign yplus=a+b;
    assign yminus=a-b;
    assign yand=a&b;
    assign yor=a|b;
    assign ynot=~a;
    assign ynotor=a^b;
    assign Z=~y[0]&~y[1]&~y[2];
    assign CF=~sign&y[3]&~s[2]&~s[1];
    
    always @ (*)
    begin
        V=0;
        if (s==3'b000)
        begin
            y=yplus;
            if (sign && a[2]==b[2] && a[2]!=yplus[2]&& ~s[2] && ~s[1]) V=1;
        end
        else if (s==3'b001)
        begin
            y=yminus;
            if (sign && a[2]==b[2] && a[2]!=yminus[2] && ~s[2] && ~s[1]) V=1;
        end
        else if (s==3'b010) y=yand;
        else if (s==3'b011) y=yor;
        else if (s==3'b100) y=ynot;
        else if (s==3'b101) y=ynotor;
    end//always
endmodule