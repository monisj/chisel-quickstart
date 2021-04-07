;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Task3_Lab6 : 
  module Task3_Lab6 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip load_in : UInt<1>[1], flip load : UInt<1>, out : UInt<1>[1]}
    
    reg state : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[Task3_Lab6.scala 14:24]
    reg load : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[Task3_Lab6.scala 15:23]
    io.out[0] <= UInt<1>("h00") @[Task3_Lab6.scala 16:14]
    node _T = eq(io.load, UInt<1>("h00")) @[Task3_Lab6.scala 17:18]
    when _T : @[Task3_Lab6.scala 17:26]
      node _load_T = add(load, UInt<1>("h01")) @[Task3_Lab6.scala 18:19]
      node _load_T_1 = tail(_load_T, 1) @[Task3_Lab6.scala 18:19]
      load <= _load_T_1 @[Task3_Lab6.scala 18:13]
      state <= io.load_in[UInt<1>("h00")] @[Task3_Lab6.scala 19:14]
      node _io_out_0_T = bits(state, 0, 0) @[Task3_Lab6.scala 20:25]
      io.out[0] <= _io_out_0_T @[Task3_Lab6.scala 20:18]
      skip @[Task3_Lab6.scala 17:26]
    
