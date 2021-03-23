circuit Task1_Lab2 :
  module Task1_Lab2 :
    input clock : Clock
    input reset : UInt<1>
    input io_s0 : UInt<1>
    input io_s1 : UInt<1>
    input io_s2 : UInt<1>
    output io_out : UInt<32>

    node _T = eq(io_s0, UInt<1>("h0")) @[Task1_Lab2.scala 17:15]
    node _T_1 = eq(io_s1, UInt<1>("h0")) @[Task1_Lab2.scala 17:31]
    node _T_2 = and(_T, _T_1) @[Task1_Lab2.scala 17:22]
    node _T_3 = eq(io_s2, UInt<1>("h0")) @[Task1_Lab2.scala 17:47]
    node _T_4 = and(_T_2, _T_3) @[Task1_Lab2.scala 17:38]
    node _T_5 = eq(io_s0, UInt<1>("h1")) @[Task1_Lab2.scala 19:22]
    node _T_6 = eq(io_s1, UInt<1>("h0")) @[Task1_Lab2.scala 19:38]
    node _T_7 = and(_T_5, _T_6) @[Task1_Lab2.scala 19:30]
    node _T_8 = eq(io_s2, UInt<1>("h0")) @[Task1_Lab2.scala 19:54]
    node _T_9 = and(_T_7, _T_8) @[Task1_Lab2.scala 19:45]
    node _T_10 = eq(io_s2, UInt<1>("h0")) @[Task1_Lab2.scala 21:22]
    node _T_11 = eq(io_s1, UInt<1>("h1")) @[Task1_Lab2.scala 21:39]
    node _T_12 = and(_T_10, _T_11) @[Task1_Lab2.scala 21:30]
    node _T_13 = eq(io_s0, UInt<1>("h0")) @[Task1_Lab2.scala 21:56]
    node _T_14 = and(_T_12, _T_13) @[Task1_Lab2.scala 21:47]
    node _T_15 = eq(io_s2, UInt<1>("h0")) @[Task1_Lab2.scala 23:22]
    node _T_16 = and(io_s0, io_s1) @[Task1_Lab2.scala 23:40]
    node _T_17 = eq(_T_16, UInt<1>("h1")) @[Task1_Lab2.scala 23:49]
    node _T_18 = and(_T_15, _T_17) @[Task1_Lab2.scala 23:30]
    node _T_19 = eq(io_s2, UInt<1>("h1")) @[Task1_Lab2.scala 25:22]
    node _GEN_0 = mux(_T_19, UInt<6>("h20"), UInt<1>("h0")) @[Task1_Lab2.scala 25:30 Task1_Lab2.scala 26:15 Task1_Lab2.scala 15:11]
    node _GEN_1 = mux(_T_18, UInt<5>("h18"), _GEN_0) @[Task1_Lab2.scala 23:57 Task1_Lab2.scala 24:15]
    node _GEN_2 = mux(_T_14, UInt<5>("h10"), _GEN_1) @[Task1_Lab2.scala 21:65 Task1_Lab2.scala 22:15]
    node _GEN_3 = mux(_T_9, UInt<4>("h8"), _GEN_2) @[Task1_Lab2.scala 19:62 Task1_Lab2.scala 20:15]
    node _GEN_4 = mux(_T_4, UInt<1>("h0"), _GEN_3) @[Task1_Lab2.scala 17:55 Task1_Lab2.scala 18:15]
    io_out <= _GEN_4
