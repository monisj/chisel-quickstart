;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Task1_Lab5 : 
  module Task1_Lab5 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in_0 : UInt<32>, flip in_1 : UInt<32>, sum_out : UInt<32>}
    
    node _io_sum_out_T = add(io.in_0, io.in_1) @[Task1_Lab5.scala 14:27]
    node _io_sum_out_T_1 = tail(_io_sum_out_T, 1) @[Task1_Lab5.scala 14:27]
    io.sum_out <= _io_sum_out_T_1 @[Task1_Lab5.scala 14:16]
    
