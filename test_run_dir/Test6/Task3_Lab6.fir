;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Task3_Lab6 : 
  module Task3_Lab6 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<2>[2], flip load : UInt<1>, out : UInt<2>[2]}
    
    reg state : UInt<2>, clock with : (reset => (reset, UInt<2>("h00"))) @[Task3_Lab6.scala 23:24]
    reg load : UInt<2>, clock with : (reset => (reset, UInt<2>("h00"))) @[Task3_Lab6.scala 24:23]
    io.out[0] <= UInt<1>("h00") @[Task3_Lab6.scala 26:18]
    io.out[1] <= UInt<1>("h00") @[Task3_Lab6.scala 26:18]
    node _T = eq(io.load, UInt<1>("h00")) @[Task3_Lab6.scala 28:18]
    when _T : @[Task3_Lab6.scala 28:26]
      node _load_T = add(load, UInt<1>("h01")) @[Task3_Lab6.scala 29:19]
      node _load_T_1 = tail(_load_T, 1) @[Task3_Lab6.scala 29:19]
      load <= _load_T_1 @[Task3_Lab6.scala 29:13]
      node _state_T = bits(load, 0, 0)
      state <= io.in[_state_T] @[Task3_Lab6.scala 30:14]
      skip @[Task3_Lab6.scala 28:26]
    
