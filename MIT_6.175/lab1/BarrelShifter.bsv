import Vector::*;

function Bit#(32) barrelShifterRight(Bit#(32) in, Bit#(5) shiftBy);
    // TODO: Exercise 6
    Bit#(32) shifted = in;
    for(Integer k = 0; k < 5; k = k + 1) begin
        Integer shiftAmt = 2**k;
        // ((((in >> 1) >> 2) >> 4) >> 8) >> 16
        // = in >> (1 + 2 + 4 + 8 + 16)
        // = in >> 31
        // 注意：for循环会产生串联电路
        if(shiftBy[k] == 1) begin
            shifted = shifted >> shiftAmt;
        end
    end
    return shifted;
endfunction
