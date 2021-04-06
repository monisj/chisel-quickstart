circuit Exercise1_Lab6 :
  module Exercise1_Lab6 :
    input clock : Clock
    input reset : UInt<1>
    input io_in_0 : UInt<4>
    input io_in_1 : UInt<4>
    input io_in_2 : UInt<4>
    input io_in_3 : UInt<4>
    output io_out : UInt<4>

    reg register_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_0) @[Exercise1_Lab6.scala 22:23]
    reg register_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_1) @[Exercise1_Lab6.scala 22:23]
    reg register_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_2) @[Exercise1_Lab6.scala 22:23]
    reg register_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_3) @[Exercise1_Lab6.scala 22:23]
    reg register_4 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_4) @[Exercise1_Lab6.scala 22:23]
    reg register_5 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_5) @[Exercise1_Lab6.scala 22:23]
    reg register_6 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_6) @[Exercise1_Lab6.scala 22:23]
    reg register_7 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_7) @[Exercise1_Lab6.scala 22:23]
    reg register_8 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_8) @[Exercise1_Lab6.scala 22:23]
    reg register_9 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_9) @[Exercise1_Lab6.scala 22:23]
    reg register_10 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_10) @[Exercise1_Lab6.scala 22:23]
    reg register_11 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_11) @[Exercise1_Lab6.scala 22:23]
    reg register_12 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_12) @[Exercise1_Lab6.scala 22:23]
    reg register_13 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_13) @[Exercise1_Lab6.scala 22:23]
    reg register_14 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_14) @[Exercise1_Lab6.scala 22:23]
    reg register_15 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_15) @[Exercise1_Lab6.scala 22:23]
    reg register_16 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_16) @[Exercise1_Lab6.scala 22:23]
    reg register_17 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_17) @[Exercise1_Lab6.scala 22:23]
    reg register_18 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_18) @[Exercise1_Lab6.scala 22:23]
    reg register_19 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_19) @[Exercise1_Lab6.scala 22:23]
    reg register_20 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_20) @[Exercise1_Lab6.scala 22:23]
    reg register_21 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_21) @[Exercise1_Lab6.scala 22:23]
    reg register_22 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_22) @[Exercise1_Lab6.scala 22:23]
    reg register_23 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_23) @[Exercise1_Lab6.scala 22:23]
    reg register_24 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_24) @[Exercise1_Lab6.scala 22:23]
    reg register_25 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_25) @[Exercise1_Lab6.scala 22:23]
    reg register_26 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_26) @[Exercise1_Lab6.scala 22:23]
    reg register_27 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_27) @[Exercise1_Lab6.scala 22:23]
    reg register_28 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_28) @[Exercise1_Lab6.scala 22:23]
    reg register_29 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_29) @[Exercise1_Lab6.scala 22:23]
    reg register_30 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_30) @[Exercise1_Lab6.scala 22:23]
    reg register_31 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), register_31) @[Exercise1_Lab6.scala 22:23]
    io_out <= bits(register_3, 3, 0) @[Exercise1_Lab6.scala 28:15]
    register_0 <= io_in_0 @[Exercise1_Lab6.scala 24:20]
    register_1 <= io_in_1 @[Exercise1_Lab6.scala 24:20]
    register_2 <= io_in_2 @[Exercise1_Lab6.scala 24:20]
    register_3 <= io_in_3 @[Exercise1_Lab6.scala 24:20]
    register_4 <= register_4 @[Exercise1_Lab6.scala 22:23]
    register_5 <= register_5 @[Exercise1_Lab6.scala 22:23]
    register_6 <= register_6 @[Exercise1_Lab6.scala 22:23]
    register_7 <= register_7 @[Exercise1_Lab6.scala 22:23]
    register_8 <= register_8 @[Exercise1_Lab6.scala 22:23]
    register_9 <= register_9 @[Exercise1_Lab6.scala 22:23]
    register_10 <= register_10 @[Exercise1_Lab6.scala 22:23]
    register_11 <= register_11 @[Exercise1_Lab6.scala 22:23]
    register_12 <= register_12 @[Exercise1_Lab6.scala 22:23]
    register_13 <= register_13 @[Exercise1_Lab6.scala 22:23]
    register_14 <= register_14 @[Exercise1_Lab6.scala 22:23]
    register_15 <= register_15 @[Exercise1_Lab6.scala 22:23]
    register_16 <= register_16 @[Exercise1_Lab6.scala 22:23]
    register_17 <= register_17 @[Exercise1_Lab6.scala 22:23]
    register_18 <= register_18 @[Exercise1_Lab6.scala 22:23]
    register_19 <= register_19 @[Exercise1_Lab6.scala 22:23]
    register_20 <= register_20 @[Exercise1_Lab6.scala 22:23]
    register_21 <= register_21 @[Exercise1_Lab6.scala 22:23]
    register_22 <= register_22 @[Exercise1_Lab6.scala 22:23]
    register_23 <= register_23 @[Exercise1_Lab6.scala 22:23]
    register_24 <= register_24 @[Exercise1_Lab6.scala 22:23]
    register_25 <= register_25 @[Exercise1_Lab6.scala 22:23]
    register_26 <= register_26 @[Exercise1_Lab6.scala 22:23]
    register_27 <= register_27 @[Exercise1_Lab6.scala 22:23]
    register_28 <= register_28 @[Exercise1_Lab6.scala 22:23]
    register_29 <= register_29 @[Exercise1_Lab6.scala 22:23]
    register_30 <= register_30 @[Exercise1_Lab6.scala 22:23]
    register_31 <= register_31 @[Exercise1_Lab6.scala 22:23]
