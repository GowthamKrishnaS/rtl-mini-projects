module ripple_carry_adder #(parameter N = 4) (
    input  logic [N-1:0] a, b,
    input  logic        cin,
    output logic [N-1:0] sum,
    output logic        cout
);
    logic [N:0] carry;

    always_comb begin
        carry[0] = cin; // procedural assignment instead of "assign"
        for (int i = 0; i < N; i++) begin
            sum[i]     = a[i] ^ b[i] ^ carry[i];
            carry[i+1] = (a[i] & b[i]) | (a[i] & carry[i]) | (b[i] & carry[i]);
        end
    end

    assign cout = carry[N]; // keep continuous assignment for output

endmodule

