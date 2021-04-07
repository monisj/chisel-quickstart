circuit Task3_Lab6 :
  module Task3_Lab6 :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<4>
    input io_load : UInt<1>
    output io_out_Parallel : UInt<4>
    output io_out_Serial : UInt<1>

    reg state : UInt<4>, clock with :
      reset => (UInt<1>("h0"), state) @[Task3_Lab6.scala 24:24]
    reg load : UInt<4>, clock with :
      reset => (UInt<1>("h0"), load) @[Task3_Lab6.scala 25:23]
    node _T = eq(io_load, UInt<1>("h1")) @[Task3_Lab6.scala 28:18]
    node _T_1 = eq(load, UInt<1>("h0")) @[Task3_Lab6.scala 29:15]
    node _load_T = add(load, UInt<1>("h1")) @[Task3_Lab6.scala 30:19]
    node _load_T_1 = tail(_load_T, 1) @[Task3_Lab6.scala 30:19]
    node _state_T = shr(state, 1) @[Task3_Lab6.scala 33:23]
    node _io_out_Serial_T = bits(state, 0, 0) @[Task3_Lab6.scala 34:29]
    node _GEN_0 = mux(_T_1, _load_T_1, load) @[Task3_Lab6.scala 29:23 Task3_Lab6.scala 30:13 Task3_Lab6.scala 25:23]
    node _GEN_1 = mux(_T_1, io_in, _state_T) @[Task3_Lab6.scala 29:23 Task3_Lab6.scala 31:14 Task3_Lab6.scala 33:14]
    node _GEN_2 = mux(_T_1, UInt<1>("h0"), _io_out_Serial_T) @[Task3_Lab6.scala 29:23 Task3_Lab6.scala 27:18 Task3_Lab6.scala 34:22]
    node _T_2 = eq(io_load, UInt<1>("h0")) @[Task3_Lab6.scala 36:24]
    node _T_3 = eq(load, UInt<1>("h0")) @[Task3_Lab6.scala 37:19]
    node _load_T_2 = add(load, UInt<1>("h1")) @[Task3_Lab6.scala 38:19]
    node _load_T_3 = tail(_load_T_2, 1) @[Task3_Lab6.scala 38:19]
    node _GEN_3 = mux(_T_3, _load_T_3, load) @[Task3_Lab6.scala 37:27 Task3_Lab6.scala 38:13 Task3_Lab6.scala 25:23]
    node _GEN_4 = mux(_T_3, io_in, state) @[Task3_Lab6.scala 37:27 Task3_Lab6.scala 39:14 Task3_Lab6.scala 24:24]
    node _GEN_5 = mux(_T_2, _GEN_3, load) @[Task3_Lab6.scala 36:32 Task3_Lab6.scala 25:23]
    node _GEN_6 = mux(_T_2, _GEN_4, state) @[Task3_Lab6.scala 36:32 Task3_Lab6.scala 24:24]
    node _GEN_7 = mux(_T_2, state, UInt<1>("h0")) @[Task3_Lab6.scala 36:32 Task3_Lab6.scala 41:24 Task3_Lab6.scala 26:20]
    node _GEN_8 = mux(_T, _GEN_0, _GEN_5) @[Task3_Lab6.scala 28:26]
    node _GEN_9 = mux(_T, _GEN_1, _GEN_6) @[Task3_Lab6.scala 28:26]
    node _GEN_10 = mux(_T, _GEN_2, UInt<1>("h0")) @[Task3_Lab6.scala 28:26 Task3_Lab6.scala 27:18]
    node _GEN_11 = mux(_T, UInt<1>("h0"), _GEN_7) @[Task3_Lab6.scala 28:26 Task3_Lab6.scala 26:20]
    io_out_Parallel <= _GEN_11
    io_out_Serial <= _GEN_10
    state <= mux(reset, UInt<4>("h0"), _GEN_9) @[Task3_Lab6.scala 24:24 Task3_Lab6.scala 24:24]
    load <= mux(reset, UInt<4>("h0"), _GEN_8) @[Task3_Lab6.scala 25:23 Task3_Lab6.scala 25:23]
