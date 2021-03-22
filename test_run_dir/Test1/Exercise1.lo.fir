circuit Exercise1 :
  module Exercise1 :
    input clock : Clock
    input reset : UInt<1>
    output io_result : UInt<1>

    node _max_T = dshl(asSInt(UInt<2>("h1")), UInt<3>("h4")) @[Exercise1.scala 9:20]
    node _max_T_1 = sub(_max_T, asSInt(UInt<2>("h1"))) @[Exercise1.scala 9:37]
    node _max_T_2 = tail(_max_T_1, 1) @[Exercise1.scala 9:37]
    node max = asSInt(_max_T_2) @[Exercise1.scala 9:37]
    reg count : SInt<16>, clock with :
      reset => (UInt<1>("h0"), count) @[Exercise1.scala 10:25]
    node _T = eq(count, max) @[Exercise1.scala 12:17]
    node _count_T = add(count, asSInt(UInt<2>("h1"))) @[Exercise1.scala 15:24]
    node _count_T_1 = tail(_count_T, 1) @[Exercise1.scala 15:24]
    node _count_T_2 = asSInt(_count_T_1) @[Exercise1.scala 15:24]
    node _GEN_0 = mux(_T, asSInt(UInt<1>("h0")), _count_T_2) @[Exercise1.scala 12:27 Exercise1.scala 13:15 Exercise1.scala 15:15]
    node _io_result_T = dshr(count, UInt<4>("hf")) @[Exercise1.scala 17:23]
    node _io_result_T_1 = bits(_io_result_T, 0, 0) @[Exercise1.scala 17:23]
    io_result <= _io_result_T_1 @[Exercise1.scala 17:15]
    count <= mux(reset, asSInt(UInt<16>("h0")), _GEN_0) @[Exercise1.scala 10:25 Exercise1.scala 10:25]
