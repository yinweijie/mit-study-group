import Multiplexer::*;

// ref. 【金山文档 | WPS云文档】 lec17-Combinational Logic Blocks
// https://www.kdocs.cn/l/cg8OdpLufYZh

// Full-adder sum bit: s_i = XOR(a_i, b_i, c_i)
function Bit#(1) fa_sum(Bit#(1) a, Bit#(1) b, Bit#(1) c);
    return a ^ b ^ c;
endfunction

// Full-adder carry-out: c_{i+1} = MAJ(a_i, b_i, c_i) = a_i b_i + a_i c_i + b_i c_i
function Bit#(1) fa_carry(Bit#(1) a, Bit#(1) b, Bit#(1) c);
    return (a & b) | (a & c) | (b & c);
endfunction

// 【金山文档 | WPS云文档】 L02-CombinationalCkts
// https://www.kdocs.cn/l/cpankMGYOd5Q
function Bit#(5) add4(Bit#(4) a, Bit#(4) b, Bit#(1) c0);
    // TODO: Exercise 4
    Bit#(4) s;
    Bit#(5) c = 0;
    c[0] = c0;

    for (Integer i = 0; i < 4; i = i + 1) begin
        s[i] = fa_sum(a[i], b[i], c[i]);
        c[i+1] = fa_carry(a[i], b[i], c[i]);
    end
    
    return {c[4], s};
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
        let high1 = add4(a[7:4], b[7:4], 1'b1);
        let high0 = add4(a[7:4], b[7:4], 1'b0);
        let low = add4(a[3:0], b[3:0], c_in);
        Bit#(1) c_out = multiplexer1(low[4], high0[4], high1[4]);
        Bit#(4) s_high = multiplexer_n(low[4], high0[3:0], high1[3:0]);
        return {c_out, s_high, low[3:0]};
    endmethod
endmodule
