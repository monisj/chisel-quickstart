;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Exercise1_2 : 
  module Exercise1_2 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in_A : UInt<32>, flip in_B : UInt<32>, flip select : UInt<1>, out : UInt<32>}
    
    node _io_out_T = and(io.in_A, io.select) @[Exercise1_2.scala 11:22]
    node _io_out_T_1 = not(io.select) @[Exercise1_2.scala 11:47]
    node _io_out_T_2 = and(io.in_B, _io_out_T_1) @[Exercise1_2.scala 11:44]
    node _io_out_T_3 = or(_io_out_T, _io_out_T_2) @[Exercise1_2.scala 11:34]
    io.out <= _io_out_T_3 @[Exercise1_2.scala 11:11]
    
