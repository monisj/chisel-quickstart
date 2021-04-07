;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Task2_Lab6 : 
  module Task2_Lab6 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<4>, out : UInt<4>, top : UInt<1>}
    
    reg counter : SInt<4>, clock with : (reset => (reset, asSInt(UInt<4>("h00")))) @[Task2_Lab6.scala 14:26]
    node _max_1_T = shl(asSInt(UInt<2>("h01")), 4) @[Task2_Lab6.scala 15:22]
    node _max_1_T_1 = sub(_max_1_T, asSInt(UInt<2>("h01"))) @[Task2_Lab6.scala 15:31]
    node _max_1_T_2 = tail(_max_1_T_1, 1) @[Task2_Lab6.scala 15:31]
    node max_1 = asSInt(_max_1_T_2) @[Task2_Lab6.scala 15:31]
    io.out <= UInt<1>("h00") @[Task2_Lab6.scala 16:11]
    io.top <= UInt<1>("h00") @[Task2_Lab6.scala 17:11]
    node _T = eq(counter, max_1) @[Task2_Lab6.scala 18:19]
    when _T : @[Task2_Lab6.scala 18:30]
      counter <= asSInt(UInt<1>("h00")) @[Task2_Lab6.scala 19:17]
      io.top <= UInt<1>("h01") @[Task2_Lab6.scala 20:15]
      skip @[Task2_Lab6.scala 18:30]
    else : @[Task2_Lab6.scala 21:37]
      node _T_1 = dshr(counter, UInt<3>("h04")) @[Task2_Lab6.scala 21:23]
      node _T_2 = bits(_T_1, 0, 0) @[Task2_Lab6.scala 21:23]
      node _T_3 = eq(_T_2, UInt<1>("h01")) @[Task2_Lab6.scala 21:29]
      when _T_3 : @[Task2_Lab6.scala 21:37]
        counter <= asSInt(UInt<1>("h00")) @[Task2_Lab6.scala 22:21]
        io.top <= UInt<1>("h01") @[Task2_Lab6.scala 23:19]
        skip @[Task2_Lab6.scala 21:37]
      else : @[Task2_Lab6.scala 25:18]
        node _counter_T = add(counter, asSInt(UInt<2>("h01"))) @[Task2_Lab6.scala 26:28]
        node _counter_T_1 = tail(_counter_T, 1) @[Task2_Lab6.scala 26:28]
        node _counter_T_2 = asSInt(_counter_T_1) @[Task2_Lab6.scala 26:28]
        counter <= _counter_T_2 @[Task2_Lab6.scala 26:17]
        io.top <= UInt<1>("h00") @[Task2_Lab6.scala 27:15]
        skip @[Task2_Lab6.scala 25:18]
    node _io_out_T = dshr(counter, UInt<4>("h0f")) @[Task2_Lab6.scala 29:22]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Task2_Lab6.scala 29:22]
    io.out <= _io_out_T_1 @[Task2_Lab6.scala 29:12]
    
