;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Task2 : 
  module Task2 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {result : UInt<1>}
    
    reg counter1 : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[Task2.scala 10:29]
    node _counter1_T = eq(counter1, UInt<4>("h08")) @[Task2.scala 11:22]
    when _counter1_T : @[Task2.scala 11:39]
      counter1 <= UInt<1>("h00") @[Task2.scala 12:19]
      io.result <= UInt<1>("h01") @[Task2.scala 13:23]
      skip @[Task2.scala 11:39]
    else : @[Task2.scala 14:36]
      node _counter1_T_1 = eq(counter1, UInt<1>("h00")) @[Task2.scala 14:28]
      when _counter1_T_1 : @[Task2.scala 14:36]
        node _counter1_count_T = add(counter1, UInt<1>("h01")) @[Task2.scala 15:28]
        node _counter1_count_T_1 = tail(_counter1_count_T, 1) @[Task2.scala 15:28]
        counter1 <= _counter1_count_T_1 @[Task2.scala 15:19]
        io.result <= UInt<1>("h01") @[Task2.scala 16:23]
        skip @[Task2.scala 14:36]
      else : @[Task2.scala 17:21]
        node _counter1_count_T_2 = add(counter1, UInt<1>("h01")) @[Task2.scala 18:28]
        node _counter1_count_T_3 = tail(_counter1_count_T_2, 1) @[Task2.scala 18:28]
        counter1 <= _counter1_count_T_3 @[Task2.scala 18:19]
        io.result <= UInt<1>("h00") @[Task2.scala 19:23]
        skip @[Task2.scala 17:21]
    
