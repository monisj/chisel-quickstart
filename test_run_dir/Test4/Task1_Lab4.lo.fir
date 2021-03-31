circuit Task1_Lab4 :
  module Task1_Lab4 :
    input clock : Clock
    input reset : UInt<1>
    input io_fnct3 : UInt<3>
    input io_branch : UInt<1>
    input io_arg_x : UInt<32>
    input io_arg_y : UInt<32>
    output io_br_taken : UInt<1>

    node _T = eq(io_branch, UInt<1>("h1")) @[Task1_lab4.scala 16:20]
    node _T_1 = eq(io_arg_x, io_arg_y) @[Task1_lab4.scala 17:20]
    node _T_2 = eq(io_fnct3, UInt<1>("h0")) @[Task1_lab4.scala 17:46]
    node _T_3 = and(_T_1, _T_2) @[Task1_lab4.scala 17:34]
    node _T_4 = neq(io_arg_x, io_arg_y) @[Task1_lab4.scala 19:26]
    node _T_5 = eq(io_fnct3, UInt<1>("h1")) @[Task1_lab4.scala 19:52]
    node _T_6 = and(_T_4, _T_5) @[Task1_lab4.scala 19:40]
    node _T_7 = lt(io_arg_x, io_arg_y) @[Task1_lab4.scala 21:26]
    node _T_8 = eq(io_fnct3, UInt<3>("h4")) @[Task1_lab4.scala 21:51]
    node _T_9 = eq(io_fnct3, UInt<3>("h6")) @[Task1_lab4.scala 21:75]
    node _T_10 = or(_T_8, _T_9) @[Task1_lab4.scala 21:64]
    node _T_11 = and(_T_7, _T_10) @[Task1_lab4.scala 21:38]
    node _T_12 = geq(io_arg_x, io_arg_y) @[Task1_lab4.scala 23:26]
    node _T_13 = eq(io_fnct3, UInt<3>("h5")) @[Task1_lab4.scala 23:52]
    node _T_14 = eq(io_fnct3, UInt<3>("h7")) @[Task1_lab4.scala 23:76]
    node _T_15 = or(_T_13, _T_14) @[Task1_lab4.scala 23:65]
    node _T_16 = and(_T_12, _T_15) @[Task1_lab4.scala 23:39]
    node _GEN_0 = mux(_T_16, UInt<1>("h1"), UInt<1>("h0")) @[Task1_lab4.scala 23:90 Task1_lab4.scala 24:20 Task1_lab4.scala 26:20]
    node _GEN_1 = mux(_T_11, UInt<1>("h1"), _GEN_0) @[Task1_lab4.scala 21:89 Task1_lab4.scala 22:20]
    node _GEN_2 = mux(_T_6, UInt<1>("h1"), _GEN_1) @[Task1_lab4.scala 19:65 Task1_lab4.scala 20:20]
    node _GEN_3 = mux(_T_3, UInt<1>("h1"), _GEN_2) @[Task1_lab4.scala 17:59 Task1_lab4.scala 18:24]
    node _GEN_4 = mux(_T, _GEN_3, UInt<1>("h0")) @[Task1_lab4.scala 16:28 Task1_lab4.scala 29:20]
    io_br_taken <= _GEN_4
