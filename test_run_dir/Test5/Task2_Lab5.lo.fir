circuit Task2_Lab5 :
  module Task2_Lab5 :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<32>
    input io_sel : UInt<1>
    input io_address : UInt<10>
    output io_out : UInt<32>

    node _io_out_T = mux(io_sel, io_in, io_address) @[Task2_Lab5.scala 13:18]
    io_out <= _io_out_T @[Task2_Lab5.scala 13:12]
