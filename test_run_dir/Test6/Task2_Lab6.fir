;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Task2_Lab6 : 
  module Task2_Lab6 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<4>, out : UInt<1>}
    
    reg counter : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[Task2_Lab6.scala 13:26]
    io.out <= UInt<1>("h00") @[Task2_Lab6.scala 14:11]
    node _T = eq(counter, io.in) @[Task2_Lab6.scala 15:19]
    when _T : @[Task2_Lab6.scala 15:30]
      counter <= UInt<1>("h00") @[Task2_Lab6.scala 16:16]
      io.out <= UInt<1>("h01") @[Task2_Lab6.scala 17:15]
      skip @[Task2_Lab6.scala 15:30]
    else : @[Task2_Lab6.scala 18:16]
      node _counter_T = add(counter, UInt<1>("h01")) @[Task2_Lab6.scala 19:25]
      node _counter_T_1 = tail(_counter_T, 1) @[Task2_Lab6.scala 19:25]
      counter <= _counter_T_1 @[Task2_Lab6.scala 19:16]
      io.out <= UInt<1>("h00") @[Task2_Lab6.scala 20:15]
      skip @[Task2_Lab6.scala 18:16]
    
