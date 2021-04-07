;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Task4_Lab6 : 
  module Task4_Lab6 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {out : UInt<5>, flip up_down : UInt<1>}
    
    io.out <= UInt<1>("h00") @[Task4_Lab6.scala 10:11]
    reg count_up : UInt<5>, clock with : (reset => (reset, UInt<5>("h00"))) @[Task4_Lab6.scala 11:27]
    reg count_down : UInt<5>, clock with : (reset => (reset, UInt<5>("h05"))) @[Task4_Lab6.scala 12:29]
    node _T = eq(io.up_down, UInt<1>("h01")) @[Task4_Lab6.scala 13:21]
    when _T : @[Task4_Lab6.scala 13:29]
      node _count_up_T = add(count_up, UInt<1>("h01")) @[Task4_Lab6.scala 14:29]
      node _count_up_T_1 = tail(_count_up_T, 1) @[Task4_Lab6.scala 14:29]
      count_up <= _count_up_T_1 @[Task4_Lab6.scala 14:18]
      io.out <= count_up @[Task4_Lab6.scala 15:15]
      skip @[Task4_Lab6.scala 13:29]
    else : @[Task4_Lab6.scala 16:35]
      node _T_1 = eq(io.up_down, UInt<1>("h00")) @[Task4_Lab6.scala 16:27]
      when _T_1 : @[Task4_Lab6.scala 16:35]
        node _count_down_T = sub(count_down, UInt<1>("h01")) @[Task4_Lab6.scala 17:34]
        node _count_down_T_1 = tail(_count_down_T, 1) @[Task4_Lab6.scala 17:34]
        count_down <= _count_down_T_1 @[Task4_Lab6.scala 17:20]
        io.out <= count_down @[Task4_Lab6.scala 18:15]
        skip @[Task4_Lab6.scala 16:35]
    
