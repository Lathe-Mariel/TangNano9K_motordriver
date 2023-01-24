`default_nettype none

module top_w12 #(
) (
  input wire  clk,
  input wire  sw1,
  input wire  sw2,
  output logic [5:0] boardLED
);

always@(posedge clk)begin
  if(~sw2)begin
    boardLED <= ~(func1(5, 10));
  end else if(~sw1)begin
    boardLED <= ~(func2(5, 10));
  end else begin
    boardLED <= ~(6'b0);
  end
end

function [5:0] func1([4:0] x, [4:0] y);
begin
  func1 = (x>y)?(x-y):(y-x);
end
endfunction

function [5:0] func2([4:0] x, [4:0] y);
begin
  if(x > y)begin
    func2 = x - y;
  end else begin
    func2 = y - x;
  end
end
endfunction
endmodule