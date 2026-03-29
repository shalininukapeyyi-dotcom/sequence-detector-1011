module sequencedetector1011(
    input clk,
    input reset,
    input x,
    output reg y
);
parameter s0=3'b000;
parameter s1=3'b001;
parameter s2=3'b011;
parameter s3=3'b100;
reg[2:0] PS,NS;
always @(posedge clk or posedge reset)
begin  
if(reset)
PS<= s0;
else 
PS<=NS;  
end
always @(*)
begin
    case(PS)
    s0:begin
        if(x==1)
        NS=s1;
        else
        NS=s0;
        y=0;
    end
    s1:begin
        if(x==0)
        NS=s2;
        else
        NS=s1;
        y=0;
    end
        s2:begin
            if(x==1)
            NS=s3;
            else
            NS=s0;
            y=0;
        end
        s3:begin
            if(x==1)begin
             NS=s0;
             y=1;   
            end
        else
            begin
            NS=s2;
            y=0;
        end
end
    endcase
end
endmodule