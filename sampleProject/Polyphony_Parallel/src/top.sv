`default_nettype none

module top (
  input  wire sw1,
  input  wire       clk,
  output wire boardLED1,
  output wire boardLED2,
  output wire boardLED3
);

  wire Overflow;
  logic oneSecondClk;
  logic reset=1;
  reg[7:0] resetCount;

  Parallel_m inst(
    .clk(clk),
    .rst(reset),
    .boardLED1(boardLED1),
    .boardLED2(boardLED2),
    .boardLED3(boardLED3),
    .oneSecondClk(oneSecondClk)
  );

  always@(posedge clk)begin
    if(reset)begin
      resetCount <= resetCount + 8'b1;
      if(resetCount > 8'd254)begin
        resetCount <= 0;
        reset <= 0;
      end
    end else if(~sw1)begin
      reset <= 1;
    end
  end

  always@(posedge Overflow)begin
    oneSecondClk <= oneSecondClk + 1'b1;
  end 

  timer #(
    .COUNT_MAX(27000000/2)
  ) inst_1 (
    .clk (clk),
    .overflow(Overflow)
  );

endmodule

module timer #(
  parameter COUNT_MAX = 27000000
) (
  input  wire  clk,
  output logic overflow
);

  logic [$clog2(COUNT_MAX+1)-1:0] counter = 'd0;

  always_ff @ (posedge clk) begin
    if (counter == COUNT_MAX) begin
      counter  <= 'd0;
      overflow <= 'd1;
    end else begin
      counter  <= counter + 'd1;
      overflow <= 'd0;
    end
  end
endmodule

`default_nettype wire
