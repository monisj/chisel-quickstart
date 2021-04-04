;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Exercise3_Lab5 : 
  module Exercise3_Lab5 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<4>[2], out : UInt<4>}
    
    node _io_out_T = add(io.in[0], io.in[1]) @[Ex_test3.scala 10:47]
    node _io_out_T_1 = tail(_io_out_T, 1) @[Ex_test3.scala 10:47]
    io.out <= _io_out_T_1 @[Exercise3_Lab5.scala 11:16]
    
