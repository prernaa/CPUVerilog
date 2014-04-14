module pc(in, out, clk, rst);
    input[15:0] in;
    input clk;
    input rst;
    output [15:0] out;
    
    reg[15:0] value;
    
    always@(posedge clk or posedge rst)
        if(rst)
            begin
            value <= 16'b0000000000000000;
            end
        else
            begin
            value <= in;
            end
            
    assign out = value;
endmodule        

