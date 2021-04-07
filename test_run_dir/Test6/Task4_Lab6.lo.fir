circuit Task4_Lab6 :
  module Task4_Lab6 :
    input clock : Clock
    input reset : UInt<1>
    output io_out : UInt<5>
    input io_up_down : UInt<1>

    reg count_up : UInt<5>, clock with :
      reset => (UInt<1>("h0"), count_up) @[Task4_Lab6.scala 11:27]
    reg count_down : UInt<5>, clock with :
      reset => (UInt<1>("h0"), count_down) @[Task4_Lab6.scala 12:29]
    node _T = eq(io_up_down, UInt<1>("h1")) @[Task4_Lab6.scala 13:21]
    node _count_up_T = add(count_up, UInt<1>("h1")) @[Task4_Lab6.scala 14:29]
    node _count_up_T_1 = tail(_count_up_T, 1) @[Task4_Lab6.scala 14:29]
    node _T_1 = eq(io_up_down, UInt<1>("h0")) @[Task4_Lab6.scala 16:27]
    node _count_down_T = sub(count_down, UInt<1>("h1")) @[Task4_Lab6.scala 17:34]
    node _count_down_T_1 = tail(_count_down_T, 1) @[Task4_Lab6.scala 17:34]
    node _GEN_0 = mux(_T_1, _count_down_T_1, count_down) @[Task4_Lab6.scala 16:35 Task4_Lab6.scala 17:20 Task4_Lab6.scala 12:29]
    node _GEN_1 = mux(_T_1, count_down, UInt<1>("h0")) @[Task4_Lab6.scala 16:35 Task4_Lab6.scala 18:15 Task4_Lab6.scala 10:11]
    node _GEN_2 = mux(_T, _count_up_T_1, count_up) @[Task4_Lab6.scala 13:29 Task4_Lab6.scala 14:18 Task4_Lab6.scala 11:27]
    node _GEN_3 = mux(_T, count_up, _GEN_1) @[Task4_Lab6.scala 13:29 Task4_Lab6.scala 15:15]
    node _GEN_4 = mux(_T, count_down, _GEN_0) @[Task4_Lab6.scala 13:29 Task4_Lab6.scala 12:29]
    io_out <= _GEN_3
    count_up <= mux(reset, UInt<5>("h0"), _GEN_2) @[Task4_Lab6.scala 11:27 Task4_Lab6.scala 11:27]
    count_down <= mux(reset, UInt<5>("h5"), _GEN_4) @[Task4_Lab6.scala 12:29 Task4_Lab6.scala 12:29]
