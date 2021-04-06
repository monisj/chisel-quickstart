;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Task2_Lab5 : 
  module Task2_Lab5 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : {data_packet : UInt<32>, address : UInt<10>}, out : {data_packet : UInt<32>, address : UInt<10>}}
    
    io.out.address <= io.in.address @[Task2_Lab5.scala 17:12]
    io.out.data_packet <= io.in.data_packet @[Task2_Lab5.scala 17:12]
    
