circuit Task3_Lab6 :
  module Task3_Lab6 :
    input clock : Clock
    input reset : UInt<1>
    input io_load_in_0 : UInt<1>
    input io_load : UInt<1>
    output io_out_0 : UInt<1>

    reg state : UInt<4>, clock with :
      reset => (UInt<1>("h0"), state) @[Task3_Lab6.scala 14:24]
    reg load : UInt<4>, clock with :
      reset => (UInt<1>("h0"), load) @[Task3_Lab6.scala 15:23]
    node _T = eq(io_load, UInt<1>("h0")) @[Task3_Lab6.scala 17:18]
    node _load_T = add(load, UInt<1>("h1")) @[Task3_Lab6.scala 18:19]
    node _load_T_1 = tail(_load_T, 1) @[Task3_Lab6.scala 18:19]
    node _io_out_0_T = bits(state, 0, 0) @[Task3_Lab6.scala 20:25]
    node _GEN_0 = mux(_T, _load_T_1, load) @[Task3_Lab6.scala 17:26 Task3_Lab6.scala 18:13 Task3_Lab6.scala 15:23]
    node _GEN_1 = mux(_T, io_load_in_0, state) @[Task3_Lab6.scala 17:26 Task3_Lab6.scala 19:14 Task3_Lab6.scala 14:24]
    node _GEN_2 = mux(_T, _io_out_0_T, UInt<1>("h0")) @[Task3_Lab6.scala 17:26 Task3_Lab6.scala 20:18 Task3_Lab6.scala 16:14]
    io_out_0 <= _GEN_2
    state <= mux(reset, UInt<4>("h0"), _GEN_1) @[Task3_Lab6.scala 14:24 Task3_Lab6.scala 14:24]
    load <= mux(reset, UInt<4>("h0"), _GEN_0) @[Task3_Lab6.scala 15:23 Task3_Lab6.scala 15:23]
