module tb;
reg clk;
reg reset;
reg x;
wire y;
sequencedetector1011 dut(.clk(clk), .reset(reset), .x(x), .y(y));
always #5 clk=~clk;
initial begin
    $dumpfile("sequencedetector1011.vcd");
    $dumpvars(0,tb);
    clk=0;
    reset=1;
    x=0;
    @(posedge clk);
    #10 reset=0;
    #10 @(posedge clk); x=1;
    #10 @(posedge clk); x=0;
    #10 @(posedge clk); x=1;
    #10 @(posedge clk); x=1;

    #10 @(posedge clk); x=0;
    #10 @(posedge clk); x=0;
    #10 @(posedge clk) ;x=0;

    #10 @(posedge clk); x=1;
    #10 @(posedge clk); x=0;
    #10 @(posedge clk); x=1;
    #10 @(posedge clk); x=1;

    #20 $finish;
end
endmodule