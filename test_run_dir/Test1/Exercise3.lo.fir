circuit Exercise3 :
  module Exercise3 :
    input clock : Clock
    input reset : UInt<1>
    output io_result : UInt<1>

    reg counter1 : UInt<4>, clock with :
      reset => (UInt<1>("h0"), counter1) @[Exercise3.scala 10:29]
    node _counter1_T = eq(counter1, UInt<4>("h8")) @[Exercise3.scala 11:22]
    node _counter1_count_T = add(counter1, UInt<1>("h1")) @[Exercise3.scala 14:28]
    node _counter1_count_T_1 = tail(_counter1_count_T, 1) @[Exercise3.scala 14:28]
    node _GEN_0 = mux(_counter1_T, UInt<1>("h0"), _counter1_count_T_1) @[Exercise3.scala 11:39 Exercise3.scala 12:19 Exercise3.scala 14:19]
    node _io_result_T = bits(counter1, 3, 3) @[Exercise3.scala 19:25]
    io_result <= _io_result_T @[Exercise3.scala 19:13]
    counter1 <= mux(reset, UInt<4>("h0"), _GEN_0) @[Exercise3.scala 10:29 Exercise3.scala 10:29]
