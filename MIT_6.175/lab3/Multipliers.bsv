// Reference functions that use Bluespec's '*' operator
function Bit#(TAdd#(n, n)) multiply_unsigned(Bit#(n) a, Bit#(n) b);
    UInt#(n) a_uint = unpack(a);
    UInt#(n) b_uint = unpack(b);
    UInt#(TAdd#(n, n)) product_uint = zeroExtend(a_uint) * zeroExtend(b_uint);
    return pack(product_uint);
endfunction

function Bit#(TAdd#(n, n)) multiply_signed(Bit#(n) a, Bit#(n) b);
    Int#(n) a_int = unpack(a);
    Int#(n) b_int = unpack(b);
    Int#(TAdd#(n, n)) product_int = signExtend(a_int) * signExtend(b_int);
    return pack(product_int);
endfunction

function Bit#(TAdd#(n, n)) multiply_by_adding(Bit#(n) a, Bit#(n) b);
    // TODO: Exercise 2
    return ?;
endfunction

interface Multiplier#(numeric type n);
    method Bool start_ready();
    method Action start(Bit#(n) a, Bit#(n) b);
    method Bool result_ready();
    method ActionValue#(Bit#(TAdd#(n, n))) result();
endinterface

module mkFoldedMultiplier(Multiplier#(n)) provisos(Add#(1, a__, n));
    // TODO: Exercises 4-5
    method Bool start_ready();
        return True;
    endmethod

    method Action start(Bit#(n) a, Bit#(n) b);
    endmethod

    method Bool result_ready();
        return False;
    endmethod

    method ActionValue#(Bit#(TAdd#(n, n))) result();
        return ?;
    endmethod
endmodule

function Bit#(n) arth_shift(Bit#(n) a, Integer shamt, Bool right_shift);
    Int#(n) a_int = unpack(a);
    if (right_shift) begin
        return pack(a_int >> shamt);
    end
    else begin
        return pack(a_int << shamt);
    end
endfunction

module mkBoothMultiplier(Multiplier#(n)) provisos(Add#(2, a__, n));
    // TODO: Exercises 6-7
    method Bool start_ready();
        return True;
    endmethod

    method Action start(Bit#(n) m, Bit#(n) r);
    endmethod

    method Bool result_ready();
        return False;
    endmethod

    method ActionValue#(Bit#(TAdd#(n, n))) result();
        return ?;
    endmethod
endmodule

module mkBoothMultiplierRadix4(Multiplier#(n)) provisos(Mul#(a__, 2, n), Add#(1, b__, a__));
    // TODO: Exercises 8-9
    method Bool start_ready();
        return True;
    endmethod

    method Action start(Bit#(n) m, Bit#(n) r);
    endmethod

    method Bool result_ready();
        return False;
    endmethod

    method ActionValue#(Bit#(TAdd#(n, n))) result();
        return ?;
    endmethod
endmodule
