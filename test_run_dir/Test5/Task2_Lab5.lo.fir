circuit Task2_Lab5 :
  module Task2_Lab5 :
    input clock : Clock
    input reset : UInt<1>
    input io_in_data_packet : UInt<32>
    input io_in_address : UInt<10>
    output io_out_data_packet : UInt<32>
    output io_out_address : UInt<10>

    io_out_data_packet <= io_in_data_packet @[Task2_Lab5.scala 17:12]
    io_out_address <= io_in_address @[Task2_Lab5.scala 17:12]
