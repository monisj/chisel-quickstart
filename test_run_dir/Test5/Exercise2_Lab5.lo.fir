circuit Exercise2_Lab5 :
  module Exercise2_Lab5 :
    input clock : Clock
    input reset : UInt<1>
    output io_out : UInt<32>
    input io_in_1 : UInt<32>
    input io_in_2 : UInt<32>
    input io_sel_in : UInt<1>

    node _io_out_T = mux(io_sel_in, io_in_2, io_in_1) @[Exercise2_Lab5.scala 15:18]
    io_out <= _io_out_T @[Exercise2_Lab5.scala 15:12]
