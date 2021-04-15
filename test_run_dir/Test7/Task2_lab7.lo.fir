circuit Task2_lab7 :
  module Task2_lab7 :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<1>
    input io_start : UInt<1>
    output io_out : UInt<8>
    output io_flag : UInt<1>

    reg state1_Reg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), state1_Reg) @[Task2_lab7.scala 17:29]
    reg state_Reg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), state_Reg) @[Task2_lab7.scala 18:28]
    node _T = eq(state_Reg, UInt<1>("h0")) @[Task2_lab7.scala 22:20]
    node _T_1 = eq(io_start, UInt<1>("h1")) @[Task2_lab7.scala 23:23]
    node _GEN_0 = mux(_T_1, UInt<1>("h1"), state_Reg) @[Task2_lab7.scala 23:34 Task2_lab7.scala 24:22 Task2_lab7.scala 18:28]
    node _GEN_1 = mux(_T_1, state_Reg, state1_Reg) @[Task2_lab7.scala 23:34 Task2_lab7.scala 20:12 Task2_lab7.scala 26:19]
    node _GEN_2 = mux(_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Task2_lab7.scala 23:34 Task2_lab7.scala 19:13 Task2_lab7.scala 27:20]
    node _T_2 = eq(state_Reg, UInt<1>("h1")) @[Task2_lab7.scala 29:26]
    node _T_3 = eq(io_start, UInt<1>("h0")) @[Task2_lab7.scala 30:23]
    node _state1_Reg_T = dshl(state1_Reg, UInt<1>("h1")) @[Task2_lab7.scala 31:37]
    node _state1_Reg_T_1 = or(_state1_Reg_T, io_in) @[Task2_lab7.scala 31:45]
    node _GEN_3 = mux(_T_3, _state1_Reg_T_1, state1_Reg) @[Task2_lab7.scala 30:35 Task2_lab7.scala 31:23 Task2_lab7.scala 17:29]
    node _GEN_4 = mux(_T_3, state1_Reg, state_Reg) @[Task2_lab7.scala 30:35 Task2_lab7.scala 32:19 Task2_lab7.scala 20:12]
    node _GEN_5 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[Task2_lab7.scala 30:35 Task2_lab7.scala 33:20 Task2_lab7.scala 19:13]
    node _GEN_6 = mux(_T_2, _GEN_3, state1_Reg) @[Task2_lab7.scala 29:37 Task2_lab7.scala 17:29]
    node _GEN_7 = mux(_T_2, _GEN_4, state_Reg) @[Task2_lab7.scala 29:37 Task2_lab7.scala 20:12]
    node _GEN_8 = mux(_T_2, _GEN_5, UInt<1>("h0")) @[Task2_lab7.scala 29:37 Task2_lab7.scala 19:13]
    node _GEN_9 = mux(_T, _GEN_0, state_Reg) @[Task2_lab7.scala 22:31 Task2_lab7.scala 18:28]
    node _GEN_10 = mux(_T, _GEN_1, _GEN_7) @[Task2_lab7.scala 22:31]
    node _GEN_11 = mux(_T, _GEN_2, _GEN_8) @[Task2_lab7.scala 22:31]
    node _GEN_12 = mux(_T, state1_Reg, _GEN_6) @[Task2_lab7.scala 22:31 Task2_lab7.scala 17:29]
    io_out <= _GEN_10
    io_flag <= _GEN_11
    state1_Reg <= mux(reset, UInt<8>("h0"), bits(_GEN_12, 7, 0)) @[Task2_lab7.scala 17:29 Task2_lab7.scala 17:29]
    state_Reg <= mux(reset, UInt<1>("h0"), _GEN_9) @[Task2_lab7.scala 18:28 Task2_lab7.scala 18:28]
