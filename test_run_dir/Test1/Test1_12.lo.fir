circuit Test1_12 :
  module Test1_12 :
    input clock : Clock
    input reset : UInt<1>
    input io_value1 : UInt<4>
    output io_output : UInt<4>

    io_output <= io_value1 @[Test1_12.scala 13:12]
