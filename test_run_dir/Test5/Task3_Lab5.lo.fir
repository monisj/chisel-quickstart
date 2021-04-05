circuit Task3_Lab5 :
  module Task3_Lab5 :
    input clock : Clock
    input reset : UInt<1>
    output io_out : UInt<32>
    input io_in1 : UInt<32>
    input io_in2 : UInt<32>
    input io_sel : UInt<1>

    node _io_out_T = mux(io_sel, io_in1, io_in2) @[Task3_Lab5.scala 17:13]
    io_out <= _io_out_T @[Task3_Lab5.scala 14:12]
