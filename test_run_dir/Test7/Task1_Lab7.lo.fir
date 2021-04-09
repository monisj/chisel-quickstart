circuit Task1_Lab7 :
  module Task1_Lab7 :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<1>
    output io_out : UInt<1>

    reg state : UInt<2>, clock with :
      reset => (UInt<1>("h0"), state) @[Task1_Lab7.scala 15:25]
    node _io_out_T = eq(state, UInt<2>("h0")) @[Task1_Lab7.scala 17:19]
    node _io_out_T_1 = and(_io_out_T, io_in) @[Task1_Lab7.scala 17:25]
    node _T = eq(UInt<2>("h0"), state) @[Conditional.scala 37:30]
    node _GEN_0 = mux(io_in, UInt<2>("h1"), state) @[Task1_Lab7.scala 20:30 Task1_Lab7.scala 21:23 Task1_Lab7.scala 15:25]
    node _T_1 = eq(UInt<2>("h1"), state) @[Conditional.scala 37:30]
    node _T_2 = eq(io_in, UInt<1>("h0")) @[Task1_Lab7.scala 25:20]
    node _GEN_1 = mux(_T_2, UInt<2>("h2"), UInt<2>("h0")) @[Task1_Lab7.scala 25:31 Task1_Lab7.scala 26:23 Task1_Lab7.scala 28:23]
    node _T_3 = eq(UInt<2>("h2"), state) @[Conditional.scala 37:30]
    node _T_4 = eq(io_in, UInt<1>("h0")) @[Task1_Lab7.scala 32:19]
    node _GEN_2 = mux(_T_4, UInt<2>("h0"), state) @[Task1_Lab7.scala 32:31 Task1_Lab7.scala 33:23 Task1_Lab7.scala 15:25]
    node _GEN_3 = mux(_T_3, _GEN_2, state) @[Conditional.scala 39:67 Task1_Lab7.scala 15:25]
    node _GEN_4 = mux(_T_1, _GEN_1, _GEN_3) @[Conditional.scala 39:67]
    node _GEN_5 = mux(_T, _GEN_0, _GEN_4) @[Conditional.scala 40:58]
    io_out <= _io_out_T_1 @[Task1_Lab7.scala 17:11]
    state <= mux(reset, UInt<2>("h0"), _GEN_5) @[Task1_Lab7.scala 15:25 Task1_Lab7.scala 15:25]
