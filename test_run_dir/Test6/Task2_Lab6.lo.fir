circuit Task2_Lab6 :
  module Task2_Lab6 :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<4>
    output io_out : UInt<4>
    output io_top : UInt<1>

    reg counter : SInt<4>, clock with :
      reset => (UInt<1>("h0"), counter) @[Task2_Lab6.scala 14:26]
    node _max_1_T = shl(asSInt(UInt<2>("h1")), 4) @[Task2_Lab6.scala 15:22]
    node _max_1_T_1 = sub(_max_1_T, asSInt(UInt<2>("h1"))) @[Task2_Lab6.scala 15:31]
    node _max_1_T_2 = tail(_max_1_T_1, 1) @[Task2_Lab6.scala 15:31]
    node max_1 = asSInt(_max_1_T_2) @[Task2_Lab6.scala 15:31]
    node _T = eq(counter, max_1) @[Task2_Lab6.scala 18:19]
    node _T_1 = dshr(counter, UInt<3>("h4")) @[Task2_Lab6.scala 21:23]
    node _T_2 = bits(_T_1, 0, 0) @[Task2_Lab6.scala 21:23]
    node _T_3 = eq(_T_2, UInt<1>("h1")) @[Task2_Lab6.scala 21:29]
    node _counter_T = add(counter, asSInt(UInt<2>("h1"))) @[Task2_Lab6.scala 26:28]
    node _counter_T_1 = tail(_counter_T, 1) @[Task2_Lab6.scala 26:28]
    node _counter_T_2 = asSInt(_counter_T_1) @[Task2_Lab6.scala 26:28]
    node _GEN_0 = mux(_T_3, asSInt(UInt<1>("h0")), _counter_T_2) @[Task2_Lab6.scala 21:37 Task2_Lab6.scala 22:21 Task2_Lab6.scala 26:17]
    node _GEN_1 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[Task2_Lab6.scala 21:37 Task2_Lab6.scala 23:19 Task2_Lab6.scala 27:15]
    node _GEN_2 = mux(_T, asSInt(UInt<1>("h0")), _GEN_0) @[Task2_Lab6.scala 18:30 Task2_Lab6.scala 19:17]
    node _GEN_3 = mux(_T, UInt<1>("h1"), _GEN_1) @[Task2_Lab6.scala 18:30 Task2_Lab6.scala 20:15]
    node _io_out_T = dshr(counter, UInt<4>("hf")) @[Task2_Lab6.scala 29:22]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Task2_Lab6.scala 29:22]
    io_out <= _io_out_T_1 @[Task2_Lab6.scala 29:12]
    io_top <= _GEN_3
    counter <= mux(reset, asSInt(UInt<4>("h0")), _GEN_2) @[Task2_Lab6.scala 14:26 Task2_Lab6.scala 14:26]
