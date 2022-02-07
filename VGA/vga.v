// VGA
module vga_sync(
    input clk_pix,
    input rst,
    output hsync,
    output vsync,
    output inrange,
    output [9:0] h_cnt_o,
    output [9:0] v_cnt_o
  );

  reg [9:0] h_cnt = 0;
  reg [9:0] v_cnt = 0;
  reg hsync_i = 1'b1;
  reg vsync_i = 1'b1;
  // sync type
  wire hsync_type;
  wire vsync_type;
  assign hsync_type = 1;
  assign vsync_type = 1;

  // Horizontal param
  parameter Hs = 96;  // sync
  parameter Hb = 48;  // bp
  parameter Hd = 640; // pix display
  parameter Hf = 16;  // fp
  parameter Ht = 800; // total

  // Vertical param
  parameter Vs = 2;   // sync
  parameter Vb = 33;  // bp
  parameter Vd = 480; // pix display
  parameter Vf = 10;  // fp
  parameter Vt = 525; // total

  // Horizontal cnt
  always @(posedge clk_pix or posedge rst)
  begin
    if(rst)
      h_cnt <= 0;
    else if(h_cnt < Ht - 1)
      h_cnt <= h_cnt + 1;
    else
      h_cnt <= 0;
  end

  // Vertical cnt
  always @(posedge clk_pix or posedge rst)
  begin
    if(rst)
      v_cnt <= 0;
    else if(h_cnt == Ht - 1)
    begin
      if(v_cnt < Vt - 1)
        v_cnt <= v_cnt + 1;
      else
        v_cnt <= 0;
    end
    else
      v_cnt <= v_cnt;
  end

  // Horizontal sync
  always @(posedge clk_pix or posedge rst)
  begin
    if(rst)
      hsync_i <= hsync_type;
    else if(h_cnt >= Hd + Hf - 1 && h_cnt < Hd + Hf + Hs - 1)
      hsync_i <= ~hsync_type;
    else
      hsync_i <= hsync_type;
  end

  // Vertical sync
  always @(posedge clk_pix or posedge rst)
  begin
    if(rst)
      vsync_i <= vsync_type;
    else if(v_cnt >= Vd + Vf - 1 && v_cnt < Vd + Vf + Vs - 1)
      vsync_i <= ~vsync_type;
    else
      vsync_i <= vsync_type;
  end

  assign h_cnt_o = h_cnt < Hd ? h_cnt : 0;
  assign v_cnt_o = v_cnt < Vd ? v_cnt : 0;
  assign hsync = hsync_i;
  assign vsync = vsync_i;
  assign inrange = h_cnt < Hd && v_cnt < Vd;

endmodule
