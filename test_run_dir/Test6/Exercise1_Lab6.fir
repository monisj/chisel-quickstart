;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Exercise1_Lab6 : 
  module Exercise1_Lab6 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<4>, out : UInt<1>}
    
    reg state : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[Exercise1_Lab6.scala 22:24]
    reg load : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[Exercise1_Lab6.scala 23:23]
    io.out <= UInt<1>("h00") @[Exercise1_Lab6.scala 24:11]
    node _T = eq(load, UInt<1>("h00")) @[Exercise1_Lab6.scala 25:15]
    when _T : @[Exercise1_Lab6.scala 25:23]
      node _load_T = add(load, UInt<1>("h01")) @[Exercise1_Lab6.scala 26:19]
      node _load_T_1 = tail(_load_T, 1) @[Exercise1_Lab6.scala 26:19]
      load <= _load_T_1 @[Exercise1_Lab6.scala 26:13]
      state <= io.in @[Exercise1_Lab6.scala 27:14]
      skip @[Exercise1_Lab6.scala 25:23]
    else : @[Exercise1_Lab6.scala 28:16]
      node _state_T = shr(state, 1) @[Exercise1_Lab6.scala 29:23]
      state <= _state_T @[Exercise1_Lab6.scala 29:14]
      node _io_out_T = bits(state, 0, 0) @[Exercise1_Lab6.scala 30:22]
      io.out <= _io_out_T @[Exercise1_Lab6.scala 30:15]
      skip @[Exercise1_Lab6.scala 28:16]
    
