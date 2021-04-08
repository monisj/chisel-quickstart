;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Exercise1_Lab7 : 
  module Arbiter : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt}[3], out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt}, chosen : UInt<2>}
    
    io.chosen <= UInt<2>("h02") @[Arbiter.scala 123:13]
    io.out.bits <= io.in[2].bits @[Arbiter.scala 124:15]
    when io.in[1].valid : @[Arbiter.scala 126:27]
      io.chosen <= UInt<1>("h01") @[Arbiter.scala 127:17]
      io.out.bits <= io.in[1].bits @[Arbiter.scala 128:19]
      skip @[Arbiter.scala 126:27]
    when io.in[0].valid : @[Arbiter.scala 126:27]
      io.chosen <= UInt<1>("h00") @[Arbiter.scala 127:17]
      io.out.bits <= io.in[0].bits @[Arbiter.scala 128:19]
      skip @[Arbiter.scala 126:27]
    node _grant_T = or(io.in[0].valid, io.in[1].valid) @[Arbiter.scala 31:68]
    node grant_1 = eq(io.in[0].valid, UInt<1>("h00")) @[Arbiter.scala 31:78]
    node grant_2 = eq(_grant_T, UInt<1>("h00")) @[Arbiter.scala 31:78]
    node _io_in_0_ready_T = and(UInt<1>("h01"), io.out.ready) @[Arbiter.scala 134:19]
    io.in[0].ready <= _io_in_0_ready_T @[Arbiter.scala 134:14]
    node _io_in_1_ready_T = and(grant_1, io.out.ready) @[Arbiter.scala 134:19]
    io.in[1].ready <= _io_in_1_ready_T @[Arbiter.scala 134:14]
    node _io_in_2_ready_T = and(grant_2, io.out.ready) @[Arbiter.scala 134:19]
    io.in[2].ready <= _io_in_2_ready_T @[Arbiter.scala 134:14]
    node _io_out_valid_T = eq(grant_2, UInt<1>("h00")) @[Arbiter.scala 135:19]
    node _io_out_valid_T_1 = or(_io_out_valid_T, io.in[2].valid) @[Arbiter.scala 135:31]
    io.out.valid <= _io_out_valid_T_1 @[Arbiter.scala 135:16]
    
  module Exercise1_Lab7 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<3>}[3], out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<3>}}
    
    io.out.bits <= UInt<1>("h00") @[Exercise1_Lab7.scala 12:16]
    io.out.valid <= UInt<1>("h00") @[Exercise1_Lab7.scala 13:17]
    inst arb_priority of Arbiter @[Exercise1_Lab7.scala 14:31]
    arb_priority.clock <= clock
    arb_priority.reset <= reset
    arb_priority.io.in[0].bits <= io.in[0].bits @[Exercise1_Lab7.scala 15:14]
    arb_priority.io.in[0].valid <= io.in[0].valid @[Exercise1_Lab7.scala 15:14]
    io.in[0].ready <= arb_priority.io.in[0].ready @[Exercise1_Lab7.scala 15:14]
    arb_priority.io.in[1].bits <= io.in[1].bits @[Exercise1_Lab7.scala 16:14]
    arb_priority.io.in[1].valid <= io.in[1].valid @[Exercise1_Lab7.scala 16:14]
    io.in[1].ready <= arb_priority.io.in[1].ready @[Exercise1_Lab7.scala 16:14]
    arb_priority.io.in[2].bits <= io.in[2].bits @[Exercise1_Lab7.scala 17:14]
    arb_priority.io.in[2].valid <= io.in[2].valid @[Exercise1_Lab7.scala 17:14]
    io.in[2].ready <= arb_priority.io.in[2].ready @[Exercise1_Lab7.scala 17:14]
    io.out.bits <= arb_priority.io.out.bits @[Exercise1_Lab7.scala 18:12]
    io.out.valid <= arb_priority.io.out.valid @[Exercise1_Lab7.scala 18:12]
    arb_priority.io.out.ready <= io.out.ready @[Exercise1_Lab7.scala 18:12]
    
