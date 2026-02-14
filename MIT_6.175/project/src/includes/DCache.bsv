import CacheTypes::*;
import MemTypes::*;
import Types::*;
import RefTypes::*;

module mkDCache#(CoreID id)(
        MessageGet fromMem,
        MessagePut toMem,
        RefDMem refDMem,
        DCache ifc);
    // TODO: Exercises 3, 5, 8

    method Action req(MemReq r);
    endmethod

    method ActionValue#(MemResp) resp;
        return ?;
    endmethod
endmodule
