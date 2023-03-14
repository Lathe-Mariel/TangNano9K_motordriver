`default_nettype none

module top (
  input  wire clk,

  input  wire sw1,
  input  wire sw2,

  output wire boardLED1,

  output wire [7:0] anode,
  output wire [7:0] cathode,

  input wire [7:0] dipSW
);

  logic       oneSecondCLK;
  logic       oneSecondOverflow;
  logic [7:0] cycleRegister;

//DIP Switch Test
  assign cathode[7] = dipSW[7];
  assign cathode[6] = dipSW[6];
  assign cathode[5] = dipSW[5];
  assign cathode[4] = dipSW[4];
  assign cathode[3] = dipSW[3];
  assign cathode[2] = dipSW[2];
  assign cathode[1] = dipSW[1];
  assign cathode[0] = dipSW[0];
  assign anode = ~cycleRegister;

  always @(posedge oneSecondCLK)begin
    if(cycleRegister == 127 || cycleRegister == 0)begin
      cycleRegister <= 1;
    end
    else begin
      cycleRegister <= cycleRegister << 8'd1;
    end
  end

  timer #(
    .COUNT_MAX(27000000/2)
  ) inst_1 (
    .clk (clk),
    .overflow(oneSecondOverflow)
  );

  always @(posedge oneSecondOverflow)begin
    oneSecondCLK = oneSecondCLK + 1;
  end

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
