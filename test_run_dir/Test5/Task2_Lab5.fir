;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Task2_Lab5 : 
  module Task2_Lab5 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<32>, flip sel : UInt<1>, flip address : UInt<10>, out : UInt<32>}
    
    node _io_out_T = mux(io.sel, io.in, io.address) @[Task2_Lab5.scala 13:18]
    io.out <= _io_out_T @[Task2_Lab5.scala 13:12]
    
