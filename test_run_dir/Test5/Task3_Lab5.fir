;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Task3_Lab5 : 
  module Task3_Lab5 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {out : UInt<32>, flip in1 : UInt<32>, flip in2 : UInt<32>, flip sel : UInt<1>}
    
    node _io_out_T = mux(io.sel, io.in1, io.in2) @[Task3_Lab5.scala 17:13]
    io.out <= _io_out_T @[Task3_Lab5.scala 14:12]
    
