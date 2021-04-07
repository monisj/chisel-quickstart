;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Task3_Lab6 : 
  module Task3_Lab6 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<4>, flip load : UInt<1>, out_Parallel : UInt<4>, out_Serial : UInt<1>}
    
    reg state : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[Task3_Lab6.scala 24:24]
    reg load : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[Task3_Lab6.scala 25:23]
    io.out_Parallel <= UInt<1>("h00") @[Task3_Lab6.scala 26:20]
    io.out_Serial <= UInt<1>("h00") @[Task3_Lab6.scala 27:18]
    node _T = eq(io.load, UInt<1>("h01")) @[Task3_Lab6.scala 28:18]
    when _T : @[Task3_Lab6.scala 28:26]
      node _T_1 = eq(load, UInt<1>("h00")) @[Task3_Lab6.scala 29:15]
      when _T_1 : @[Task3_Lab6.scala 29:23]
        node _load_T = add(load, UInt<1>("h01")) @[Task3_Lab6.scala 30:19]
        node _load_T_1 = tail(_load_T, 1) @[Task3_Lab6.scala 30:19]
        load <= _load_T_1 @[Task3_Lab6.scala 30:13]
        state <= io.in @[Task3_Lab6.scala 31:14]
        skip @[Task3_Lab6.scala 29:23]
      else : @[Task3_Lab6.scala 32:16]
        node _state_T = shr(state, 1) @[Task3_Lab6.scala 33:23]
        state <= _state_T @[Task3_Lab6.scala 33:14]
        node _io_out_Serial_T = bits(state, 0, 0) @[Task3_Lab6.scala 34:29]
        io.out_Serial <= _io_out_Serial_T @[Task3_Lab6.scala 34:22]
        skip @[Task3_Lab6.scala 32:16]
      skip @[Task3_Lab6.scala 28:26]
    else : @[Task3_Lab6.scala 36:32]
      node _T_2 = eq(io.load, UInt<1>("h00")) @[Task3_Lab6.scala 36:24]
      when _T_2 : @[Task3_Lab6.scala 36:32]
        node _T_3 = eq(load, UInt<1>("h00")) @[Task3_Lab6.scala 37:19]
        when _T_3 : @[Task3_Lab6.scala 37:27]
          node _load_T_2 = add(load, UInt<1>("h01")) @[Task3_Lab6.scala 38:19]
          node _load_T_3 = tail(_load_T_2, 1) @[Task3_Lab6.scala 38:19]
          load <= _load_T_3 @[Task3_Lab6.scala 38:13]
          state <= io.in @[Task3_Lab6.scala 39:14]
          skip @[Task3_Lab6.scala 37:27]
        io.out_Parallel <= state @[Task3_Lab6.scala 41:24]
        skip @[Task3_Lab6.scala 36:32]
    
