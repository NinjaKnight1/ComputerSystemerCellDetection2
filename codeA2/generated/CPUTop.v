module ProgramCounter(
  input         clock,
  input         reset,
  input         io_stop,
  input         io_jump,
  input         io_run,
  input  [15:0] io_programCounterJump,
  output [15:0] io_programCounter
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  notRun = ~io_run; // @[ProgramCounter.scala 14:16]
  wire  notRunOrStop = notRun | io_stop; // @[ProgramCounter.scala 15:29]
  wire [15:0] programCounter1 = io_programCounter + 16'h1; // @[ProgramCounter.scala 17:43]
  reg [15:0] reg1; // @[ProgramCounter.scala 22:21]
  assign io_programCounter = reg1; // @[ProgramCounter.scala 24:21]
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
  reg1 = _RAND_0[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      reg1 <= 16'h0;
    end else if (notRunOrStop) begin
      reg1 <= io_programCounter;
    end else if (io_jump) begin
      reg1 <= io_programCounterJump;
    end else begin
      reg1 <= programCounter1;
    end
  end
endmodule
module DataMemory(
  input         clock,
  input  [15:0] io_address,
  output [31:0] io_dataRead,
  input         io_writeEnable,
  input  [31:0] io_dataWrite,
  input         io_testerEnable,
  input  [15:0] io_testerAddress,
  output [31:0] io_testerDataRead,
  input         io_testerWriteEnable,
  input  [31:0] io_testerDataWrite
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [31:0] memory [0:65535]; // @[DataMemory.scala 18:20]
  wire [31:0] memory__T_data; // @[DataMemory.scala 18:20]
  wire [15:0] memory__T_addr; // @[DataMemory.scala 18:20]
  wire [31:0] memory__T_2_data; // @[DataMemory.scala 18:20]
  wire [15:0] memory__T_2_addr; // @[DataMemory.scala 18:20]
  wire [31:0] memory__T_1_data; // @[DataMemory.scala 18:20]
  wire [15:0] memory__T_1_addr; // @[DataMemory.scala 18:20]
  wire  memory__T_1_mask; // @[DataMemory.scala 18:20]
  wire  memory__T_1_en; // @[DataMemory.scala 18:20]
  wire [31:0] memory__T_3_data; // @[DataMemory.scala 18:20]
  wire [15:0] memory__T_3_addr; // @[DataMemory.scala 18:20]
  wire  memory__T_3_mask; // @[DataMemory.scala 18:20]
  wire  memory__T_3_en; // @[DataMemory.scala 18:20]
  wire [31:0] _GEN_5 = io_testerWriteEnable ? io_testerDataWrite : memory__T_data; // @[DataMemory.scala 24:32]
  wire [31:0] _GEN_11 = io_writeEnable ? io_dataWrite : memory__T_2_data; // @[DataMemory.scala 32:26]
  assign memory__T_addr = io_testerAddress;
  assign memory__T_data = memory[memory__T_addr]; // @[DataMemory.scala 18:20]
  assign memory__T_2_addr = io_address;
  assign memory__T_2_data = memory[memory__T_2_addr]; // @[DataMemory.scala 18:20]
  assign memory__T_1_data = io_testerDataWrite;
  assign memory__T_1_addr = io_testerAddress;
  assign memory__T_1_mask = 1'h1;
  assign memory__T_1_en = io_testerEnable & io_testerWriteEnable;
  assign memory__T_3_data = io_dataWrite;
  assign memory__T_3_addr = io_address;
  assign memory__T_3_mask = 1'h1;
  assign memory__T_3_en = io_testerEnable ? 1'h0 : io_writeEnable;
  assign io_dataRead = io_testerEnable ? 32'h0 : _GEN_11; // @[DataMemory.scala 23:17 DataMemory.scala 30:17 DataMemory.scala 34:19]
  assign io_testerDataRead = io_testerEnable ? _GEN_5 : 32'h0; // @[DataMemory.scala 22:23 DataMemory.scala 26:25 DataMemory.scala 31:23]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 65536; initvar = initvar+1)
    memory[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(memory__T_1_en & memory__T_1_mask) begin
      memory[memory__T_1_addr] <= memory__T_1_data; // @[DataMemory.scala 18:20]
    end
    if(memory__T_3_en & memory__T_3_mask) begin
      memory[memory__T_3_addr] <= memory__T_3_data; // @[DataMemory.scala 18:20]
    end
  end
endmodule
module ProgramMemory(
  input         clock,
  input  [15:0] io_address,
  output [31:0] io_instructionRead,
  input         io_testerEnable,
  input  [15:0] io_testerAddress,
  output [31:0] io_testerDataRead,
  input         io_testerWriteEnable,
  input  [31:0] io_testerDataWrite
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [31:0] memory [0:65535]; // @[ProgramMemory.scala 16:20]
  wire [31:0] memory__T_data; // @[ProgramMemory.scala 16:20]
  wire [15:0] memory__T_addr; // @[ProgramMemory.scala 16:20]
  wire [31:0] memory__T_2_data; // @[ProgramMemory.scala 16:20]
  wire [15:0] memory__T_2_addr; // @[ProgramMemory.scala 16:20]
  wire [31:0] memory__T_1_data; // @[ProgramMemory.scala 16:20]
  wire [15:0] memory__T_1_addr; // @[ProgramMemory.scala 16:20]
  wire  memory__T_1_mask; // @[ProgramMemory.scala 16:20]
  wire  memory__T_1_en; // @[ProgramMemory.scala 16:20]
  wire [31:0] _GEN_5 = io_testerWriteEnable ? io_testerDataWrite : memory__T_data; // @[ProgramMemory.scala 22:32]
  assign memory__T_addr = io_testerAddress;
  assign memory__T_data = memory[memory__T_addr]; // @[ProgramMemory.scala 16:20]
  assign memory__T_2_addr = io_address;
  assign memory__T_2_data = memory[memory__T_2_addr]; // @[ProgramMemory.scala 16:20]
  assign memory__T_1_data = io_testerDataWrite;
  assign memory__T_1_addr = io_testerAddress;
  assign memory__T_1_mask = 1'h1;
  assign memory__T_1_en = io_testerEnable & io_testerWriteEnable;
  assign io_instructionRead = io_testerEnable ? 32'h0 : memory__T_2_data; // @[ProgramMemory.scala 21:24 ProgramMemory.scala 28:24]
  assign io_testerDataRead = io_testerEnable ? _GEN_5 : 32'h0; // @[ProgramMemory.scala 20:23 ProgramMemory.scala 24:25 ProgramMemory.scala 29:23]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 65536; initvar = initvar+1)
    memory[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(memory__T_1_en & memory__T_1_mask) begin
      memory[memory__T_1_addr] <= memory__T_1_data; // @[ProgramMemory.scala 16:20]
    end
  end
endmodule
module RegisterFile(
  input         clock,
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
module ControlUnit(
  input  [5:0] io_opCode,
  output       io_isIm,
  output       io_ALUopr,
  output       io_isImALU,
  output       io_branchCond,
  output       io_regChange,
  output       io_branch,
  output       io_END,
  output       io_memWriteEnable,
  output       io_fromMem,
  output       io_regWriteEnable
);
  wire [1:0] im = {io_opCode[0],io_opCode[1]}; // @[Cat.scala 29:58]
  wire [1:0] cat = {io_opCode[2],io_opCode[3]}; // @[Cat.scala 29:58]
  wire [1:0] op = {io_opCode[4],io_opCode[5]}; // @[Cat.scala 29:58]
  wire  _T_6 = 2'h0 == im; // @[Conditional.scala 37:30]
  wire  _T_7 = 2'h1 == im; // @[Conditional.scala 37:30]
  wire  _T_8 = 2'h1 == cat; // @[Conditional.scala 37:30]
  wire  _T_9 = 2'h1 == op; // @[Conditional.scala 37:30]
  wire  _T_10 = 2'h2 == op; // @[Conditional.scala 37:30]
  wire  _GEN_1 = _T_9 ? 1'h0 : _T_10; // @[Conditional.scala 40:58]
  wire  _T_11 = 2'h2 == cat; // @[Conditional.scala 37:30]
  wire  _GEN_6 = _T_11 & _T_9; // @[Conditional.scala 39:67]
  wire  _GEN_7 = _T_11 & _GEN_1; // @[Conditional.scala 39:67]
  wire  _GEN_8 = _T_8 | _GEN_6; // @[Conditional.scala 40:58]
  wire  _GEN_9 = _T_8 & _GEN_1; // @[Conditional.scala 40:58]
  wire  _GEN_10 = _T_8 ? 1'h0 : _T_11; // @[Conditional.scala 40:58]
  wire  _GEN_11 = _T_8 ? 1'h0 : _GEN_6; // @[Conditional.scala 40:58]
  wire  _GEN_12 = _T_8 ? 1'h0 : _GEN_7; // @[Conditional.scala 40:58]
  wire  _T_14 = 2'h2 == im; // @[Conditional.scala 37:30]
  wire  _GEN_17 = _T_8 | _T_11; // @[Conditional.scala 40:58]
  wire  _T_19 = 2'h3 == im; // @[Conditional.scala 37:30]
  wire  _T_22 = 2'h3 == op; // @[Conditional.scala 37:30]
  wire  _GEN_22 = _T_10 ? 1'h0 : _T_22; // @[Conditional.scala 39:67]
  wire  _GEN_25 = _T_9 ? 1'h0 : _GEN_22; // @[Conditional.scala 40:58]
  wire  _GEN_26 = _T_19 & _T_9; // @[Conditional.scala 39:67]
  wire  _GEN_27 = _T_19 & _GEN_1; // @[Conditional.scala 39:67]
  wire  _GEN_28 = _T_19 & _GEN_25; // @[Conditional.scala 39:67]
  wire  _GEN_29 = _T_14 & _T_8; // @[Conditional.scala 39:67]
  wire  _GEN_30 = _T_14 & _GEN_17; // @[Conditional.scala 39:67]
  wire  _GEN_31 = _T_14 & _GEN_9; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_14 & _GEN_10; // @[Conditional.scala 39:67]
  wire  _GEN_33 = _T_14 ? 1'h0 : _GEN_26; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_14 ? 1'h0 : _GEN_27; // @[Conditional.scala 39:67]
  wire  _GEN_35 = _T_14 ? 1'h0 : _GEN_28; // @[Conditional.scala 39:67]
  wire  _GEN_36 = _T_7 ? _GEN_8 : _GEN_30; // @[Conditional.scala 39:67]
  wire  _GEN_37 = _T_7 ? _GEN_9 : _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_7 ? _GEN_10 : _GEN_34; // @[Conditional.scala 39:67]
  wire  _GEN_39 = _T_7 & _GEN_11; // @[Conditional.scala 39:67]
  wire  _GEN_40 = _T_7 & _GEN_12; // @[Conditional.scala 39:67]
  wire  _GEN_41 = _T_7 ? 1'h0 : _GEN_29; // @[Conditional.scala 39:67]
  wire  _GEN_42 = _T_7 ? 1'h0 : _GEN_32; // @[Conditional.scala 39:67]
  wire  _GEN_43 = _T_7 ? 1'h0 : _GEN_33; // @[Conditional.scala 39:67]
  wire  _GEN_44 = _T_7 ? 1'h0 : _GEN_34; // @[Conditional.scala 39:67]
  wire  _GEN_45 = _T_7 ? 1'h0 : _GEN_35; // @[Conditional.scala 39:67]
  assign io_isIm = _T_6 ? 1'h0 : _GEN_42; // @[ControlUnit.scala 27:11 ControlUnit.scala 95:19]
  assign io_ALUopr = _T_6 ? 1'h0 : _GEN_37; // @[ControlUnit.scala 28:13 ControlUnit.scala 49:25 ControlUnit.scala 53:25 ControlUnit.scala 84:25 ControlUnit.scala 88:25]
  assign io_isImALU = _T_6 ? 1'h0 : _GEN_41; // @[ControlUnit.scala 29:14 ControlUnit.scala 79:22]
  assign io_branchCond = _T_6 ? 1'h0 : _GEN_44; // @[ControlUnit.scala 30:17 ControlUnit.scala 108:25]
  assign io_regChange = _T_6 ? 1'h0 : _GEN_38; // @[ControlUnit.scala 31:16 ControlUnit.scala 59:24 ControlUnit.scala 107:24]
  assign io_branch = _T_6 ? 1'h0 : _GEN_43; // @[ControlUnit.scala 32:13 ControlUnit.scala 103:21]
  assign io_END = _T_6 ? 1'h0 : _GEN_45; // @[ControlUnit.scala 33:10 ControlUnit.scala 112:18]
  assign io_memWriteEnable = _T_6 ? 1'h0 : _GEN_40; // @[ControlUnit.scala 34:21 ControlUnit.scala 68:33]
  assign io_fromMem = _T_6 ? 1'h0 : _GEN_39; // @[ControlUnit.scala 35:14 ControlUnit.scala 64:26]
  assign io_regWriteEnable = _T_6 ? 1'h0 : _GEN_36; // @[ControlUnit.scala 36:21 ControlUnit.scala 45:29 ControlUnit.scala 63:33 ControlUnit.scala 80:29 ControlUnit.scala 94:29]
endmodule
module ALU(
  input  [31:0] io_op1,
  input  [31:0] io_op2,
  input         io_sel,
  output [31:0] io_result,
  output        io_isZero
);
  wire  _T = ~io_sel; // @[Conditional.scala 37:30]
  wire [31:0] _T_2 = io_op1 + io_op2; // @[ALU.scala 18:34]
  wire [31:0] _T_5 = io_op1 - io_op2; // @[ALU.scala 19:34]
  wire [31:0] _GEN_0 = io_sel ? _T_5 : 32'h0; // @[Conditional.scala 39:67]
  assign io_result = _T ? _T_2 : _GEN_0; // @[ALU.scala 15:13 ALU.scala 18:24 ALU.scala 19:24]
  assign io_isZero = io_result == 32'h0; // @[ALU.scala 22:13 ALU.scala 25:15]
endmodule
module CPUTop(
  input         clock,
  input         reset,
  output        io_done,
  input         io_run,
  input         io_testerDataMemEnable,
  input  [15:0] io_testerDataMemAddress,
  output [31:0] io_testerDataMemDataRead,
  input         io_testerDataMemWriteEnable,
  input  [31:0] io_testerDataMemDataWrite,
  input         io_testerProgMemEnable,
  input  [15:0] io_testerProgMemAddress,
  output [31:0] io_testerProgMemDataRead,
  input         io_testerProgMemWriteEnable,
  input  [31:0] io_testerProgMemDataWrite
);
  wire  programCounter_clock; // @[CPUTop.scala 23:30]
  wire  programCounter_reset; // @[CPUTop.scala 23:30]
  wire  programCounter_io_stop; // @[CPUTop.scala 23:30]
  wire  programCounter_io_jump; // @[CPUTop.scala 23:30]
  wire  programCounter_io_run; // @[CPUTop.scala 23:30]
  wire [15:0] programCounter_io_programCounterJump; // @[CPUTop.scala 23:30]
  wire [15:0] programCounter_io_programCounter; // @[CPUTop.scala 23:30]
  wire  dataMemory_clock; // @[CPUTop.scala 24:26]
  wire [15:0] dataMemory_io_address; // @[CPUTop.scala 24:26]
  wire [31:0] dataMemory_io_dataRead; // @[CPUTop.scala 24:26]
  wire  dataMemory_io_writeEnable; // @[CPUTop.scala 24:26]
  wire [31:0] dataMemory_io_dataWrite; // @[CPUTop.scala 24:26]
  wire  dataMemory_io_testerEnable; // @[CPUTop.scala 24:26]
  wire [15:0] dataMemory_io_testerAddress; // @[CPUTop.scala 24:26]
  wire [31:0] dataMemory_io_testerDataRead; // @[CPUTop.scala 24:26]
  wire  dataMemory_io_testerWriteEnable; // @[CPUTop.scala 24:26]
  wire [31:0] dataMemory_io_testerDataWrite; // @[CPUTop.scala 24:26]
  wire  programMemory_clock; // @[CPUTop.scala 25:29]
  wire [15:0] programMemory_io_address; // @[CPUTop.scala 25:29]
  wire [31:0] programMemory_io_instructionRead; // @[CPUTop.scala 25:29]
  wire  programMemory_io_testerEnable; // @[CPUTop.scala 25:29]
  wire [15:0] programMemory_io_testerAddress; // @[CPUTop.scala 25:29]
  wire [31:0] programMemory_io_testerDataRead; // @[CPUTop.scala 25:29]
  wire  programMemory_io_testerWriteEnable; // @[CPUTop.scala 25:29]
  wire [31:0] programMemory_io_testerDataWrite; // @[CPUTop.scala 25:29]
  wire  registerFile_clock; // @[CPUTop.scala 26:28]
  wire [2:0] registerFile_io_aSel; // @[CPUTop.scala 26:28]
  wire [2:0] registerFile_io_bSel; // @[CPUTop.scala 26:28]
  wire [31:0] registerFile_io_writeData; // @[CPUTop.scala 26:28]
  wire [2:0] registerFile_io_writeSel; // @[CPUTop.scala 26:28]
  wire  registerFile_io_writeEnable; // @[CPUTop.scala 26:28]
  wire [31:0] registerFile_io_a; // @[CPUTop.scala 26:28]
  wire [31:0] registerFile_io_b; // @[CPUTop.scala 26:28]
  wire [5:0] controlUnit_io_opCode; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_isIm; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_ALUopr; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_isImALU; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_branchCond; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_regChange; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_branch; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_END; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_memWriteEnable; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_fromMem; // @[CPUTop.scala 27:27]
  wire  controlUnit_io_regWriteEnable; // @[CPUTop.scala 27:27]
  wire [31:0] alu_io_op1; // @[CPUTop.scala 28:19]
  wire [31:0] alu_io_op2; // @[CPUTop.scala 28:19]
  wire  alu_io_sel; // @[CPUTop.scala 28:19]
  wire [31:0] alu_io_result; // @[CPUTop.scala 28:19]
  wire  alu_io_isZero; // @[CPUTop.scala 28:19]
  wire [4:0] bSelResult = controlUnit_io_regChange ? programMemory_io_instructionRead[25:21] : programMemory_io_instructionRead[19:15]; // @[CPUTop.scala 44:23]
  wire [31:0] memOrALU = controlUnit_io_fromMem ? dataMemory_io_dataRead : alu_io_result; // @[CPUTop.scala 47:21]
  wire  eqJump = controlUnit_io_branchCond & alu_io_isZero; // @[CPUTop.scala 67:42]
  ProgramCounter programCounter ( // @[CPUTop.scala 23:30]
    .clock(programCounter_clock),
    .reset(programCounter_reset),
    .io_stop(programCounter_io_stop),
    .io_jump(programCounter_io_jump),
    .io_run(programCounter_io_run),
    .io_programCounterJump(programCounter_io_programCounterJump),
    .io_programCounter(programCounter_io_programCounter)
  );
  DataMemory dataMemory ( // @[CPUTop.scala 24:26]
    .clock(dataMemory_clock),
    .io_address(dataMemory_io_address),
    .io_dataRead(dataMemory_io_dataRead),
    .io_writeEnable(dataMemory_io_writeEnable),
    .io_dataWrite(dataMemory_io_dataWrite),
    .io_testerEnable(dataMemory_io_testerEnable),
    .io_testerAddress(dataMemory_io_testerAddress),
    .io_testerDataRead(dataMemory_io_testerDataRead),
    .io_testerWriteEnable(dataMemory_io_testerWriteEnable),
    .io_testerDataWrite(dataMemory_io_testerDataWrite)
  );
  ProgramMemory programMemory ( // @[CPUTop.scala 25:29]
    .clock(programMemory_clock),
    .io_address(programMemory_io_address),
    .io_instructionRead(programMemory_io_instructionRead),
    .io_testerEnable(programMemory_io_testerEnable),
    .io_testerAddress(programMemory_io_testerAddress),
    .io_testerDataRead(programMemory_io_testerDataRead),
    .io_testerWriteEnable(programMemory_io_testerWriteEnable),
    .io_testerDataWrite(programMemory_io_testerDataWrite)
  );
  RegisterFile registerFile ( // @[CPUTop.scala 26:28]
    .clock(registerFile_clock),
    .io_aSel(registerFile_io_aSel),
    .io_bSel(registerFile_io_bSel),
    .io_writeData(registerFile_io_writeData),
    .io_writeSel(registerFile_io_writeSel),
    .io_writeEnable(registerFile_io_writeEnable),
    .io_a(registerFile_io_a),
    .io_b(registerFile_io_b)
  );
  ControlUnit controlUnit ( // @[CPUTop.scala 27:27]
    .io_opCode(controlUnit_io_opCode),
    .io_isIm(controlUnit_io_isIm),
    .io_ALUopr(controlUnit_io_ALUopr),
    .io_isImALU(controlUnit_io_isImALU),
    .io_branchCond(controlUnit_io_branchCond),
    .io_regChange(controlUnit_io_regChange),
    .io_branch(controlUnit_io_branch),
    .io_END(controlUnit_io_END),
    .io_memWriteEnable(controlUnit_io_memWriteEnable),
    .io_fromMem(controlUnit_io_fromMem),
    .io_regWriteEnable(controlUnit_io_regWriteEnable)
  );
  ALU alu ( // @[CPUTop.scala 28:19]
    .io_op1(alu_io_op1),
    .io_op2(alu_io_op2),
    .io_sel(alu_io_sel),
    .io_result(alu_io_result),
    .io_isZero(alu_io_isZero)
  );
  assign io_done = controlUnit_io_END; // @[CPUTop.scala 79:11]
  assign io_testerDataMemDataRead = dataMemory_io_testerDataRead; // @[CPUTop.scala 90:28]
  assign io_testerProgMemDataRead = programMemory_io_testerDataRead; // @[CPUTop.scala 84:28]
  assign programCounter_clock = clock;
  assign programCounter_reset = reset;
  assign programCounter_io_stop = controlUnit_io_END; // @[CPUTop.scala 73:26]
  assign programCounter_io_jump = eqJump | controlUnit_io_branch; // @[CPUTop.scala 71:26]
  assign programCounter_io_run = io_run; // @[CPUTop.scala 31:25 CPUTop.scala 75:25]
  assign programCounter_io_programCounterJump = programMemory_io_instructionRead[15:0]; // @[CPUTop.scala 77:40]
  assign dataMemory_clock = clock;
  assign dataMemory_io_address = registerFile_io_a[15:0]; // @[CPUTop.scala 63:25]
  assign dataMemory_io_writeEnable = controlUnit_io_memWriteEnable; // @[CPUTop.scala 61:29]
  assign dataMemory_io_dataWrite = registerFile_io_b; // @[CPUTop.scala 64:27]
  assign dataMemory_io_testerEnable = io_testerDataMemEnable; // @[CPUTop.scala 92:30]
  assign dataMemory_io_testerAddress = io_testerDataMemAddress; // @[CPUTop.scala 89:31]
  assign dataMemory_io_testerWriteEnable = io_testerDataMemWriteEnable; // @[CPUTop.scala 93:35]
  assign dataMemory_io_testerDataWrite = io_testerDataMemDataWrite; // @[CPUTop.scala 91:33]
  assign programMemory_clock = clock;
  assign programMemory_io_address = programCounter_io_programCounter; // @[CPUTop.scala 32:28]
  assign programMemory_io_testerEnable = io_testerProgMemEnable; // @[CPUTop.scala 86:33]
  assign programMemory_io_testerAddress = io_testerProgMemAddress; // @[CPUTop.scala 83:34]
  assign programMemory_io_testerWriteEnable = io_testerProgMemWriteEnable; // @[CPUTop.scala 87:38]
  assign programMemory_io_testerDataWrite = io_testerProgMemDataWrite; // @[CPUTop.scala 85:36]
  assign registerFile_clock = clock;
  assign registerFile_io_aSel = programMemory_io_instructionRead[18:16]; // @[CPUTop.scala 42:24]
  assign registerFile_io_bSel = bSelResult[2:0]; // @[CPUTop.scala 45:24]
  assign registerFile_io_writeData = controlUnit_io_isIm ? {{16'd0}, programMemory_io_instructionRead[15:0]} : memOrALU; // @[CPUTop.scala 50:29]
  assign registerFile_io_writeSel = programMemory_io_instructionRead[23:21]; // @[CPUTop.scala 41:28]
  assign registerFile_io_writeEnable = controlUnit_io_regWriteEnable; // @[CPUTop.scala 40:31]
  assign controlUnit_io_opCode = programMemory_io_instructionRead[31:26]; // @[CPUTop.scala 37:25]
  assign alu_io_op1 = registerFile_io_a; // @[CPUTop.scala 55:14]
  assign alu_io_op2 = controlUnit_io_isImALU ? {{16'd0}, programMemory_io_instructionRead[15:0]} : registerFile_io_b; // @[CPUTop.scala 58:14]
  assign alu_io_sel = controlUnit_io_ALUopr; // @[CPUTop.scala 53:14]
endmodule
