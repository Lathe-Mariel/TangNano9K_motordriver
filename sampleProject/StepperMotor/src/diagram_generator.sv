// This source code relates next file's license
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
//2phase
        if(vcounter == 100)begin
          if((hcounter & 8'b10000000) == 0)begin
            video_data <= 24'heeeeee;
          end
          else begin
            video_data <= 24'h000000;
          end
        end
        else if(vcounter == 160 )begin
          if((hcounter & 6'b100000) == 0)begin
            video_data <= 24'hbbbbbb;
          end
          else begin
            video_data <= 24'heeeeee;
          end
        end
        else if(vcounter == 220 )begin
          if((hcounter & 8'b10000000) == 0)begin
            video_data <= 24'h000000;
          end
          else begin
            video_data <= 24'heeeeee;
          end
        end
        else if(vcounter > 100 && vcounter < 220)begin
          if((hcounter % 128) == 0)begin
              video_data <= 24'h000000;
          end
          else begin
            video_data <= 24'heeeeee;
          end
        end

//w1-2phase
        else if(vcounter == 400)begin
          if((hcounter < 192))begin
            video_data <= 24'h000000;
          end
          else begin
            video_data <= 24'heeeeee;
          end
        end
        else if(vcounter == 420)begin
          if((hcounter > 192 && hcounter < 256))begin
            video_data <= 24'h000000;
          end
          else begin
            video_data <= 24'heeeeee;
          end
        end
        else if(vcounter == 440)begin
          if((hcounter > 256 && hcounter < 320))begin
            video_data <= 24'h000000;
          end
          else begin
            video_data <= 24'heeeeee;
          end
        end
        else if(vcounter == 460)begin
          if((hcounter > 320) && (hcounter < 384))begin
            video_data <= 24'h000000;
          end
          else if((hcounter & 6'b100000) == 0) begin
            video_data <= 24'heeeeee;
          end
          else begin
            video_data <= 24'hbbbbbb;
          end
        end
        else if(vcounter == 480 )begin
          if(hcounter > 384 && hcounter < 448)begin
            video_data <= 24'h000000;
          end
          else begin
            video_data <= 24'heeeeee;
          end
        end
        else if(vcounter == 500 )begin
          if(hcounter > 448 && hcounter < 512)begin
            video_data <= 24'h000000;
          end
          else begin
            video_data <= 24'heeeeee;
          end
        end
        else if(vcounter == 520 )begin
          if(hcounter > 512 && hcounter < 704)begin
            video_data <= 24'h000000;
          end
          else begin
            video_data <= 24'heeeeee;
          end
        end

        else if(vcounter > 400 && vcounter < 520)begin
          if((hcounter % 64) == 0)begin
              video_data <= 24'h000000;
          end
          else begin
            video_data <= 24'heeeeee;
          end
        end
        else begin
            video_data <= 24'heeeeee;
        end

    end
end

endmodule
`default_nettype wire