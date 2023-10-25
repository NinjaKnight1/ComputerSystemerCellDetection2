module ALU(
  input         clock,
  input         reset,
  input  [31:0] io_op1,
  input  [31:0] io_op2,
  input  [1:0]  io_sel,
  output [31:0] io_result,
  output        io_IsZero
);
  wire  _T = 2'h0 == io_sel; // @[Conditional.scala 37:30]
  wire [31:0] _T_2 = io_op1 + io_op2; // @[ALU.scala 17:34]
  wire  _T_3 = 2'h1 == io_sel; // @[Conditional.scala 37:30]
  wire [31:0] _T_5 = io_op1 - io_op2; // @[ALU.scala 18:34]
  wire [31:0] _GEN_0 = _T_3 ? _T_5 : 32'h0; // @[Conditional.scala 39:67]
  assign io_result = _T ? _T_2 : _GEN_0; // @[ALU.scala 14:13 ALU.scala 17:24 ALU.scala 18:24]
  assign io_IsZero = 32'h0 == io_result; // @[ALU.scala 21:13 ALU.scala 24:24]
endmodule
