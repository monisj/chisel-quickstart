circuit Exercise3_Lab5 :
  module Exercise3_Lab5 :
    input clock : Clock
    input reset : UInt<1>
    input io_in_0 : UInt<4>
    input io_in_1 : UInt<4>
    output io_out : UInt<4>

    node _io_out_T = add(io_in_0, io_in_1) @[Ex_test3.scala 10:47]
    node _io_out_T_1 = tail(_io_out_T, 1) @[Ex_test3.scala 10:47]
    io_out <= _io_out_T_1 @[Exercise3_Lab5.scala 11:16]
