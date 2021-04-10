;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Task2_lab7 : 
  module Task2_lab7 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<1>, flip start : UInt<1>, out : UInt<8>, flag : UInt<1>}
    
    reg register : UInt<8>, clock with : (reset => (reset, UInt<8>("h00"))) @[Task2_lab7.scala 17:27]
    io.out <= UInt<1>("h00") @[Task2_lab7.scala 18:11]
    io.flag <= UInt<1>("h00") @[Task2_lab7.scala 19:12]
    node _T = eq(UInt<1>("h01"), io.start) @[Conditional.scala 37:30]
    when _T : @[Conditional.scala 40:58]
      node _T_1 = eq(io.in, UInt<1>("h01")) @[Task2_lab7.scala 22:25]
      when _T_1 : @[Task2_lab7.scala 22:33]
        node _register_T = dshl(UInt<1>("h01"), register) @[Task2_lab7.scala 23:32]
        register <= _register_T @[Task2_lab7.scala 23:25]
        io.out <= register @[Task2_lab7.scala 24:23]
        io.flag <= UInt<1>("h01") @[Task2_lab7.scala 25:24]
        skip @[Task2_lab7.scala 22:33]
      else : @[Task2_lab7.scala 26:24]
        io.out <= register @[Task2_lab7.scala 27:23]
        io.flag <= UInt<1>("h00") @[Task2_lab7.scala 28:24]
        skip @[Task2_lab7.scala 26:24]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_2 = eq(UInt<1>("h00"), io.start) @[Conditional.scala 37:30]
      when _T_2 : @[Conditional.scala 39:67]
        io.out <= register @[Task2_lab7.scala 32:19]
        io.flag <= UInt<1>("h00") @[Task2_lab7.scala 33:20]
        skip @[Conditional.scala 39:67]
    
