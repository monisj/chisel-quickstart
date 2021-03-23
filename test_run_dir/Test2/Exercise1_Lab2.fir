;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Exercise1_Lab2 : 
  module Exercise1_Lab2 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in_A : UInt<32>, flip in_B : UInt<32>, flip select : UInt<1>, out : UInt<32>}
    
    io.out <= UInt<1>("h00") @[Exercise1_Lab2.scala 13:11]
    node _T = eq(UInt<1>("h01"), UInt<1>("h01")) @[Exercise1_Lab2.scala 14:29]
    node _T_1 = and(io.select, _T) @[Exercise1_Lab2.scala 14:20]
    when _T_1 : @[Exercise1_Lab2.scala 14:37]
      io.out <= io.in_A @[Exercise1_Lab2.scala 15:15]
      skip @[Exercise1_Lab2.scala 14:37]
    else : @[Exercise1_Lab2.scala 16:35]
      node _T_2 = not(io.select) @[Exercise1_Lab2.scala 16:16]
      node _T_3 = eq(_T_2, UInt<1>("h01")) @[Exercise1_Lab2.scala 16:27]
      when _T_3 : @[Exercise1_Lab2.scala 16:35]
        io.out <= io.in_B @[Exercise1_Lab2.scala 17:15]
        skip @[Exercise1_Lab2.scala 16:35]
    
