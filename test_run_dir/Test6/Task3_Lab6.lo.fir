circuit Task3_Lab6 :
  module Task3_Lab6 :
    input clock : Clock
    input reset : UInt<1>
    input io_in_0 : UInt<2>
    input io_in_1 : UInt<2>
    input io_load : UInt<1>
    output io_out_0 : UInt<2>
    output io_out_1 : UInt<2>

    reg state : UInt<2>, clock with :
      reset => (UInt<1>("h0"), state) @[Task3_Lab6.scala 23:24]
    reg load : UInt<2>, clock with :
      reset => (UInt<1>("h0"), load) @[Task3_Lab6.scala 24:23]
    node _T = eq(io_load, UInt<1>("h0")) @[Task3_Lab6.scala 28:18]
    node _load_T = add(load, UInt<1>("h1")) @[Task3_Lab6.scala 29:19]
    node _load_T_1 = tail(_load_T, 1) @[Task3_Lab6.scala 29:19]
    node _state_T = bits(load, 0, 0)
    node _GEN_0 = validif(eq(UInt<1>("h0"), _state_T), io_in_0) @[Task3_Lab6.scala 30:14 Task3_Lab6.scala 30:14]
    node _GEN_1 = mux(eq(UInt<1>("h1"), _state_T), io_in_1, _GEN_0) @[Task3_Lab6.scala 30:14 Task3_Lab6.scala 30:14]
    node _GEN_2 = mux(_T, _load_T_1, load) @[Task3_Lab6.scala 28:26 Task3_Lab6.scala 29:13 Task3_Lab6.scala 24:23]
    node _io_in_state_T = _GEN_1 @[Task3_Lab6.scala 30:14]
    node _GEN_3 = mux(_T, _io_in_state_T, state) @[Task3_Lab6.scala 28:26 Task3_Lab6.scala 30:14 Task3_Lab6.scala 23:24]
    io_out_0 <= UInt<1>("h0") @[Task3_Lab6.scala 26:18]
    io_out_1 <= UInt<1>("h0") @[Task3_Lab6.scala 26:18]
    state <= mux(reset, UInt<2>("h0"), _GEN_3) @[Task3_Lab6.scala 23:24 Task3_Lab6.scala 23:24]
    load <= mux(reset, UInt<2>("h0"), _GEN_2) @[Task3_Lab6.scala 24:23 Task3_Lab6.scala 24:23]
