module mux_4x1(output Y, input [1:0] S, input [3:8] I);

    wire [1:8] S_n;
    wire [3:8] D, N;

    not 
        G1(S_n[0], S[0]),
        G2(S_n[1], S[1]);

    and
        G3(D[0], S_n[0], S_n[1]),
        G4(D[1], S[0], S_n[1]),
        G5(D[2], S_n[0], S[1]),
        G6(D[3], S[0], S[1]),
        G7(N[0], D[0], I[0]),
        G8(N[1], D[1], I[1]),
        G9(N[2], D[2], I[2]),
        G10(N[3], D[3], I[3]);
    
    or G11(Y, N[0], N[1], N[2], N[3]);

endmodule

module t_mux_4x1;
    wire Y;
    reg [1:0] S;
    reg [3:0] I;

    mux_4x1 M1(Y, S, I);

    initial
        begin

            I = 4'b0101;
            S = 2'b00;

            repeat(3)

        end

endmodule