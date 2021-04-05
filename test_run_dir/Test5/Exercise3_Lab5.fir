;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Exercise3_Lab5 : 
  module Exercise3_Lab5 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<4>[2], out : UInt<4>[2]}
    
    io.out[0] <= UInt<1>("h00") @[Exercise3_Lab5.scala 11:18]
    node _io_out_1_T = add(io.in[0], io.in[1]) @[Ex_test3.scala 10:47]
    node _io_out_1_T_1 = tail(_io_out_1_T, 1) @[Ex_test3.scala 10:47]
    io.out[1] <= _io_out_1_T_1 @[Exercise3_Lab5.scala 12:19]
    
