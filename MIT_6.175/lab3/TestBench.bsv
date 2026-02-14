import TestBenchTemplates::*;
import Multipliers::*;

(* synthesize *)
module mkTbDumb();
    function Bit#(16) test_function(Bit#(8) a, Bit#(8) b) = multiply_unsigned(a, b);
    Empty tb <- mkTbMulFunction(test_function, multiply_unsigned, True);
    return tb;
endmodule

(* synthesize *)
module mkTbFoldedMultiplier();
    Multiplier#(8) dut <- mkFoldedMultiplier();
    Empty tb <- mkTbMulModule(dut, multiply_signed, True);
    return tb;
endmodule

(* synthesize *)
module mkTbSignedVsUnsigned();
    // TODO: Exercise 1
endmodule

(* synthesize *)
module mkTbEx3();
    // TODO: Exercise 3
endmodule

(* synthesize *)
module mkTbEx5();
    // TODO: Exercise 5
endmodule

(* synthesize *)
module mkTbEx7a();
    // TODO: Exercise 7
endmodule

(* synthesize *)
module mkTbEx7b();
    // TODO: Exercise 7
endmodule

(* synthesize *)
module mkTbEx9a();
    // TODO: Exercise 9
endmodule

(* synthesize *)
module mkTbEx9b();
    // TODO: Exercise 9
endmodule
