import Ehr::*;
import Vector::*;

interface Fifo#(numeric type n, type t);
    method Bool notFull;
    method Action enq(t x);
    method Bool notEmpty;
    method Action deq;
    method t first;
    method Action clear;
endinterface

module mkMyConflictFifo(Fifo#(n, t)) provisos (Bits#(t, tSz));
    // TODO: Exercise 1
    method Bool notFull;
        return False;
    endmethod

    method Action enq(t x) if (False);
    endmethod

    method Bool notEmpty;
        return False;
    endmethod

    method Action deq if (False);
    endmethod

    method t first if (False);
        return ?;
    endmethod

    method Action clear;
    endmethod
endmodule

module mkMyPipelineFifo(Fifo#(n, t)) provisos (Bits#(t, tSz));
    // TODO: Exercise 2
    method Bool notFull;
        return False;
    endmethod

    method Action enq(t x) if (False);
    endmethod

    method Bool notEmpty;
        return False;
    endmethod

    method Action deq if (False);
    endmethod

    method t first if (False);
        return ?;
    endmethod

    method Action clear;
    endmethod
endmodule

module mkMyBypassFifo(Fifo#(n, t)) provisos (Bits#(t, tSz));
    // TODO: Exercise 2
    method Bool notFull;
        return False;
    endmethod

    method Action enq(t x) if (False);
    endmethod

    method Bool notEmpty;
        return False;
    endmethod

    method Action deq if (False);
    endmethod

    method t first if (False);
        return ?;
    endmethod

    method Action clear;
    endmethod
endmodule

module mkMyCFFifo(Fifo#(n, t)) provisos (Bits#(t, tSz));
    // TODO: Exercises 3-4
    method Bool notFull;
        return False;
    endmethod

    method Action enq(t x) if (False);
    endmethod

    method Bool notEmpty;
        return False;
    endmethod

    method Action deq if (False);
    endmethod

    method t first if (False);
        return ?;
    endmethod

    method Action clear;
    endmethod
endmodule
