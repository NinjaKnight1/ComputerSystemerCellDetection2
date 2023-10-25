;buildInfoPackage: chisel3, version: 3.3.2, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit ALU : 
  module ALU : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip op1 : UInt<32>, flip op2 : UInt<32>, flip sel : UInt<2>, result : UInt<32>, IsZero : UInt<1>}
    
    io.result <= UInt<1>("h00") @[ALU.scala 14:13]
    node _T = eq(UInt<1>("h00"), io.sel) @[Conditional.scala 37:30]
    when _T : @[Conditional.scala 40:58]
      node _T_1 = add(io.op1, io.op2) @[ALU.scala 17:34]
      node _T_2 = tail(_T_1, 1) @[ALU.scala 17:34]
      io.result <= _T_2 @[ALU.scala 17:24]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_3 = eq(UInt<1>("h01"), io.sel) @[Conditional.scala 37:30]
      when _T_3 : @[Conditional.scala 39:67]
        node _T_4 = sub(io.op1, io.op2) @[ALU.scala 18:34]
        node _T_5 = tail(_T_4, 1) @[ALU.scala 18:34]
        io.result <= _T_5 @[ALU.scala 18:24]
        skip @[Conditional.scala 39:67]
    io.IsZero <= UInt<1>("h00") @[ALU.scala 21:13]
    node _T_6 = eq(UInt<1>("h00"), io.result) @[Conditional.scala 37:30]
    when _T_6 : @[Conditional.scala 40:58]
      io.IsZero <= UInt<1>("h01") @[ALU.scala 24:24]
      skip @[Conditional.scala 40:58]
    
