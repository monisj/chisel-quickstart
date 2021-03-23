circuit Task2 :
  module Task2 :
    input clock : Clock
    input reset : UInt<1>
    output io_result : UInt<1>

    reg counter1 : UInt<4>, clock with :
      reset => (UInt<1>("h0"), counter1) @[Task2.scala 10:29]
    reg counter1_count_result : UInt<4>, clock with :
      reset => (UInt<1>("h0"), counter1_count_result) @[Task2.scala 11:36]
    node _counter1_T = eq(counter1, UInt<4>("h8")) @[Task2.scala 12:22]
    node _counter1_T_1 = eq(counter1_count_result, counter1) @[Task2.scala 14:32]
    node _counter1_count_result_T = sub(counter1_count_result, UInt<1>("h1")) @[Task2.scala 15:45]
    node _counter1_count_result_T_1 = tail(_counter1_count_result_T, 1) @[Task2.scala 15:45]
    node _counter1_T_2 = eq(counter1_count_result, UInt<1>("h0")) @[Task2.scala 16:37]
    node _counter1_count_result_T_2 = sub(counter1_count_result, UInt<1>("h1")) @[Task2.scala 20:45]
    node _counter1_count_result_T_3 = tail(_counter1_count_result_T_2, 1) @[Task2.scala 20:45]
    node _GEN_0 = mux(_counter1_T_2, UInt<1>("h1"), UInt<1>("h0")) @[Task2.scala 16:45 Task2.scala 17:26 Task2.scala 21:26]
    node _GEN_1 = mux(_counter1_T_2, UInt<1>("h0"), counter1) @[Task2.scala 16:45 Task2.scala 18:23 Task2.scala 10:29]
    node _GEN_2 = mux(_counter1_T_2, counter1_count_result, _counter1_count_result_T_3) @[Task2.scala 16:45 Task2.scala 11:36 Task2.scala 20:30]
    node _GEN_3 = mux(_counter1_T_1, _counter1_count_result_T_1, _GEN_2) @[Task2.scala 14:42 Task2.scala 15:30]
    node _GEN_4 = mux(_counter1_T_1, UInt<1>("h1"), _GEN_0) @[Task2.scala 14:42 Task2.scala 13:23]
    node _GEN_5 = mux(_counter1_T_1, counter1, _GEN_1) @[Task2.scala 14:42 Task2.scala 10:29]
    node _counter1_T_3 = eq(counter1, UInt<1>("h0")) @[Task2.scala 25:28]
    node _counter1_count_T = add(counter1, UInt<1>("h1")) @[Task2.scala 26:28]
    node _counter1_count_T_1 = tail(_counter1_count_T, 1) @[Task2.scala 26:28]
    node _counter1_count_result_T_4 = add(counter1, UInt<1>("h1")) @[Task2.scala 27:34]
    node _counter1_count_result_T_5 = tail(_counter1_count_result_T_4, 1) @[Task2.scala 27:34]
    node _counter1_count_T_2 = add(counter1, UInt<1>("h1")) @[Task2.scala 30:28]
    node _counter1_count_T_3 = tail(_counter1_count_T_2, 1) @[Task2.scala 30:28]
    node _counter1_count_result_T_6 = add(counter1, UInt<1>("h1")) @[Task2.scala 31:34]
    node _counter1_count_result_T_7 = tail(_counter1_count_result_T_6, 1) @[Task2.scala 31:34]
    node _GEN_6 = mux(_counter1_T_3, _counter1_count_T_1, _counter1_count_T_3) @[Task2.scala 25:36 Task2.scala 26:19 Task2.scala 30:19]
    node _GEN_7 = mux(_counter1_T_3, _counter1_count_result_T_5, _counter1_count_result_T_7) @[Task2.scala 25:36 Task2.scala 27:26 Task2.scala 31:26]
    node _GEN_8 = mux(_counter1_T_3, UInt<1>("h1"), UInt<1>("h0")) @[Task2.scala 25:36 Task2.scala 28:23 Task2.scala 32:23]
    node _GEN_9 = mux(_counter1_T, _GEN_4, _GEN_8) @[Task2.scala 12:39]
    node _GEN_10 = mux(_counter1_T, _GEN_3, _GEN_7) @[Task2.scala 12:39]
    node _GEN_11 = mux(_counter1_T, _GEN_5, _GEN_6) @[Task2.scala 12:39]
    io_result <= _GEN_9
    counter1 <= mux(reset, UInt<4>("h0"), _GEN_11) @[Task2.scala 10:29 Task2.scala 10:29]
    counter1_count_result <= mux(reset, UInt<4>("h0"), _GEN_10) @[Task2.scala 11:36 Task2.scala 11:36]
