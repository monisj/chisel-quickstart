circuit Task2_lab7 :
  module Task2_lab7 :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<1>
    input io_start : UInt<1>
    output io_out : UInt<8>
    output io_flag : UInt<1>

    reg outReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), outReg) @[Task2_lab7.scala 16:25]
    node _T = eq(UInt<1>("h0"), io_start) @[Conditional.scala 37:30]
    node _T_1 = eq(UInt<1>("h1"), io_start) @[Conditional.scala 37:30]
    node _outReg_T = shl(outReg, 1) @[Task2_lab7.scala 26:30]
    node _outReg_T_1 = or(_outReg_T, io_in) @[Task2_lab7.scala 26:35]
    node _GEN_0 = mux(_T_1, _outReg_T_1, outReg) @[Conditional.scala 39:67 Task2_lab7.scala 26:20 Task2_lab7.scala 16:25]
    node _GEN_1 = mux(_T_1, outReg, outReg) @[Conditional.scala 39:67 Task2_lab7.scala 27:20 Task2_lab7.scala 18:12]
    node _GEN_2 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 Task2_lab7.scala 28:21 Task2_lab7.scala 17:13]
    node _GEN_3 = mux(_T, UInt<1>("h0"), _GEN_1) @[Conditional.scala 40:58 Task2_lab7.scala 22:20]
    node _GEN_4 = mux(_T, UInt<1>("h0"), _GEN_2) @[Conditional.scala 40:58 Task2_lab7.scala 23:21]
    node _GEN_5 = mux(_T, outReg, _GEN_0) @[Conditional.scala 40:58 Task2_lab7.scala 16:25]
    io_out <= _GEN_3
    io_flag <= _GEN_4
    outReg <= mux(reset, UInt<8>("h0"), bits(_GEN_5, 7, 0)) @[Task2_lab7.scala 16:25 Task2_lab7.scala 16:25]
