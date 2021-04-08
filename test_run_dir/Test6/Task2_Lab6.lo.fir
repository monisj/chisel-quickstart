circuit Task2_Lab6 :
  module Task2_Lab6 :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<4>
    output io_out : UInt<4>
    output io_top : UInt<1>

    reg counter : SInt<4>, clock with :
      reset => (UInt<1>("h0"), counter) @[Task2_Lab6.scala 14:26]
    node _T = dshr(counter, UInt<3>("h4")) @[Task2_Lab6.scala 17:17]
    node _T_1 = bits(_T, 0, 0) @[Task2_Lab6.scala 17:17]
    node _T_2 = eq(UInt<1>("h1"), UInt<1>("h0")) @[Task2_Lab6.scala 17:29]
    node _T_3 = xor(_T_1, _T_2) @[Task2_Lab6.scala 17:23]
    node _counter_T = add(counter, asSInt(UInt<2>("h1"))) @[Task2_Lab6.scala 22:28]
    node _counter_T_1 = tail(_counter_T, 1) @[Task2_Lab6.scala 22:28]
    node _counter_T_2 = asSInt(_counter_T_1) @[Task2_Lab6.scala 22:28]
    node _GEN_0 = mux(_T_3, asSInt(UInt<1>("h0")), _counter_T_2) @[Task2_Lab6.scala 17:37 Task2_Lab6.scala 18:21 Task2_Lab6.scala 22:17]
    node _GEN_1 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[Task2_Lab6.scala 17:37 Task2_Lab6.scala 19:19 Task2_Lab6.scala 23:15]
    node _io_out_T = dshr(counter, UInt<4>("hf")) @[Task2_Lab6.scala 25:22]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Task2_Lab6.scala 25:22]
    io_out <= _io_out_T_1 @[Task2_Lab6.scala 25:12]
    io_top <= _GEN_1
    counter <= mux(reset, asSInt(UInt<4>("h0")), _GEN_0) @[Task2_Lab6.scala 14:26 Task2_Lab6.scala 14:26]
