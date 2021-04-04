;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Exercise2_Lab5 : 
  module Exercise2_Lab5 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {out : UInt<32>, flip in_1 : UInt<32>, flip in_2 : UInt<32>, flip sel_in : UInt<1>}
    
    node _io_out_T = mux(io.sel_in, io.in_2, io.in_1) @[Exercise2_Lab5.scala 15:18]
    io.out <= _io_out_T @[Exercise2_Lab5.scala 15:12]
    
