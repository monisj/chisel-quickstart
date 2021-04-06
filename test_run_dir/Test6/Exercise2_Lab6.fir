;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Exercise2_Lab6 : 
  module Exercise2_Lab6 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {out : UInt<4>}
    
    reg counter : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[Exercise2_Lab6.scala 9:27]
    node _count_buffer_T = and(UInt<1>("h01"), UInt<1>("h01")) @[Exercise2_Lab6.scala 11:47]
    node _count_buffer_T_1 = add(counter, UInt<1>("h01")) @[Exercise2_Lab6.scala 11:72]
    node _count_buffer_T_2 = tail(_count_buffer_T_1, 1) @[Exercise2_Lab6.scala 11:72]
    node _count_buffer_T_3 = eq(counter, UInt<5>("h010")) @[Exercise2_Lab6.scala 11:93]
    node _count_buffer_T_4 = add(counter, UInt<1>("h01")) @[Exercise2_Lab6.scala 12:29]
    node _count_buffer_T_5 = tail(_count_buffer_T_4, 1) @[Exercise2_Lab6.scala 12:29]
    node _count_buffer_T_6 = mux(_count_buffer_T_3, UInt<1>("h00"), _count_buffer_T_5) @[Exercise2_Lab6.scala 11:83]
    node count_buffer = mux(_count_buffer_T, _count_buffer_T_2, _count_buffer_T_6) @[Exercise2_Lab6.scala 11:28]
    counter <= count_buffer @[Exercise2_Lab6.scala 18:13]
    io.out <= counter @[Exercise2_Lab6.scala 19:14]
    
