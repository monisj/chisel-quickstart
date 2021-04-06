circuit Exercise1_Lab6 :
  module Exercise1_Lab6 :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<4>
    output io_out : UInt<4>

    reg state : UInt<4>, clock with :
      reset => (UInt<1>("h0"), state) @[Exercise1_Lab6.scala 22:25]
    io_out <= state @[Exercise1_Lab6.scala 24:11]
    state <= mux(reset, UInt<4>("h4"), io_in) @[Exercise1_Lab6.scala 22:25 Exercise1_Lab6.scala 22:25 Exercise1_Lab6.scala 23:10]
