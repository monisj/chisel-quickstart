circuit Exercise1_Lab2 :
  module Exercise1_Lab2 :
    input clock : Clock
    input reset : UInt<1>
    input io_in_A : UInt<32>
    input io_in_B : UInt<32>
    input io_select : UInt<1>
    output io_out : UInt<32>

    node _T = eq(UInt<1>("h1"), UInt<1>("h1")) @[Exercise1_Lab2.scala 14:29]
    node _T_1 = and(io_select, _T) @[Exercise1_Lab2.scala 14:20]
    node _T_2 = not(io_select) @[Exercise1_Lab2.scala 16:16]
    node _T_3 = eq(_T_2, UInt<1>("h1")) @[Exercise1_Lab2.scala 16:27]
    node _GEN_0 = mux(_T_3, io_in_B, UInt<1>("h0")) @[Exercise1_Lab2.scala 16:35 Exercise1_Lab2.scala 17:15 Exercise1_Lab2.scala 13:11]
    node _GEN_1 = mux(_T_1, io_in_A, _GEN_0) @[Exercise1_Lab2.scala 14:37 Exercise1_Lab2.scala 15:15]
    io_out <= _GEN_1
