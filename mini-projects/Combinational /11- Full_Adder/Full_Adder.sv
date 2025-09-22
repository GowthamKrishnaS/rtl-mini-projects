//===========================================================
// Full Adder Module
//===========================================================
module full_adder (
    input  logic a,       // First input bit
    input  logic b,       // Second input bit
    input  logic cin,     // Carry input
    output logic sum,     // Sum output
    output logic cout     // Carry output
);

    // Sum logic: XOR of three bits
    assign sum  = a ^ b ^ cin;

    // Carry logic: if any two inputs are 1, carry is 1
    assign cout = (a & b) | (b & cin) | (a & cin);

endmodule
