;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Exercise2 : 
  module Exercise2 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {result : UInt<1>}
    
    node _max_T = dshl(asSInt(UInt<2>("h01")), UInt<4>("h0a")) @[Exercise2.scala 8:20]
    node _max_T_1 = sub(_max_T, asSInt(UInt<2>("h01"))) @[Exercise2.scala 8:37]
    node _max_T_2 = tail(_max_T_1, 1) @[Exercise2.scala 8:37]
    node max = asSInt(_max_T_2) @[Exercise2.scala 8:37]
    reg count : SInt<4>, clock with : (reset => (reset, asSInt(UInt<4>("h00")))) @[Exercise2.scala 9:25]
    node _T = eq(count, max) @[Exercise2.scala 12:17]
    when _T : @[Exercise2.scala 12:26]
      count <= asSInt(UInt<1>("h00")) @[Exercise2.scala 13:15]
      skip @[Exercise2.scala 12:26]
    else : @[Exercise2.scala 14:36]
      node _T_1 = dshr(count, UInt<4>("h0f")) @[Exercise2.scala 14:21]
      node _T_2 = bits(_T_1, 0, 0) @[Exercise2.scala 14:21]
      node _T_3 = eq(_T_2, UInt<1>("h01")) @[Exercise2.scala 14:28]
      when _T_3 : @[Exercise2.scala 14:36]
        count <= asSInt(UInt<1>("h00")) @[Exercise2.scala 15:19]
        skip @[Exercise2.scala 14:36]
      else : @[Exercise2.scala 16:18]
        node _count_T = add(count, asSInt(UInt<2>("h01"))) @[Exercise2.scala 17:24]
        node _count_T_1 = tail(_count_T, 1) @[Exercise2.scala 17:24]
        node _count_T_2 = asSInt(_count_T_1) @[Exercise2.scala 17:24]
        count <= _count_T_2 @[Exercise2.scala 17:15]
        skip @[Exercise2.scala 16:18]
    node _io_result_T = dshr(count, UInt<4>("h0f")) @[Exercise2.scala 19:23]
    node _io_result_T_1 = bits(_io_result_T, 0, 0) @[Exercise2.scala 19:23]
    io.result <= _io_result_T_1 @[Exercise2.scala 19:15]
    
