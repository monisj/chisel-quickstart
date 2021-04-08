circuit Exercise1_Lab7 :
  module Arbiter :
    input clock : Clock
    input reset : UInt<1>
    output io_in_0_ready : UInt<1>
    input io_in_0_valid : UInt<1>
    input io_in_0_bits : UInt<3>
    output io_in_1_ready : UInt<1>
    input io_in_1_valid : UInt<1>
    input io_in_1_bits : UInt<3>
    output io_in_2_ready : UInt<1>
    input io_in_2_valid : UInt<1>
    input io_in_2_bits : UInt<3>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : UInt<3>
    output io_chosen : UInt<2>

    node _GEN_0 = mux(io_in_1_valid, UInt<1>("h1"), UInt<2>("h2")) @[Arbiter.scala 126:27 Arbiter.scala 127:17 Arbiter.scala 123:13]
    node _GEN_1 = mux(io_in_1_valid, io_in_1_bits, io_in_2_bits) @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
    node _GEN_2 = mux(io_in_0_valid, UInt<1>("h0"), _GEN_0) @[Arbiter.scala 126:27 Arbiter.scala 127:17]
    node _GEN_3 = mux(io_in_0_valid, io_in_0_bits, _GEN_1) @[Arbiter.scala 126:27 Arbiter.scala 128:19]
    node _grant_T = or(io_in_0_valid, io_in_1_valid) @[Arbiter.scala 31:68]
    node grant_1 = eq(io_in_0_valid, UInt<1>("h0")) @[Arbiter.scala 31:78]
    node grant_2 = eq(_grant_T, UInt<1>("h0")) @[Arbiter.scala 31:78]
    node _io_in_0_ready_T = and(UInt<1>("h1"), io_out_ready) @[Arbiter.scala 134:19]
    node _io_in_1_ready_T = and(grant_1, io_out_ready) @[Arbiter.scala 134:19]
    node _io_in_2_ready_T = and(grant_2, io_out_ready) @[Arbiter.scala 134:19]
    node _io_out_valid_T = eq(grant_2, UInt<1>("h0")) @[Arbiter.scala 135:19]
    node _io_out_valid_T_1 = or(_io_out_valid_T, io_in_2_valid) @[Arbiter.scala 135:31]
    io_in_0_ready <= _io_in_0_ready_T @[Arbiter.scala 134:14]
    io_in_1_ready <= _io_in_1_ready_T @[Arbiter.scala 134:14]
    io_in_2_ready <= _io_in_2_ready_T @[Arbiter.scala 134:14]
    io_out_valid <= _io_out_valid_T_1 @[Arbiter.scala 135:16]
    io_out_bits <= _GEN_3
    io_chosen <= _GEN_2

  module Exercise1_Lab7 :
    input clock : Clock
    input reset : UInt<1>
    output io_in_0_ready : UInt<1>
    input io_in_0_valid : UInt<1>
    input io_in_0_bits : UInt<3>
    output io_in_1_ready : UInt<1>
    input io_in_1_valid : UInt<1>
    input io_in_1_bits : UInt<3>
    output io_in_2_ready : UInt<1>
    input io_in_2_valid : UInt<1>
    input io_in_2_bits : UInt<3>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : UInt<3>

    inst arb_priority of Arbiter @[Exercise1_Lab7.scala 14:31]
    io_in_0_ready <= arb_priority.io_in_0_ready @[Exercise1_Lab7.scala 15:14]
    io_in_1_ready <= arb_priority.io_in_1_ready @[Exercise1_Lab7.scala 16:14]
    io_in_2_ready <= arb_priority.io_in_2_ready @[Exercise1_Lab7.scala 17:14]
    io_out_valid <= arb_priority.io_out_valid @[Exercise1_Lab7.scala 18:12]
    io_out_bits <= arb_priority.io_out_bits @[Exercise1_Lab7.scala 18:12]
    arb_priority.clock <= clock
    arb_priority.reset <= reset
    arb_priority.io_in_0_valid <= io_in_0_valid @[Exercise1_Lab7.scala 15:14]
    arb_priority.io_in_0_bits <= io_in_0_bits @[Exercise1_Lab7.scala 15:14]
    arb_priority.io_in_1_valid <= io_in_1_valid @[Exercise1_Lab7.scala 16:14]
    arb_priority.io_in_1_bits <= io_in_1_bits @[Exercise1_Lab7.scala 16:14]
    arb_priority.io_in_2_valid <= io_in_2_valid @[Exercise1_Lab7.scala 17:14]
    arb_priority.io_in_2_bits <= io_in_2_bits @[Exercise1_Lab7.scala 17:14]
    arb_priority.io_out_ready <= io_out_ready @[Exercise1_Lab7.scala 18:12]
