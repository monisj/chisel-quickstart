;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Test1_12 : 
  module Test1_12 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip value1 : UInt<4>, output : UInt<4>}
    
    io.output <= io.value1 @[Test1_12.scala 13:12]
    
