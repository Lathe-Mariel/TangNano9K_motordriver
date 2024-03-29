// This source code(diagram_generator.sv) is written by Akira Nagai,
// and is related with next file's license.
//
// SPDX-License-Identifier: BSL-1.0
// Copyright Kenta Ida 2022.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          https://www.boost.org/LICENSE_1_0.txt)
/**
 * @file test_pattern_generator.sv
 * @brief Test pattern video signal generator
 */
`default_nettype none

module diagram_generator #(
    parameter int HSYNC = 40,
    parameter int HBACK = 220,
    parameter int HACTIVE = 1280,
    parameter int HFRONT = 110,
    parameter int VSYNC = 5,
    parameter int VBACK = 20,
    parameter int VACTIVE = 720,
    parameter int VFRONT = 5
)(
    input wire clock,
    input wire reset,
    input wire[1:0] excitation_mode,

    output logic  [23:0] video_data,
    output logic         video_de,
    output logic         video_hsync,
    output logic         video_vsync
);

logic  [23:0] video_data_value;

localparam int HTOTAL = HSYNC + HBACK + HACTIVE + HFRONT;
localparam int VTOTAL = VSYNC + VBACK + VACTIVE + VFRONT;
localparam int HCOUNTER_BITS = $clog2(HTOTAL);
localparam int VCOUNTER_BITS = $clog2(VTOTAL);

typedef logic [HCOUNTER_BITS-1:0] hcounter_t;
typedef logic [VCOUNTER_BITS-1:0] vcounter_t;

hcounter_t hcounter = 0;
vcounter_t vcounter = 0;

always_ff @(posedge clock) begin
    if( reset ) begin
        hcounter <= '0;
        vcounter <= '0;
        video_de <= 0;
        video_hsync <= 0;
        video_vsync <= 0;
        video_data <= 0;
    end
    else begin
        if( hcounter == HTOTAL - 1) begin
            hcounter <= '0;
            if( vcounter == VTOTAL - 1) begin
                vcounter <= '0;
            end
            else begin
                vcounter <= vcounter + vcounter_t'(1);
            end
        end
        else begin
            hcounter <= hcounter + hcounter_t'(1);
        end

        video_de <= HSYNC + HBACK <= hcounter && hcounter < HSYNC + HBACK + HACTIVE
                && VSYNC + VBACK <= vcounter && vcounter < VSYNC + VBACK + VACTIVE;
        video_hsync <= hcounter < HSYNC;
        video_vsync <= vcounter < VSYNC;
    end
    
    if(excitation_mode == 2)begin
      video_data <= diagram_w12(hcounter-250, vcounter-100);
    end else if(excitation_mode == 0)begin
      video_data <= diagram_2(hcounter, vcounter);
    end else begin
      video_data <= 24'heeeeee;
    end
end

function [23:0] diagram_2(hcounter_t x, vcounter_t y);
begin
    if(y == 100)begin
      if((x & 8'b10000000) == 0)begin
        diagram_2 <= 24'heeeeee;
      end
      else begin
        diagram_2 <= 24'h000000;
      end
    end
    else if(y == 160 )begin
      if((x & 5'b10000) == 0)begin
        diagram_2 <= 24'hbbbbbb;
      end
      else begin
        diagram_2 <= 24'heeeeee;
      end
    end
    else if(y == 220 )begin
      if((x & 8'b10000000) == 0)begin
        diagram_2 <= 24'h000000;
      end
      else begin
        diagram_2 <= 24'heeeeee;
      end
    end
    else if(y > 100 && y < 220)begin
      if((x % 128) == 0)begin
        diagram_2 <= 24'h000000;
      end
      else begin
        diagram_2 <= 24'heeeeee;
      end
    end
    else begin
      diagram_2 <= 24'heeeeee;
    end

end
endfunction

function [23:0] diagram_w12(hcounter_t x, vcounter_t y);
begin
  if((x / 160) % 2)begin
    y = 120 - y;
  end
  x = x % 160;

        if((x < 70 || x > 90) && y == 60)begin 
          if((x & 5'b10000) == 0)begin
            diagram_w12 <= 24'hbbbbbb;
          end else begin
            diagram_w12 <= 24'heeeeee;
          end
        end
        else if(x < 30)begin
          if(y == 120)begin
            diagram_w12 <= 24'h000000;
          end
          else begin
            diagram_w12 <= 24'heeeeee;
          end
        end
        else if(x == 30)begin
          if(y <120 && y > 100)begin
            diagram_w12 <= 24'h000000;
          end
          else begin
            diagram_w12 <= 24'heeeeee;
          end
        end
        else if(x < 50)begin
          if(y == 100)begin
            diagram_w12 <= 24'h000000;
          end
          else begin
            diagram_w12 <= 24'heeeeee;
          end
        end
        else if(x == 50)begin
          if(y < 100 && y > 80)begin
            diagram_w12 <= 24'h000000;
          end
          else begin
            diagram_w12 <= 24'heeeeee;
          end
        end
        else if(x < 70)begin
          if(y == 80)begin
            diagram_w12 <= 24'h000000;
          end
          else begin
            diagram_w12 <= 24'heeeeee;
          end
        end
        else if(x == 70)begin
          if(y < 80 && y > 60)begin
            diagram_w12 <= 24'h000000;
          end
          else begin
            diagram_w12 <= 24'heeeeee;
          end
        end
        else if(x < 90)begin
          if(y == 60)begin
            diagram_w12 <= 24'h000000;
          end
          else begin
            diagram_w12 <= 24'heeeeee;
          end
        end
        else if(x == 90)begin
          if(y < 60 && y > 40)begin
            diagram_w12 <= 24'h000000;
          end
          else begin
            diagram_w12 <= 24'heeeeee;
          end
        end
        else if(x < 110)begin
          if(y == 40)begin
            diagram_w12 <= 24'h000000;
          end
          else begin
            diagram_w12 <= 24'heeeeee;
          end
        end
        else if(x == 110)begin
          if(y < 40 && y > 20)begin
            diagram_w12 <= 24'h000000;
          end
          else begin
            diagram_w12 <= 24'heeeeee;
          end
        end
        else if(x < 130)begin
          if(y == 20)begin
            diagram_w12 <= 24'h000000;
          end
          else begin
            diagram_w12 <= 24'heeeeee;
          end
        end
        else if(x == 130)begin
          if(y < 20 && y > 0)begin
            diagram_w12 <= 24'h000000;
          end
          else begin
            diagram_w12 <= 24'heeeeee;
          end
        end
        else if(x < 160)begin
          if(y == 0)begin
            diagram_w12 <= 24'h000000;
          end
          else begin
            diagram_w12 <= 24'heeeeee;
          end
        end
    end
endfunction

endmodule
`default_nettype wire