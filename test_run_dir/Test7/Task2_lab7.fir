;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Task2_lab7 : 
  module Task2_lab7 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<1>, flip start : UInt<1>, out : UInt<8>, flag : UInt<1>}
    
    reg outReg : UInt<8>, clock with : (reset => (reset, UInt<8>("h00"))) @[Task2_lab7.scala 16:25]
    io.flag <= UInt<1>("h00") @[Task2_lab7.scala 17:13]
    io.out <= outReg @[Task2_lab7.scala 18:12]
    node _T = eq(UInt<1>("h00"), io.start) @[Conditional.scala 37:30]
    when _T : @[Conditional.scala 40:58]
      io.out <= UInt<1>("h00") @[Task2_lab7.scala 22:20]
      io.flag <= UInt<1>("h00") @[Task2_lab7.scala 23:21]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_1 = eq(UInt<1>("h01"), io.start) @[Conditional.scala 37:30]
      when _T_1 : @[Conditional.scala 39:67]
        node _outReg_T = shl(outReg, 1) @[Task2_lab7.scala 26:30]
        node _outReg_T_1 = or(_outReg_T, io.in) @[Task2_lab7.scala 26:35]
        outReg <= _outReg_T_1 @[Task2_lab7.scala 26:20]
        io.out <= outReg @[Task2_lab7.scala 27:20]
        io.flag <= UInt<1>("h01") @[Task2_lab7.scala 28:21]
        skip @[Conditional.scala 39:67]
    
