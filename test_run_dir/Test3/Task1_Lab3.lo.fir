circuit Task1_Lab3 :
  module Exercise2_Lab3 :
    input clock : Clock
    input reset : UInt<1>
    input io_A : SInt<32>
    input io_B : SInt<32>
    output io_x : SInt<32>
    output io_AluBranch : UInt<1>
    input io_Aluop : UInt<5>

    node _T = eq(UInt<1>("h0"), io_Aluop) @[Conditional.scala 37:30]
    node _io_x_T = add(io_A, io_B) @[Exercise2_Lab3.scala 18:23]
    node _io_x_T_1 = tail(_io_x_T, 1) @[Exercise2_Lab3.scala 18:23]
    node _io_x_T_2 = asSInt(_io_x_T_1) @[Exercise2_Lab3.scala 18:23]
    node _T_1 = eq(UInt<4>("h9"), io_Aluop) @[Conditional.scala 37:30]
    node _io_x_T_3 = mul(io_A, io_B) @[Exercise2_Lab3.scala 21:37]
    node _T_2 = eq(UInt<1>("h1"), io_Aluop) @[Conditional.scala 37:30]
    node sbt3 = bits(io_B, 4, 0) @[Exercise2_Lab3.scala 25:40]
    node sbt4 = dshl(io_A, sbt3) @[Exercise2_Lab3.scala 26:40]
    node _T_3 = eq(UInt<5>("h1f"), io_Aluop) @[Conditional.scala 37:30]
    node _T_4 = eq(UInt<2>("h2"), io_Aluop) @[Conditional.scala 37:30]
    node _T_5 = lt(io_A, io_B) @[Exercise2_Lab3.scala 34:23]
    node _GEN_0 = mux(_T_5, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[Exercise2_Lab3.scala 34:30 Exercise2_Lab3.scala 35:30 Exercise2_Lab3.scala 37:30]
    node _T_6 = eq(UInt<2>("h3"), io_Aluop) @[Conditional.scala 37:30]
    node _T_7 = lt(io_A, io_B) @[Exercise2_Lab3.scala 43:33]
    node _GEN_1 = mux(_T_7, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[Exercise2_Lab3.scala 43:38 Exercise2_Lab3.scala 44:38 Exercise2_Lab3.scala 46:38]
    node _T_8 = eq(UInt<5>("h16"), io_Aluop) @[Conditional.scala 37:30]
    node _T_9 = lt(io_A, io_B) @[Exercise2_Lab3.scala 52:33]
    node _GEN_2 = mux(_T_9, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[Exercise2_Lab3.scala 52:38 Exercise2_Lab3.scala 53:38 Exercise2_Lab3.scala 55:38]
    node _T_10 = eq(UInt<3>("h4"), io_Aluop) @[Conditional.scala 37:30]
    node _io_x_T_4 = xor(io_A, io_B) @[Exercise2_Lab3.scala 59:26]
    node _io_x_T_5 = asSInt(_io_x_T_4) @[Exercise2_Lab3.scala 59:26]
    node _T_11 = eq(UInt<3>("h5"), io_Aluop) @[Conditional.scala 37:30]
    node _shift_T = bits(io_B, 4, 0) @[Exercise2_Lab3.scala 62:37]
    node shift = dshr(io_A, _shift_T) @[Exercise2_Lab3.scala 62:30]
    node _T_12 = eq(UInt<4>("hd"), io_Aluop) @[Conditional.scala 37:30]
    node _shift_T_1 = bits(io_B, 4, 0) @[Exercise2_Lab3.scala 66:37]
    node shift_1 = dshr(io_A, _shift_T_1) @[Exercise2_Lab3.scala 66:30]
    node _T_13 = eq(UInt<3>("h6"), io_Aluop) @[Conditional.scala 37:30]
    node _io_x_T_6 = or(io_A, io_B) @[Exercise2_Lab3.scala 70:26]
    node _io_x_T_7 = asSInt(_io_x_T_6) @[Exercise2_Lab3.scala 70:26]
    node _T_14 = eq(UInt<3>("h7"), io_Aluop) @[Conditional.scala 37:30]
    node _io_x_T_8 = and(io_A, io_B) @[Exercise2_Lab3.scala 73:26]
    node _io_x_T_9 = asSInt(_io_x_T_8) @[Exercise2_Lab3.scala 73:26]
    node _T_15 = eq(UInt<4>("h8"), io_Aluop) @[Conditional.scala 37:30]
    node _io_x_T_10 = sub(io_A, io_B) @[Exercise2_Lab3.scala 76:26]
    node _io_x_T_11 = tail(_io_x_T_10, 1) @[Exercise2_Lab3.scala 76:26]
    node _io_x_T_12 = asSInt(_io_x_T_11) @[Exercise2_Lab3.scala 76:26]
    node _T_16 = eq(UInt<5>("h10"), io_Aluop) @[Conditional.scala 37:30]
    node _T_17 = eq(io_A, io_B) @[Exercise2_Lab3.scala 79:22]
    node _GEN_3 = mux(_T_17, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[Exercise2_Lab3.scala 79:31 Exercise2_Lab3.scala 80:38 Exercise2_Lab3.scala 82:38]
    node _T_18 = eq(UInt<5>("h11"), io_Aluop) @[Conditional.scala 37:30]
    node _T_19 = eq(io_A, io_B) @[Exercise2_Lab3.scala 86:23]
    node _GEN_4 = mux(_T_19, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[Exercise2_Lab3.scala 86:32 Exercise2_Lab3.scala 87:38 Exercise2_Lab3.scala 89:38]
    node _T_20 = eq(UInt<5>("h14"), io_Aluop) @[Conditional.scala 37:30]
    node _T_21 = lt(io_A, io_B) @[Exercise2_Lab3.scala 93:23]
    node _GEN_5 = mux(_T_21, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[Exercise2_Lab3.scala 93:30 Exercise2_Lab3.scala 94:38 Exercise2_Lab3.scala 96:38]
    node _T_22 = eq(UInt<5>("h15"), io_Aluop) @[Conditional.scala 37:30]
    node _T_23 = geq(io_A, io_B) @[Exercise2_Lab3.scala 100:23]
    node _GEN_6 = mux(_T_23, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[Exercise2_Lab3.scala 100:31 Exercise2_Lab3.scala 101:38 Exercise2_Lab3.scala 103:38]
    node _T_24 = eq(UInt<5>("h17"), io_Aluop) @[Conditional.scala 37:30]
    node a3 = asUInt(io_A) @[Exercise2_Lab3.scala 107:27]
    node b3 = asUInt(io_B) @[Exercise2_Lab3.scala 108:39]
    node _T_25 = geq(a3, b3) @[Exercise2_Lab3.scala 109:33]
    node _GEN_7 = mux(_T_25, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[Exercise2_Lab3.scala 109:39 Exercise2_Lab3.scala 110:38 Exercise2_Lab3.scala 112:38]
    node _GEN_8 = mux(_T_24, _GEN_7, asSInt(UInt<1>("h0"))) @[Conditional.scala 39:67 Exercise2_Lab3.scala 15:22]
    node _GEN_9 = mux(_T_22, _GEN_6, _GEN_8) @[Conditional.scala 39:67]
    node _GEN_10 = mux(_T_20, _GEN_5, _GEN_9) @[Conditional.scala 39:67]
    node _GEN_11 = mux(_T_18, _GEN_4, _GEN_10) @[Conditional.scala 39:67]
    node _GEN_12 = mux(_T_16, _GEN_3, _GEN_11) @[Conditional.scala 39:67]
    node _GEN_13 = mux(_T_15, _io_x_T_12, _GEN_12) @[Conditional.scala 39:67 Exercise2_Lab3.scala 76:18]
    node _GEN_14 = mux(_T_14, _io_x_T_9, _GEN_13) @[Conditional.scala 39:67 Exercise2_Lab3.scala 73:18]
    node _GEN_15 = mux(_T_13, _io_x_T_7, _GEN_14) @[Conditional.scala 39:67 Exercise2_Lab3.scala 70:18]
    node _GEN_16 = mux(_T_12, shift_1, _GEN_15) @[Conditional.scala 39:67 Exercise2_Lab3.scala 67:26]
    node _GEN_17 = mux(_T_11, shift, _GEN_16) @[Conditional.scala 39:67 Exercise2_Lab3.scala 63:26]
    node _GEN_18 = mux(_T_10, _io_x_T_5, _GEN_17) @[Conditional.scala 39:67 Exercise2_Lab3.scala 59:18]
    node _GEN_19 = mux(_T_8, _GEN_2, _GEN_18) @[Conditional.scala 39:67]
    node _GEN_20 = mux(_T_6, _GEN_1, _GEN_19) @[Conditional.scala 39:67]
    node _GEN_21 = mux(_T_4, _GEN_0, _GEN_20) @[Conditional.scala 39:67]
    node _GEN_22 = mux(_T_3, io_A, _GEN_21) @[Conditional.scala 39:67 Exercise2_Lab3.scala 31:17]
    node _GEN_23 = mux(_T_2, sbt4, _GEN_22) @[Conditional.scala 39:67 Exercise2_Lab3.scala 28:30]
    node _GEN_24 = mux(_T_1, _io_x_T_3, _GEN_23) @[Conditional.scala 39:67 Exercise2_Lab3.scala 21:30]
    node _GEN_25 = mux(_T, _io_x_T_2, _GEN_24) @[Conditional.scala 40:58 Exercise2_Lab3.scala 18:17]
    node _T_26 = bits(io_Aluop, 4, 3) @[Exercise2_Lab3.scala 116:30]
    node _T_27 = eq(_T_26, UInt<2>("h2")) @[Exercise2_Lab3.scala 116:36]
    node _T_28 = eq(io_x, asSInt(UInt<2>("h1"))) @[Exercise2_Lab3.scala 116:56]
    node _T_29 = and(_T_27, _T_28) @[Exercise2_Lab3.scala 116:48]
    node _GEN_26 = mux(_T_29, UInt<1>("h1"), UInt<1>("h0")) @[Exercise2_Lab3.scala 116:64 Exercise2_Lab3.scala 117:30 Exercise2_Lab3.scala 119:30]
    io_x <= asSInt(bits(_GEN_25, 31, 0))
    io_AluBranch <= _GEN_26

  module ALU_control :
    input clock : Clock
    input reset : UInt<1>
    input io_Aluop : UInt<3>
    input io_Func7 : UInt<7>
    input io_Func3 : UInt<3>
    output io_control : UInt<5>

    node _T = eq(io_Aluop, UInt<1>("h0")) @[ALU_control.scala 15:31]
    node _T_1 = eq(io_Func7, UInt<1>("h1")) @[ALU_control.scala 16:39]
    node io_control_hi = cat(UInt<1>("h0"), io_Func7) @[Cat.scala 30:58]
    node _io_control_T = cat(io_control_hi, io_Func3) @[Cat.scala 30:58]
    node _GEN_0 = mux(_T_1, UInt<4>("h9"), _io_control_T) @[ALU_control.scala 16:56 ALU_control.scala 17:43 ALU_control.scala 19:43]
    node _T_2 = eq(io_Aluop, UInt<3>("h4")) @[ALU_control.scala 21:37]
    node _T_3 = eq(io_Aluop, UInt<3>("h5")) @[ALU_control.scala 23:37]
    node _T_4 = eq(io_Aluop, UInt<1>("h1")) @[ALU_control.scala 25:37]
    node _T_5 = eq(io_Func3, UInt<3>("h5")) @[ALU_control.scala 26:31]
    node io_control_hi_1 = cat(UInt<1>("h0"), io_Func7) @[Cat.scala 30:58]
    node _io_control_T_1 = cat(io_control_hi_1, io_Func3) @[Cat.scala 30:58]
    node io_control_hi_2 = cat(UInt<1>("h0"), UInt<1>("h0")) @[Cat.scala 30:58]
    node _io_control_T_2 = cat(io_control_hi_2, io_Func3) @[Cat.scala 30:58]
    node _GEN_1 = mux(_T_5, _io_control_T_1, _io_control_T_2) @[ALU_control.scala 26:44 ALU_control.scala 27:35 ALU_control.scala 29:28]
    node _T_6 = eq(io_Aluop, UInt<2>("h2")) @[ALU_control.scala 32:36]
    node _io_control_T_3 = cat(UInt<2>("h2"), io_Func3) @[Cat.scala 30:58]
    node _T_7 = eq(io_Aluop, UInt<2>("h3")) @[ALU_control.scala 34:37]
    node _T_8 = eq(io_Aluop, UInt<3>("h6")) @[ALU_control.scala 36:37]
    node _GEN_2 = validif(_T_8, UInt<1>("h0")) @[ALU_control.scala 36:49 ALU_control.scala 37:35]
    node _GEN_3 = mux(_T_7, UInt<5>("h1f"), _GEN_2) @[ALU_control.scala 34:49 ALU_control.scala 35:35]
    node _GEN_4 = mux(_T_6, _io_control_T_3, _GEN_3) @[ALU_control.scala 32:48 ALU_control.scala 33:35]
    node _GEN_5 = mux(_T_4, _GEN_1, _GEN_4) @[ALU_control.scala 25:49]
    node _GEN_6 = mux(_T_3, UInt<1>("h0"), _GEN_5) @[ALU_control.scala 23:49 ALU_control.scala 24:35]
    node _GEN_7 = mux(_T_2, UInt<1>("h0"), _GEN_6) @[ALU_control.scala 21:50 ALU_control.scala 22:35]
    node _GEN_8 = mux(_T, _GEN_0, _GEN_7) @[ALU_control.scala 15:43]
    io_control <= bits(_GEN_8, 4, 0)

  module Task1_Lab3 :
    input clock : Clock
    input reset : UInt<1>
    input io_fnct3 : UInt<3>
    input io_fnct7 : UInt<7>
    input io_Aluop : UInt<3>
    input io_branch : UInt<1>
    input io_arg_x : SInt<32>
    input io_arg_y : SInt<32>
    output io_br_taken : UInt<1>

    inst alu of Exercise2_Lab3 @[Task1_Lab3.scala 16:21]
    inst alucontrol of ALU_control @[Task1_Lab3.scala 17:29]
    node _T = eq(alu.io_AluBranch, UInt<1>("h1")) @[Task1_Lab3.scala 29:40]
    node _T_1 = and(io_branch, _T) @[Task1_Lab3.scala 29:21]
    node _GEN_0 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[Task1_Lab3.scala 29:48 Task1_Lab3.scala 30:20 Task1_Lab3.scala 32:20]
    io_br_taken <= _GEN_0
    alu.clock <= clock
    alu.reset <= reset
    alu.io_A <= io_arg_x @[Task1_Lab3.scala 25:13]
    alu.io_B <= io_arg_y @[Task1_Lab3.scala 26:13]
    alu.io_Aluop <= alucontrol.io_control @[Task1_Lab3.scala 27:17]
    alucontrol.clock <= clock
    alucontrol.reset <= reset
    alucontrol.io_Aluop <= io_Aluop @[Task1_Lab3.scala 20:24]
    alucontrol.io_Func7 <= io_fnct7 @[Task1_Lab3.scala 21:24]
    alucontrol.io_Func3 <= io_fnct3 @[Task1_Lab3.scala 22:24]
