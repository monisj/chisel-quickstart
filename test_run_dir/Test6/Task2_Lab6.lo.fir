circuit Task2_Lab6 :
  module Task2_Lab6 :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<4>
    output io_out : UInt<1>

    reg counter : UInt<4>, clock with :
      reset => (UInt<1>("h0"), counter) @[Task2_Lab6.scala 13:26]
    node _T = eq(counter, io_in) @[Task2_Lab6.scala 15:19]
    node _counter_T = add(counter, UInt<1>("h1")) @[Task2_Lab6.scala 19:25]
    node _counter_T_1 = tail(_counter_T, 1) @[Task2_Lab6.scala 19:25]
    node _GEN_0 = mux(_T, UInt<1>("h0"), _counter_T_1) @[Task2_Lab6.scala 15:30 Task2_Lab6.scala 16:16 Task2_Lab6.scala 19:16]
    node _GEN_1 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[Task2_Lab6.scala 15:30 Task2_Lab6.scala 17:15 Task2_Lab6.scala 20:15]
    io_out <= _GEN_1
    counter <= mux(reset, UInt<4>("h0"), _GEN_0) @[Task2_Lab6.scala 13:26 Task2_Lab6.scala 13:26]
