circuit Exercise3_Lab6 :
  module Exercise3_Lab6 :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<4>
    output io_clock_High : UInt<1>

    reg counter : UInt<4>, clock with :
      reset => (UInt<1>("h0"), counter) @[Exercise3_Lab6.scala 10:27]
    reg counter_2 : UInt<4>, clock with :
      reset => (UInt<1>("h0"), counter_2) @[Exercise3_Lab6.scala 11:28]
    node _T = eq(counter, UInt<4>("h8")) @[Exercise3_Lab6.scala 13:19]
    node _counter_T = sub(counter, UInt<1>("h1")) @[Exercise3_Lab6.scala 15:25]
    node _counter_T_1 = tail(_counter_T, 1) @[Exercise3_Lab6.scala 15:25]
    node _counter_2_T = sub(counter_2, UInt<1>("h1")) @[Exercise3_Lab6.scala 16:29]
    node _counter_2_T_1 = tail(_counter_2_T, 1) @[Exercise3_Lab6.scala 16:29]
    node _T_1 = eq(counter, UInt<1>("h0")) @[Exercise3_Lab6.scala 17:24]
    node _T_2 = eq(counter_2, UInt<1>("h0")) @[Exercise3_Lab6.scala 18:24]
    node _counter_2_T_2 = add(counter_2, UInt<1>("h1")) @[Exercise3_Lab6.scala 20:36]
    node _counter_2_T_3 = tail(_counter_2_T_2, 1) @[Exercise3_Lab6.scala 20:36]
    node _T_3 = eq(counter_2, UInt<4>("h8")) @[Exercise3_Lab6.scala 21:30]
    node _counter_2_T_4 = add(counter_2, UInt<1>("h1")) @[Exercise3_Lab6.scala 26:33]
    node _counter_2_T_5 = tail(_counter_2_T_4, 1) @[Exercise3_Lab6.scala 26:33]
    node _GEN_0 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[Exercise3_Lab6.scala 21:40 Exercise3_Lab6.scala 22:26 Exercise3_Lab6.scala 25:26]
    node _GEN_1 = mux(_T_3, UInt<4>("h8"), counter) @[Exercise3_Lab6.scala 21:40 Exercise3_Lab6.scala 23:20 Exercise3_Lab6.scala 10:27]
    node _GEN_2 = mux(_T_3, counter_2, _counter_2_T_5) @[Exercise3_Lab6.scala 21:40 Exercise3_Lab6.scala 11:28 Exercise3_Lab6.scala 26:22]
    node _GEN_3 = mux(_T_2, UInt<1>("h1"), _GEN_0) @[Exercise3_Lab6.scala 18:32 Exercise3_Lab6.scala 19:26]
    node _GEN_4 = mux(_T_2, _counter_2_T_3, _GEN_2) @[Exercise3_Lab6.scala 18:32 Exercise3_Lab6.scala 20:23]
    node _GEN_5 = mux(_T_2, counter, _GEN_1) @[Exercise3_Lab6.scala 18:32 Exercise3_Lab6.scala 10:27]
    node _counter_2_T_6 = sub(counter_2, UInt<1>("h1")) @[Exercise3_Lab6.scala 30:29]
    node _counter_2_T_7 = tail(_counter_2_T_6, 1) @[Exercise3_Lab6.scala 30:29]
    node _counter_T_2 = sub(counter, UInt<1>("h1")) @[Exercise3_Lab6.scala 31:25]
    node _counter_T_3 = tail(_counter_T_2, 1) @[Exercise3_Lab6.scala 31:25]
    node _GEN_6 = mux(_T_1, _GEN_3, UInt<1>("h0")) @[Exercise3_Lab6.scala 17:32 Exercise3_Lab6.scala 29:22]
    node _GEN_7 = mux(_T_1, _GEN_4, _counter_2_T_7) @[Exercise3_Lab6.scala 17:32 Exercise3_Lab6.scala 30:18]
    node _GEN_8 = mux(_T_1, _GEN_5, _counter_T_3) @[Exercise3_Lab6.scala 17:32 Exercise3_Lab6.scala 31:16]
    node _GEN_9 = mux(_T, UInt<1>("h1"), _GEN_6) @[Exercise3_Lab6.scala 13:29 Exercise3_Lab6.scala 14:22]
    node _GEN_10 = mux(_T, _counter_T_1, _GEN_8) @[Exercise3_Lab6.scala 13:29 Exercise3_Lab6.scala 15:16]
    node _GEN_11 = mux(_T, _counter_2_T_1, _GEN_7) @[Exercise3_Lab6.scala 13:29 Exercise3_Lab6.scala 16:18]
    io_clock_High <= _GEN_9
    counter <= mux(reset, UInt<4>("h8"), _GEN_10) @[Exercise3_Lab6.scala 10:27 Exercise3_Lab6.scala 10:27]
    counter_2 <= mux(reset, UInt<4>("h8"), _GEN_11) @[Exercise3_Lab6.scala 11:28 Exercise3_Lab6.scala 11:28]
