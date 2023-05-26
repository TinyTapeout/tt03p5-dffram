`define default_netname none

module tt_um_urish_dffram (
  input  wire [7:0] ui_in,   // Dedicated inputs
  output wire [7:0] uo_out,  // Dedicated outputs
  input  wire [7:0] uio_in,  // IOs: Input path
  output wire [7:0] uio_out, // IOs: Output path
  output wire [7:0] uio_oe,  // IOs: Enable path (active high: 0=input, 1=output)
  input  wire       ena,
  input  wire       clk,
  input  wire       rst_n
);

  assign uio_oe = 8'b0; // All bidirectional IOs are inputs

  RAM32 ram1 (
    .CLK(clk),
    .EN0(!rst_n),
    .A0(ui_in[4:0]),
    .WE0(4'b0),
    .Di0({24'b0, uio_in}),
    .Do0(uio_out)
  );

endmodule
