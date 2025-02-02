`default_nettype none

module RAM32(
  input CLK,
  input [3:0] WE0,
  input EN0,
  input [4:0] A0,
  input [31:0] Di0,
  output reg [31:0] Do0
);
    reg [31:0] RAM[31:0];

    always @(posedge CLK)
        if(EN0) begin
            Do0 <= RAM[A0];
            if(WE0[0]) RAM[A0][ 7: 0] <= Di0[7:0];
            if(WE0[1]) RAM[A0][15:8] <= Di0[15:8];
            if(WE0[2]) RAM[A0][23:16] <= Di0[23:16];
            if(WE0[3]) RAM[A0][31:24] <= Di0[31:24];
        end
        else
            Do0 <= 32'b0;

endmodule
