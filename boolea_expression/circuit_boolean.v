// E = A + BC + B'D
// F = B'C + BC'D'

module circuit_boolean(E, F, A, B, C, D);

    output E, F;
    input A, B, C, D;

    assign E = A || (B && C) || ((!B) && D);
    assign F = ((!B) && C) || (B && (!C) && (!D));

endmodule

// TEST BENCH PARA CIRCUIT_BOOLEAN
module t_circuit_boolean;

    wire E, F;
    reg A, B, C, D;

    circuit_boolean C1(E, F, A, B, C, D);

    initial 
        begin

            $monitor("[time: %0t]\nE: %b\nF: %b\n", $time, E, F);

            A = 1'b0; B = 1'b0; C = 1'b1; D = 1'b1;
            #50 A = 1'b1; B = 1'b0; C = 1'b0; D = 1'b0;

        end

endmodule