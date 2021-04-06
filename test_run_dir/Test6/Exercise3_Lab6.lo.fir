circuit Exercise3_Lab6 :
  module Exercise3_Lab6 :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<4>
    output io_clock_High : UInt<1>

    reg counter : UInt<4>, clock with :
      reset => (UInt<1>("h0"), counter) @[Exercise3_Lab6.scala 10:27]
    node done = eq(counter, UInt<1>("h0")) @[Exercise3_Lab6.scala 11:24]
    node _T = eq(done, UInt<1>("h0")) @[Exercise3_Lab6.scala 14:11]
    node _next_T = sub(counter, UInt<1>("h1")) @[Exercise3_Lab6.scala 15:23]
    node _next_T_1 = tail(_next_T, 1) @[Exercise3_Lab6.scala 15:23]
    node _T_1 = eq(counter, UInt<1>("h0")) @[Exercise3_Lab6.scala 19:24]
    node _next_T_2 = add(counter, UInt<1>("h1")) @[Exercise3_Lab6.scala 23:25]
    node _next_T_3 = tail(_next_T_2, 1) @[Exercise3_Lab6.scala 23:25]
    node _next_T_4 = add(counter, UInt<1>("h1")) @[Exercise3_Lab6.scala 25:26]
    node _next_T_5 = tail(_next_T_4, 1) @[Exercise3_Lab6.scala 25:26]
    node _GEN_0 = mux(done, UInt<1>("h1"), UInt<1>("h0")) @[Exercise3_Lab6.scala 21:19 Exercise3_Lab6.scala 22:23 Exercise3_Lab6.scala 13:18]
    node _GEN_1 = mux(done, _next_T_3, _next_T_5) @[Exercise3_Lab6.scala 21:19 Exercise3_Lab6.scala 23:14 Exercise3_Lab6.scala 25:17]
    node _GEN_4 = mux(_T_1, _GEN_1, UInt<1>("h0")) @[Exercise3_Lab6.scala 19:32]
    node _GEN_7 = mux(done, UInt<1>("h0"), _GEN_4) @[Exercise3_Lab6.scala 17:21]
    node _GEN_8 = mux(_T, _next_T_1, _GEN_7) @[Exercise3_Lab6.scala 14:17 Exercise3_Lab6.scala 15:13]
    node next = _GEN_8
    node _GEN_2 = mux(_T_1, next, counter) @[Exercise3_Lab6.scala 19:32 Exercise3_Lab6.scala 20:16 Exercise3_Lab6.scala 10:27]
    node _GEN_3 = mux(_T_1, _GEN_0, UInt<1>("h0")) @[Exercise3_Lab6.scala 19:32 Exercise3_Lab6.scala 13:18]
    node _GEN_5 = mux(done, UInt<1>("h1"), _GEN_3) @[Exercise3_Lab6.scala 17:21 Exercise3_Lab6.scala 18:23]
    node _GEN_6 = mux(done, counter, _GEN_2) @[Exercise3_Lab6.scala 17:21 Exercise3_Lab6.scala 10:27]
    node _GEN_9 = mux(_T, UInt<1>("h0"), _GEN_5) @[Exercise3_Lab6.scala 14:17 Exercise3_Lab6.scala 16:23]
    node _GEN_10 = mux(_T, counter, _GEN_6) @[Exercise3_Lab6.scala 14:17 Exercise3_Lab6.scala 10:27]
    io_clock_High <= _GEN_9
    counter <= mux(reset, UInt<4>("hf"), next) @[Exercise3_Lab6.scala 10:27 Exercise3_Lab6.scala 10:27 Exercise3_Lab6.scala 29:12]
