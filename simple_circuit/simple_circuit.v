module simple_circuit(A,B,C,D,E);

    output D, E;
    input A,B,C;
    wire w1;

    and #(30) G1(w1, A, B);
    not #(10) G2(E, C);
    or  #(20) G3(D, W1, E);
    
endmodule

// Test Bech para simular  el modulo simple_circuit
module t_simple_circuit;

    wire D, E;
    reg A, B, C;

    simple_circuit S1(A, B, C, D, E); // CREA INSTANCIA DEL MODULO A SIMULAR

    initial
        begin

            $monitor("[time: %0t]\nD: %b\nE: %b\n", $time, D, E); // snapshot de escucha cadabes de una varibale cambia valor

            A = 1'b0; B = 1'b0; C = 1'b0; // 1 BYTE ' BINARIO 0 nanosegundo 0
            #100 A = 1'b1; B = 1'b1; C = 1'b1; // 1 BYTE ' BINARIO 1 nanosegundo 50

        end
    initial #200 $finish;

endmodule
