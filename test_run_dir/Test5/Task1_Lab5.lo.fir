circuit Task1_Lab5 :
  module Task1_Lab5 :
    input clock : Clock
    input reset : UInt<1>
    input io_in_0 : UInt<32>
    input io_in_1 : UInt<32>
    output io_sum_out : UInt<32>

    node _io_sum_out_T = add(io_in_0, io_in_1) @[Task1_Lab5.scala 14:27]
    node _io_sum_out_T_1 = tail(_io_sum_out_T, 1) @[Task1_Lab5.scala 14:27]
    io_sum_out <= _io_sum_out_T_1 @[Task1_Lab5.scala 14:16]
