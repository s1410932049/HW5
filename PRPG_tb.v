module PRPG_tb;
reg clk;
reg rst_n;
reg en;
reg [2:0]d;
parameter PERIOD = 20;
parameter real DUTY_CYCLE = 0.5;
parameter OFFSET = 0;

initial begin
    #OFFSET;
    forever begin
        clk = 1'b0;
        #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = 1'b1;
        #(PERIOD*DUTY_CYCLE);
    end
end

initial begin
    #10 rst_n=1;
    #10 rst_n=0;
    #10 rst_n=1;
end

initial begin
    #5 en=1;
    #5 en=0;
    #5 en=1;
end

initial begin
    d=3'b000;
    #20 d=3'b001;
    #20 d=3'b010;
    #100 $finish;
end

initial begin
    $dumpfile("PRPG.vcd");
    $dumpvars(0, PRPG_tb);
end

PRPG PRPG_tb(
    .clk(clk),
    .rst_n(rst_n),
    .en(en),
    .d(d)
);
endmodule
