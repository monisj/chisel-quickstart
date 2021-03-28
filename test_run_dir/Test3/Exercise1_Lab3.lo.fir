circuit Exercise1_Lab3 :
  module Exercise1_Lab3 :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<4>
    output io_out : UInt<2>

    node _T = eq(UInt<1>("h1"), io_in) @[Conditional.scala 37:30]
    node _T_1 = eq(UInt<2>("h2"), io_in) @[Conditional.scala 37:30]
    node _T_2 = eq(UInt<3>("h4"), io_in) @[Conditional.scala 37:30]
    node _T_3 = eq(UInt<4>("h8"), io_in) @[Conditional.scala 37:30]
    node _GEN_0 = mux(_T_3, UInt<2>("h3"), UInt<1>("h0")) @[Conditional.scala 39:67 Exercise1_Lab3.scala 25:22 Exercise1_Lab3.scala 13:12]
    node _GEN_1 = mux(_T_2, UInt<2>("h2"), _GEN_0) @[Conditional.scala 39:67 Exercise1_Lab3.scala 22:19]
    node _GEN_2 = mux(_T_1, UInt<1>("h1"), _GEN_1) @[Conditional.scala 39:67 Exercise1_Lab3.scala 19:22]
    node _GEN_3 = mux(_T, UInt<1>("h0"), _GEN_2) @[Conditional.scala 40:58 Exercise1_Lab3.scala 16:20]
    io_out <= _GEN_3
