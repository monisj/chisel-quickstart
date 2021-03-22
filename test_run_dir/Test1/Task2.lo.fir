circuit Task2 :
  module Task2 :
    input clock : Clock
    input reset : UInt<1>
    output io_result : UInt<1>

    reg counter1 : UInt<4>, clock with :
      reset => (UInt<1>("h0"), counter1) @[Task2.scala 10:29]
    node _counter1_T = eq(counter1, UInt<4>("h8")) @[Task2.scala 11:22]
    node _counter1_T_1 = eq(counter1, UInt<1>("h0")) @[Task2.scala 14:28]
    node _counter1_count_T = add(counter1, UInt<1>("h1")) @[Task2.scala 15:28]
    node _counter1_count_T_1 = tail(_counter1_count_T, 1) @[Task2.scala 15:28]
    node _counter1_count_T_2 = add(counter1, UInt<1>("h1")) @[Task2.scala 18:28]
    node _counter1_count_T_3 = tail(_counter1_count_T_2, 1) @[Task2.scala 18:28]
    node _GEN_0 = mux(_counter1_T_1, _counter1_count_T_1, _counter1_count_T_3) @[Task2.scala 14:36 Task2.scala 15:19 Task2.scala 18:19]
    node _GEN_1 = mux(_counter1_T_1, UInt<1>("h1"), UInt<1>("h0")) @[Task2.scala 14:36 Task2.scala 16:23 Task2.scala 19:23]
    node _GEN_2 = mux(_counter1_T, UInt<1>("h0"), _GEN_0) @[Task2.scala 11:39 Task2.scala 12:19]
    node _GEN_3 = mux(_counter1_T, UInt<1>("h1"), _GEN_1) @[Task2.scala 11:39 Task2.scala 13:23]
    io_result <= _GEN_3
    counter1 <= mux(reset, UInt<4>("h0"), _GEN_2) @[Task2.scala 10:29 Task2.scala 10:29]
