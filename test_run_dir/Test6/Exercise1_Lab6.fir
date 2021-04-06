;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Exercise1_Lab6 : 
  module Exercise1_Lab6 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<4>[4], out : UInt<4>}
    
    reg register : UInt<32>[32], clock @[Exercise1_Lab6.scala 22:23]
    register[0] <= io.in[0] @[Exercise1_Lab6.scala 24:20]
    register[1] <= io.in[1] @[Exercise1_Lab6.scala 24:20]
    register[2] <= io.in[2] @[Exercise1_Lab6.scala 24:20]
    register[3] <= io.in[3] @[Exercise1_Lab6.scala 24:20]
    io.out <= register[0] @[Exercise1_Lab6.scala 28:15]
    io.out <= register[1] @[Exercise1_Lab6.scala 28:15]
    io.out <= register[2] @[Exercise1_Lab6.scala 28:15]
    io.out <= register[3] @[Exercise1_Lab6.scala 28:15]
    
