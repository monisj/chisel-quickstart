;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Exercise1_Lab6 : 
  module Exercise1_Lab6 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<4>, out : UInt<4>}
    
    reg state : UInt<4>, clock with : (reset => (reset, UInt<4>("h04"))) @[Exercise1_Lab6.scala 22:25]
    state <= io.in @[Exercise1_Lab6.scala 23:10]
    io.out <= state @[Exercise1_Lab6.scala 24:11]
    
