;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Task2_Lab6 : 
  module Task2_Lab6 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<4>, out : UInt<4>, top : UInt<1>}
    
    reg counter : SInt<4>, clock with : (reset => (reset, asSInt(UInt<4>("h00")))) @[Task2_Lab6.scala 14:26]
    io.out <= UInt<1>("h00") @[Task2_Lab6.scala 15:11]
    io.top <= UInt<1>("h00") @[Task2_Lab6.scala 16:11]
    node _T = dshr(counter, UInt<3>("h04")) @[Task2_Lab6.scala 17:17]
    node _T_1 = bits(_T, 0, 0) @[Task2_Lab6.scala 17:17]
    node _T_2 = eq(UInt<1>("h01"), UInt<1>("h00")) @[Task2_Lab6.scala 17:29]
    node _T_3 = xor(_T_1, _T_2) @[Task2_Lab6.scala 17:23]
    when _T_3 : @[Task2_Lab6.scala 17:37]
      counter <= asSInt(UInt<1>("h00")) @[Task2_Lab6.scala 18:21]
      io.top <= UInt<1>("h01") @[Task2_Lab6.scala 19:19]
      skip @[Task2_Lab6.scala 17:37]
    else : @[Task2_Lab6.scala 21:18]
      node _counter_T = add(counter, asSInt(UInt<2>("h01"))) @[Task2_Lab6.scala 22:28]
      node _counter_T_1 = tail(_counter_T, 1) @[Task2_Lab6.scala 22:28]
      node _counter_T_2 = asSInt(_counter_T_1) @[Task2_Lab6.scala 22:28]
      counter <= _counter_T_2 @[Task2_Lab6.scala 22:17]
      io.top <= UInt<1>("h00") @[Task2_Lab6.scala 23:15]
      skip @[Task2_Lab6.scala 21:18]
    node _io_out_T = dshr(counter, UInt<4>("h0f")) @[Task2_Lab6.scala 25:22]
    node _io_out_T_1 = bits(_io_out_T, 0, 0) @[Task2_Lab6.scala 25:22]
    io.out <= _io_out_T_1 @[Task2_Lab6.scala 25:12]
    
