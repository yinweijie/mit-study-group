import Types::*;
import ProcTypes::*;
import CacheTypes::*;
import RefTypes::*;
import MessageFifo::*;

module mkCore(
        CoreID id,
        WideMem iMem,
        RefDMem refDMem,
        Core ifc
        );
    // TODO: Exercises 7-8
    MessageFifo#(2) toParentQ <- mkMessageFifo;
    MessageFifo#(2) fromParentQ <- mkMessageFifo;

    interface toParent = toMessageGet(toParentQ);
    interface fromParent = toMessagePut(fromParentQ);

    method ActionValue#(CpuToHostData) cpuToHost;
        return ?;
    endmethod

    method Bool cpuToHostValid = False;

    method Action hostToCpu(Addr startpc);
    endmethod
endmodule
