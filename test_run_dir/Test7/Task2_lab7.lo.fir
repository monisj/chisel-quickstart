circuit Task2_lab7 :
  module Task2_lab7 :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<1>
    input io_start : UInt<1>
    output io_out : UInt<8>
    output io_flag : UInt<1>

    reg register : UInt<8>, clock with :
      reset => (UInt<1>("h0"), register) @[Task2_lab7.scala 17:27]
    node _T = eq(UInt<1>("h1"), io_start) @[Conditional.scala 37:30]
    node _T_1 = eq(io_in, UInt<1>("h1")) @[Task2_lab7.scala 22:25]
    node _register_T = dshl(UInt<1>("h1"), register) @[Task2_lab7.scala 23:32]
    node _GEN_0 = mux(_T_1, _register_T, register) @[Task2_lab7.scala 22:33 Task2_lab7.scala 23:25 Task2_lab7.scala 17:27]
    node _GEN_1 = mux(_T_1, register, register) @[Task2_lab7.scala 22:33 Task2_lab7.scala 24:23 Task2_lab7.scala 27:23]
    node _GEN_2 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[Task2_lab7.scala 22:33 Task2_lab7.scala 25:24 Task2_lab7.scala 28:24]
    node _T_2 = eq(UInt<1>("h0"), io_start) @[Conditional.scala 37:30]
    node _GEN_3 = mux(_T_2, register, UInt<1>("h0")) @[Conditional.scala 39:67 Task2_lab7.scala 32:19 Task2_lab7.scala 18:11]
    node _GEN_4 = mux(_T_2, UInt<1>("h0"), UInt<1>("h0")) @[Conditional.scala 39:67 Task2_lab7.scala 33:20 Task2_lab7.scala 19:12]
    node _GEN_5 = mux(_T, _GEN_0, register) @[Conditional.scala 40:58 Task2_lab7.scala 17:27]
    node _GEN_6 = mux(_T, _GEN_1, _GEN_3) @[Conditional.scala 40:58]
    node _GEN_7 = mux(_T, _GEN_2, _GEN_4) @[Conditional.scala 40:58]
    io_out <= _GEN_6
    io_flag <= _GEN_7
    register <= mux(reset, UInt<8>("h0"), bits(_GEN_5, 7, 0)) @[Task2_lab7.scala 17:27 Task2_lab7.scala 17:27]
