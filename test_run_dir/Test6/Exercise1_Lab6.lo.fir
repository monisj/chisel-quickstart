circuit Exercise1_Lab6 :
  module Exercise1_Lab6 :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<4>
    output io_out : UInt<1>

    reg state : UInt<4>, clock with :
      reset => (UInt<1>("h0"), state) @[Exercise1_Lab6.scala 22:24]
    reg load : UInt<4>, clock with :
      reset => (UInt<1>("h0"), load) @[Exercise1_Lab6.scala 23:23]
    node _T = eq(load, UInt<1>("h0")) @[Exercise1_Lab6.scala 25:15]
    node _load_T = add(load, UInt<1>("h1")) @[Exercise1_Lab6.scala 26:19]
    node _load_T_1 = tail(_load_T, 1) @[Exercise1_Lab6.scala 26:19]
    node _state_T = shr(state, 1) @[Exercise1_Lab6.scala 29:23]
    node _io_out_T = bits(state, 0, 0) @[Exercise1_Lab6.scala 30:22]
    node _GEN_0 = mux(_T, _load_T_1, load) @[Exercise1_Lab6.scala 25:23 Exercise1_Lab6.scala 26:13 Exercise1_Lab6.scala 23:23]
    node _GEN_1 = mux(_T, io_in, _state_T) @[Exercise1_Lab6.scala 25:23 Exercise1_Lab6.scala 27:14 Exercise1_Lab6.scala 29:14]
    node _GEN_2 = mux(_T, UInt<1>("h0"), _io_out_T) @[Exercise1_Lab6.scala 25:23 Exercise1_Lab6.scala 24:11 Exercise1_Lab6.scala 30:15]
    io_out <= _GEN_2
    state <= mux(reset, UInt<4>("h0"), _GEN_1) @[Exercise1_Lab6.scala 22:24 Exercise1_Lab6.scala 22:24]
    load <= mux(reset, UInt<4>("h0"), _GEN_0) @[Exercise1_Lab6.scala 23:23 Exercise1_Lab6.scala 23:23]
