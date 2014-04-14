module addPC(in, out, pc_stall);
    input[15:0] in;
    input pc_stall;
    output[15:0] out;
    
    assign out = (pc_stall!==1'b1)? in + 16'b0000000000000001 : in;
    
endmodule
