;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Exercise1_Lab7 : 
  module Queue : 
    input clock : Clock
    input reset : Reset
    output io : {flip enq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<3>}, deq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<3>}, count : UInt<2>}
    
    cmem ram : UInt<3>[3] @[Decoupled.scala 218:16]
    reg value : UInt<2>, clock with : (reset => (reset, UInt<2>("h00"))) @[Counter.scala 60:40]
    reg value_1 : UInt<2>, clock with : (reset => (reset, UInt<2>("h00"))) @[Counter.scala 60:40]
    reg maybe_full : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[Decoupled.scala 221:27]
    node ptr_match = eq(value, value_1) @[Decoupled.scala 223:33]
    node _empty_T = eq(maybe_full, UInt<1>("h00")) @[Decoupled.scala 224:28]
    node empty = and(ptr_match, _empty_T) @[Decoupled.scala 224:25]
    node full = and(ptr_match, maybe_full) @[Decoupled.scala 225:24]
    node _do_enq_T = and(io.enq.ready, io.enq.valid) @[Decoupled.scala 40:37]
    wire do_enq : UInt<1>
    do_enq <= _do_enq_T
    node _do_deq_T = and(io.deq.ready, io.deq.valid) @[Decoupled.scala 40:37]
    wire do_deq : UInt<1>
    do_deq <= _do_deq_T
    when do_enq : @[Decoupled.scala 229:17]
      infer mport MPORT = ram[value], clock @[Decoupled.scala 230:8]
      MPORT <= io.enq.bits @[Decoupled.scala 230:24]
      node wrap = eq(value, UInt<2>("h02")) @[Counter.scala 72:24]
      node _value_T = add(value, UInt<1>("h01")) @[Counter.scala 76:24]
      node _value_T_1 = tail(_value_T, 1) @[Counter.scala 76:24]
      value <= _value_T_1 @[Counter.scala 76:15]
      when wrap : @[Counter.scala 86:20]
        value <= UInt<1>("h00") @[Counter.scala 86:28]
        skip @[Counter.scala 86:20]
      skip @[Decoupled.scala 229:17]
    when do_deq : @[Decoupled.scala 233:17]
      node wrap_1 = eq(value_1, UInt<2>("h02")) @[Counter.scala 72:24]
      node _value_T_2 = add(value_1, UInt<1>("h01")) @[Counter.scala 76:24]
      node _value_T_3 = tail(_value_T_2, 1) @[Counter.scala 76:24]
      value_1 <= _value_T_3 @[Counter.scala 76:15]
      when wrap_1 : @[Counter.scala 86:20]
        value_1 <= UInt<1>("h00") @[Counter.scala 86:28]
        skip @[Counter.scala 86:20]
      skip @[Decoupled.scala 233:17]
    node _T = neq(do_enq, do_deq) @[Decoupled.scala 236:16]
    when _T : @[Decoupled.scala 236:28]
      maybe_full <= do_enq @[Decoupled.scala 237:16]
      skip @[Decoupled.scala 236:28]
    node _io_deq_valid_T = eq(empty, UInt<1>("h00")) @[Decoupled.scala 240:19]
    io.deq.valid <= _io_deq_valid_T @[Decoupled.scala 240:16]
    node _io_enq_ready_T = eq(full, UInt<1>("h00")) @[Decoupled.scala 241:19]
    io.enq.ready <= _io_enq_ready_T @[Decoupled.scala 241:16]
    infer mport io_deq_bits_MPORT = ram[value_1], clock @[Decoupled.scala 242:21]
    io.deq.bits <= io_deq_bits_MPORT @[Decoupled.scala 242:15]
    node _ptr_diff_T = sub(value, value_1) @[Decoupled.scala 257:32]
    node ptr_diff = tail(_ptr_diff_T, 1) @[Decoupled.scala 257:32]
    node _io_count_T = mux(maybe_full, UInt<2>("h03"), UInt<1>("h00")) @[Decoupled.scala 262:24]
    node _io_count_T_1 = gt(value_1, value) @[Decoupled.scala 264:39]
    node _io_count_T_2 = add(UInt<2>("h03"), ptr_diff) @[Decoupled.scala 265:38]
    node _io_count_T_3 = tail(_io_count_T_2, 1) @[Decoupled.scala 265:38]
    node _io_count_T_4 = mux(_io_count_T_1, _io_count_T_3, ptr_diff) @[Decoupled.scala 264:24]
    node _io_count_T_5 = mux(ptr_match, _io_count_T, _io_count_T_4) @[Decoupled.scala 261:20]
    io.count <= _io_count_T_5 @[Decoupled.scala 261:14]
    
  module Queue_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip enq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<3>}, deq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<3>}, count : UInt<2>}
    
    cmem ram : UInt<3>[3] @[Decoupled.scala 218:16]
    reg value : UInt<2>, clock with : (reset => (reset, UInt<2>("h00"))) @[Counter.scala 60:40]
    reg value_1 : UInt<2>, clock with : (reset => (reset, UInt<2>("h00"))) @[Counter.scala 60:40]
    reg maybe_full : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[Decoupled.scala 221:27]
    node ptr_match = eq(value, value_1) @[Decoupled.scala 223:33]
    node _empty_T = eq(maybe_full, UInt<1>("h00")) @[Decoupled.scala 224:28]
    node empty = and(ptr_match, _empty_T) @[Decoupled.scala 224:25]
    node full = and(ptr_match, maybe_full) @[Decoupled.scala 225:24]
    node _do_enq_T = and(io.enq.ready, io.enq.valid) @[Decoupled.scala 40:37]
    wire do_enq : UInt<1>
    do_enq <= _do_enq_T
    node _do_deq_T = and(io.deq.ready, io.deq.valid) @[Decoupled.scala 40:37]
    wire do_deq : UInt<1>
    do_deq <= _do_deq_T
    when do_enq : @[Decoupled.scala 229:17]
      infer mport MPORT = ram[value], clock @[Decoupled.scala 230:8]
      MPORT <= io.enq.bits @[Decoupled.scala 230:24]
      node wrap = eq(value, UInt<2>("h02")) @[Counter.scala 72:24]
      node _value_T = add(value, UInt<1>("h01")) @[Counter.scala 76:24]
      node _value_T_1 = tail(_value_T, 1) @[Counter.scala 76:24]
      value <= _value_T_1 @[Counter.scala 76:15]
      when wrap : @[Counter.scala 86:20]
        value <= UInt<1>("h00") @[Counter.scala 86:28]
        skip @[Counter.scala 86:20]
      skip @[Decoupled.scala 229:17]
    when do_deq : @[Decoupled.scala 233:17]
      node wrap_1 = eq(value_1, UInt<2>("h02")) @[Counter.scala 72:24]
      node _value_T_2 = add(value_1, UInt<1>("h01")) @[Counter.scala 76:24]
      node _value_T_3 = tail(_value_T_2, 1) @[Counter.scala 76:24]
      value_1 <= _value_T_3 @[Counter.scala 76:15]
      when wrap_1 : @[Counter.scala 86:20]
        value_1 <= UInt<1>("h00") @[Counter.scala 86:28]
        skip @[Counter.scala 86:20]
      skip @[Decoupled.scala 233:17]
    node _T = neq(do_enq, do_deq) @[Decoupled.scala 236:16]
    when _T : @[Decoupled.scala 236:28]
      maybe_full <= do_enq @[Decoupled.scala 237:16]
      skip @[Decoupled.scala 236:28]
    node _io_deq_valid_T = eq(empty, UInt<1>("h00")) @[Decoupled.scala 240:19]
    io.deq.valid <= _io_deq_valid_T @[Decoupled.scala 240:16]
    node _io_enq_ready_T = eq(full, UInt<1>("h00")) @[Decoupled.scala 241:19]
    io.enq.ready <= _io_enq_ready_T @[Decoupled.scala 241:16]
    infer mport io_deq_bits_MPORT = ram[value_1], clock @[Decoupled.scala 242:21]
    io.deq.bits <= io_deq_bits_MPORT @[Decoupled.scala 242:15]
    node _ptr_diff_T = sub(value, value_1) @[Decoupled.scala 257:32]
    node ptr_diff = tail(_ptr_diff_T, 1) @[Decoupled.scala 257:32]
    node _io_count_T = mux(maybe_full, UInt<2>("h03"), UInt<1>("h00")) @[Decoupled.scala 262:24]
    node _io_count_T_1 = gt(value_1, value) @[Decoupled.scala 264:39]
    node _io_count_T_2 = add(UInt<2>("h03"), ptr_diff) @[Decoupled.scala 265:38]
    node _io_count_T_3 = tail(_io_count_T_2, 1) @[Decoupled.scala 265:38]
    node _io_count_T_4 = mux(_io_count_T_1, _io_count_T_3, ptr_diff) @[Decoupled.scala 264:24]
    node _io_count_T_5 = mux(ptr_match, _io_count_T, _io_count_T_4) @[Decoupled.scala 261:20]
    io.count <= _io_count_T_5 @[Decoupled.scala 261:14]
    
  module Queue_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip enq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<3>}, deq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<3>}, count : UInt<2>}
    
    cmem ram : UInt<3>[3] @[Decoupled.scala 218:16]
    reg value : UInt<2>, clock with : (reset => (reset, UInt<2>("h00"))) @[Counter.scala 60:40]
    reg value_1 : UInt<2>, clock with : (reset => (reset, UInt<2>("h00"))) @[Counter.scala 60:40]
    reg maybe_full : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[Decoupled.scala 221:27]
    node ptr_match = eq(value, value_1) @[Decoupled.scala 223:33]
    node _empty_T = eq(maybe_full, UInt<1>("h00")) @[Decoupled.scala 224:28]
    node empty = and(ptr_match, _empty_T) @[Decoupled.scala 224:25]
    node full = and(ptr_match, maybe_full) @[Decoupled.scala 225:24]
    node _do_enq_T = and(io.enq.ready, io.enq.valid) @[Decoupled.scala 40:37]
    wire do_enq : UInt<1>
    do_enq <= _do_enq_T
    node _do_deq_T = and(io.deq.ready, io.deq.valid) @[Decoupled.scala 40:37]
    wire do_deq : UInt<1>
    do_deq <= _do_deq_T
    when do_enq : @[Decoupled.scala 229:17]
      infer mport MPORT = ram[value], clock @[Decoupled.scala 230:8]
      MPORT <= io.enq.bits @[Decoupled.scala 230:24]
      node wrap = eq(value, UInt<2>("h02")) @[Counter.scala 72:24]
      node _value_T = add(value, UInt<1>("h01")) @[Counter.scala 76:24]
      node _value_T_1 = tail(_value_T, 1) @[Counter.scala 76:24]
      value <= _value_T_1 @[Counter.scala 76:15]
      when wrap : @[Counter.scala 86:20]
        value <= UInt<1>("h00") @[Counter.scala 86:28]
        skip @[Counter.scala 86:20]
      skip @[Decoupled.scala 229:17]
    when do_deq : @[Decoupled.scala 233:17]
      node wrap_1 = eq(value_1, UInt<2>("h02")) @[Counter.scala 72:24]
      node _value_T_2 = add(value_1, UInt<1>("h01")) @[Counter.scala 76:24]
      node _value_T_3 = tail(_value_T_2, 1) @[Counter.scala 76:24]
      value_1 <= _value_T_3 @[Counter.scala 76:15]
      when wrap_1 : @[Counter.scala 86:20]
        value_1 <= UInt<1>("h00") @[Counter.scala 86:28]
        skip @[Counter.scala 86:20]
      skip @[Decoupled.scala 233:17]
    node _T = neq(do_enq, do_deq) @[Decoupled.scala 236:16]
    when _T : @[Decoupled.scala 236:28]
      maybe_full <= do_enq @[Decoupled.scala 237:16]
      skip @[Decoupled.scala 236:28]
    node _io_deq_valid_T = eq(empty, UInt<1>("h00")) @[Decoupled.scala 240:19]
    io.deq.valid <= _io_deq_valid_T @[Decoupled.scala 240:16]
    node _io_enq_ready_T = eq(full, UInt<1>("h00")) @[Decoupled.scala 241:19]
    io.enq.ready <= _io_enq_ready_T @[Decoupled.scala 241:16]
    infer mport io_deq_bits_MPORT = ram[value_1], clock @[Decoupled.scala 242:21]
    io.deq.bits <= io_deq_bits_MPORT @[Decoupled.scala 242:15]
    node _ptr_diff_T = sub(value, value_1) @[Decoupled.scala 257:32]
    node ptr_diff = tail(_ptr_diff_T, 1) @[Decoupled.scala 257:32]
    node _io_count_T = mux(maybe_full, UInt<2>("h03"), UInt<1>("h00")) @[Decoupled.scala 262:24]
    node _io_count_T_1 = gt(value_1, value) @[Decoupled.scala 264:39]
    node _io_count_T_2 = add(UInt<2>("h03"), ptr_diff) @[Decoupled.scala 265:38]
    node _io_count_T_3 = tail(_io_count_T_2, 1) @[Decoupled.scala 265:38]
    node _io_count_T_4 = mux(_io_count_T_1, _io_count_T_3, ptr_diff) @[Decoupled.scala 264:24]
    node _io_count_T_5 = mux(ptr_match, _io_count_T, _io_count_T_4) @[Decoupled.scala 261:20]
    io.count <= _io_count_T_5 @[Decoupled.scala 261:14]
    
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
    inst queue1 of Queue @[Decoupled.scala 296:21]
    queue1.clock <= clock
    queue1.reset <= reset
    queue1.io.enq.valid <= io.in[0].valid @[Decoupled.scala 297:22]
    queue1.io.enq.bits <= io.in[0].bits @[Decoupled.scala 298:21]
    io.in[0].ready <= queue1.io.enq.ready @[Decoupled.scala 299:17]
    inst queue2 of Queue_1 @[Decoupled.scala 296:21]
    queue2.clock <= clock
    queue2.reset <= reset
    queue2.io.enq.valid <= io.in[1].valid @[Decoupled.scala 297:22]
    queue2.io.enq.bits <= io.in[1].bits @[Decoupled.scala 298:21]
    io.in[1].ready <= queue2.io.enq.ready @[Decoupled.scala 299:17]
    inst queue3 of Queue_2 @[Decoupled.scala 296:21]
    queue3.clock <= clock
    queue3.reset <= reset
    queue3.io.enq.valid <= io.in[2].valid @[Decoupled.scala 297:22]
    queue3.io.enq.bits <= io.in[2].bits @[Decoupled.scala 298:21]
    io.in[2].ready <= queue3.io.enq.ready @[Decoupled.scala 299:17]
    inst arb_priority of Arbiter @[Exercise1_Lab7.scala 18:31]
    arb_priority.clock <= clock
    arb_priority.reset <= reset
    arb_priority.io.in[0].bits <= queue1.io.deq.bits @[Exercise1_Lab7.scala 19:12]
    arb_priority.io.in[0].valid <= queue1.io.deq.valid @[Exercise1_Lab7.scala 19:12]
    queue1.io.deq.ready <= arb_priority.io.in[0].ready @[Exercise1_Lab7.scala 19:12]
    arb_priority.io.in[1].bits <= queue2.io.deq.bits @[Exercise1_Lab7.scala 20:12]
    arb_priority.io.in[1].valid <= queue2.io.deq.valid @[Exercise1_Lab7.scala 20:12]
    queue2.io.deq.ready <= arb_priority.io.in[1].ready @[Exercise1_Lab7.scala 20:12]
    arb_priority.io.in[2].bits <= queue3.io.deq.bits @[Exercise1_Lab7.scala 21:12]
    arb_priority.io.in[2].valid <= queue3.io.deq.valid @[Exercise1_Lab7.scala 21:12]
    queue3.io.deq.ready <= arb_priority.io.in[2].ready @[Exercise1_Lab7.scala 21:12]
    io.out.bits <= arb_priority.io.out.bits @[Exercise1_Lab7.scala 22:12]
    io.out.valid <= arb_priority.io.out.valid @[Exercise1_Lab7.scala 22:12]
    arb_priority.io.out.ready <= io.out.ready @[Exercise1_Lab7.scala 22:12]
    
