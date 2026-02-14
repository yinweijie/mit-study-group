import Types::*;
import ProcTypes::*;

interface Bht#(numeric type indexSize);
    method Bool predict(Addr addr);
    method Action train(Addr addr, Bool taken);
endinterface

module mkBht(Bht#(indexSize)) provisos(Add#(indexSize, a__, 32));
    // TODO: Exercise 7
    method Bool predict(Addr addr);
        return False;
    endmethod

    method Action train(Addr addr, Bool taken);
    endmethod
endmodule
