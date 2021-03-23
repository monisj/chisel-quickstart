;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Exercise3 : 
  module Exercise3 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {result : UInt<1>}
    
    reg counter1 : UInt<2>, clock with : (reset => (reset, UInt<2>("h00"))) @[Exercise3.scala 10:29]
    node _counter1_T = eq(counter1, UInt<3>("h06")) @[Exercise3.scala 11:22]
    when _counter1_T : @[Exercise3.scala 11:39]
      counter1 <= UInt<1>("h00") @[Exercise3.scala 12:19]
      skip @[Exercise3.scala 11:39]
    else : @[Exercise3.scala 13:21]
      node _counter1_count_T = add(counter1, UInt<1>("h01")) @[Exercise3.scala 14:28]
      node _counter1_count_T_1 = tail(_counter1_count_T, 1) @[Exercise3.scala 14:28]
      counter1 <= _counter1_count_T_1 @[Exercise3.scala 14:19]
      skip @[Exercise3.scala 13:21]
    node _io_result_T = bits(counter1, 1, 1) @[Exercise3.scala 19:25]
    io.result <= _io_result_T @[Exercise3.scala 19:13]
    
