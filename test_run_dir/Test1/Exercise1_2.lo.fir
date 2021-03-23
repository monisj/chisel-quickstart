circuit Exercise1_2 :
  module Exercise1_2 :
    input clock : Clock
    input reset : UInt<1>
    input io_in_A : UInt<32>
    input io_in_B : UInt<32>
    input io_select : UInt<1>
    output io_out : UInt<32>

    node _io_out_T = and(io_in_A, io_select) @[Exercise1_2.scala 11:22]
    node _io_out_T_1 = not(io_select) @[Exercise1_2.scala 11:47]
    node _io_out_T_2 = and(io_in_B, _io_out_T_1) @[Exercise1_2.scala 11:44]
    node _io_out_T_3 = or(_io_out_T, _io_out_T_2) @[Exercise1_2.scala 11:34]
    io_out <= _io_out_T_3 @[Exercise1_2.scala 11:11]
