import Multiplexer::*;

function Bit#(1) fa_sum(Bit#(1) a, Bit#(1) b, Bit#(1) c);
    return a ^ b ^ c;
endfunction

function Bit#(1) fa_carry(Bit#(1) a, Bit#(1) b, Bit#(1) c);
    return (a & b) | (a & c) | (b & c);
endfunction

function Bit#(5) add4(Bit#(4) a, Bit#(4) b, Bit#(1) c0);
    // TODO: Exercise 4
    return ?;
endfunction

interface Adder8;
    method ActionValue#(Bit#(9)) sum(Bit#(8) a, Bit#(8) b, Bit#(1) c_in);
endinterface

module mkRCAdder(Adder8);
    method ActionValue#(Bit#(9)) sum(Bit#(8) a, Bit#(8) b, Bit#(1) c_in);
        let low = add4(a[3:0], b[3:0], c_in);
        let high = add4(a[7:4], b[7:4], low[4]);
        return {high, low[3:0]};
    endmethod
endmodule

module mkCSAdder(Adder8);
    method ActionValue#(Bit#(9)) sum(Bit#(8) a, Bit#(8) b, Bit#(1) c_in);
        // TODO: Exercise 5
        return ?;
    endmethod
endmodule
