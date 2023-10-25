module RegisterFile(
  input         clock,
  input         reset,
  input  [2:0]  io_aSel,
  input  [2:0]  io_bSel,
  input  [31:0] io_writeData,
  input  [2:0]  io_writeSel,
  input         io_writeEnable,
  output [31:0] io_a,
  output [31:0] io_b
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] R0; // @[RegisterFile.scala 18:15]
  reg [31:0] R1; // @[RegisterFile.scala 19:15]
  reg [31:0] R2; // @[RegisterFile.scala 20:15]
  reg [31:0] R3; // @[RegisterFile.scala 21:15]
  reg [31:0] R4; // @[RegisterFile.scala 22:15]
  reg [31:0] R5; // @[RegisterFile.scala 23:15]
  reg [31:0] R6; // @[RegisterFile.scala 24:15]
  reg [31:0] R7; // @[RegisterFile.scala 25:15]
  wire  _T = 3'h0 == io_aSel; // @[Conditional.scala 37:30]
  wire  _T_1 = 3'h1 == io_aSel; // @[Conditional.scala 37:30]
  wire  _T_2 = 3'h2 == io_aSel; // @[Conditional.scala 37:30]
  wire  _T_3 = 3'h3 == io_aSel; // @[Conditional.scala 37:30]
  wire  _T_4 = 3'h4 == io_aSel; // @[Conditional.scala 37:30]
  wire  _T_5 = 3'h5 == io_aSel; // @[Conditional.scala 37:30]
  wire  _T_6 = 3'h6 == io_aSel; // @[Conditional.scala 37:30]
  wire  _T_7 = 3'h7 == io_aSel; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_0 = _T_7 ? R7 : 32'h0; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_1 = _T_6 ? R6 : _GEN_0; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_2 = _T_5 ? R5 : _GEN_1; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_3 = _T_4 ? R4 : _GEN_2; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_4 = _T_3 ? R3 : _GEN_3; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_5 = _T_2 ? R2 : _GEN_4; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_6 = _T_1 ? R1 : _GEN_5; // @[Conditional.scala 39:67]
  wire  _T_8 = 3'h0 == io_bSel; // @[Conditional.scala 37:30]
  wire  _T_9 = 3'h1 == io_bSel; // @[Conditional.scala 37:30]
  wire  _T_10 = 3'h2 == io_bSel; // @[Conditional.scala 37:30]
  wire  _T_11 = 3'h3 == io_bSel; // @[Conditional.scala 37:30]
  wire  _T_12 = 3'h4 == io_bSel; // @[Conditional.scala 37:30]
  wire  _T_13 = 3'h5 == io_bSel; // @[Conditional.scala 37:30]
  wire  _T_14 = 3'h6 == io_bSel; // @[Conditional.scala 37:30]
  wire  _T_15 = 3'h7 == io_bSel; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_8 = _T_15 ? R7 : 32'h0; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_9 = _T_14 ? R6 : _GEN_8; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_10 = _T_13 ? R5 : _GEN_9; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_11 = _T_12 ? R4 : _GEN_10; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_12 = _T_11 ? R3 : _GEN_11; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_13 = _T_10 ? R2 : _GEN_12; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_14 = _T_9 ? R1 : _GEN_13; // @[Conditional.scala 39:67]
  wire  _T_17 = 3'h0 == io_writeSel; // @[Conditional.scala 37:30]
  wire  _T_18 = 3'h1 == io_writeSel; // @[Conditional.scala 37:30]
  wire  _T_19 = 3'h2 == io_writeSel; // @[Conditional.scala 37:30]
  wire  _T_20 = 3'h3 == io_writeSel; // @[Conditional.scala 37:30]
  wire  _T_21 = 3'h4 == io_writeSel; // @[Conditional.scala 37:30]
  wire  _T_22 = 3'h5 == io_writeSel; // @[Conditional.scala 37:30]
  wire  _T_23 = 3'h6 == io_writeSel; // @[Conditional.scala 37:30]
  wire  _T_24 = 3'h7 == io_writeSel; // @[Conditional.scala 37:30]
  assign io_a = _T ? R0 : _GEN_6; // @[RegisterFile.scala 27:8 RegisterFile.scala 30:20 RegisterFile.scala 31:20 RegisterFile.scala 32:20 RegisterFile.scala 33:20 RegisterFile.scala 34:20 RegisterFile.scala 35:20 RegisterFile.scala 36:20 RegisterFile.scala 37:20]
  assign io_b = _T_8 ? R0 : _GEN_14; // @[RegisterFile.scala 40:8 RegisterFile.scala 43:20 RegisterFile.scala 44:20 RegisterFile.scala 45:20 RegisterFile.scala 46:20 RegisterFile.scala 47:20 RegisterFile.scala 48:20 RegisterFile.scala 49:20 RegisterFile.scala 50:20]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  R0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  R1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  R2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  R3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  R4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  R5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  R6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  R7 = _RAND_7[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (io_writeEnable) begin
      if (_T_17) begin
        R0 <= io_writeData;
      end
    end
    if (io_writeEnable) begin
      if (!(_T_17)) begin
        if (_T_18) begin
          R1 <= io_writeData;
        end
      end
    end
    if (io_writeEnable) begin
      if (!(_T_17)) begin
        if (!(_T_18)) begin
          if (_T_19) begin
            R2 <= io_writeData;
          end
        end
      end
    end
    if (io_writeEnable) begin
      if (!(_T_17)) begin
        if (!(_T_18)) begin
          if (!(_T_19)) begin
            if (_T_20) begin
              R3 <= io_writeData;
            end
          end
        end
      end
    end
    if (io_writeEnable) begin
      if (!(_T_17)) begin
        if (!(_T_18)) begin
          if (!(_T_19)) begin
            if (!(_T_20)) begin
              if (_T_21) begin
                R4 <= io_writeData;
              end
            end
          end
        end
      end
    end
    if (io_writeEnable) begin
      if (!(_T_17)) begin
        if (!(_T_18)) begin
          if (!(_T_19)) begin
            if (!(_T_20)) begin
              if (!(_T_21)) begin
                if (_T_22) begin
                  R5 <= io_writeData;
                end
              end
            end
          end
        end
      end
    end
    if (io_writeEnable) begin
      if (!(_T_17)) begin
        if (!(_T_18)) begin
          if (!(_T_19)) begin
            if (!(_T_20)) begin
              if (!(_T_21)) begin
                if (!(_T_22)) begin
                  if (_T_23) begin
                    R6 <= io_writeData;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (io_writeEnable) begin
      if (!(_T_17)) begin
        if (!(_T_18)) begin
          if (!(_T_19)) begin
            if (!(_T_20)) begin
              if (!(_T_21)) begin
                if (!(_T_22)) begin
                  if (!(_T_23)) begin
                    if (_T_24) begin
                      R7 <= io_writeData;
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
endmodule
