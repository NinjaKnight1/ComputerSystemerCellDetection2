;buildInfoPackage: chisel3, version: 3.3.2, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit ProgramCounter : 
  module ProgramCounter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip stop : UInt<1>, flip jump : UInt<1>, flip run : UInt<1>, flip programCounterJump : UInt<16>, programCounter : UInt<16>}
    
    node notRun = eq(io.run, UInt<1>("h00")) @[ProgramCounter.scala 14:16]
    node notRunOrStop = or(notRun, io.stop) @[ProgramCounter.scala 15:29]
    node _T = add(io.programCounter, UInt<1>("h01")) @[ProgramCounter.scala 17:43]
    node programCounter1 = tail(_T, 1) @[ProgramCounter.scala 17:43]
    node result1 = mux(io.jump, programCounter1, io.programCounterJump) @[ProgramCounter.scala 19:20]
    node result2 = mux(notRunOrStop, result1, io.programCounter) @[ProgramCounter.scala 21:20]
    reg reg1 : UInt<16>, clock with : (reset => (reset, UInt<16>("h00"))) @[ProgramCounter.scala 22:21]
    reg1 <= result2 @[ProgramCounter.scala 23:8]
    io.programCounter <= reg1 @[ProgramCounter.scala 24:21]
    
