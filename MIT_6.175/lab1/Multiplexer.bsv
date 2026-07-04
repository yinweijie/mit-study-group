function Bit#(1) and1(Bit#(1) a, Bit#(1) b);
    return a & b;
endfunction

function Bit#(1) or1(Bit#(1) a, Bit#(1) b);
    return a | b;
endfunction

function Bit#(1) not1(Bit#(1) a);
    return ~a;
endfunction

function Bit#(1) multiplexer1(Bit#(1) sel, Bit#(1) a, Bit#(1) b);
    // TODO: Exercise 1
    // (sel == 0) ? a : b;
    // ==>
    // (~sel & a) | (sel & b)
    return or1(and1(not1(sel), a), and1(sel, b));
endfunction

function Bit#(5) multiplexer5(Bit#(1) sel, Bit#(5) a, Bit#(5) b);
    // TODO: Exercise 2
    // Bit#(5) mux5;
    // for (Integer i = 0; i < 5; i = i + 1) begin
    //     mux5[i] = multiplexer1(sel, a[i], b[i]);
    // end
    // return mux5;

    // Verify that this function is correct by replacing the original 
    // definition of multiplexer5 to only have: return multiplexer_n(sel, a, b);
    return multiplexer_n(sel, a, b);
endfunction

function Bit#(n) multiplexer_n(Bit#(1) sel, Bit#(n) a, Bit#(n) b);
    // TODO: Exercise 3
    Bit#(n) mux_n;
    let val_n = valueOf(n);
    for (Integer i = 0; i < val_n; i = i + 1) begin
        mux_n[i] = multiplexer1(sel, a[i], b[i]);
    end
    return mux_n;
    // TEST: test .github/workflows/update-training-issue-comment.yml
endfunction
