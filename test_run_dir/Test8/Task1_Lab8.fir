;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Task1_Lab8 : 
  module Queue : 
    input clock : Clock
    input reset : Reset
    output io : {flip enq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}, deq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}, count : UInt<1>}
    
    cmem ram : UInt<32>[1] @[Decoupled.scala 218:16]
    wire value : UInt
    value <= UInt<1>("h00")
    wire value_1 : UInt
    value_1 <= UInt<1>("h00")
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
      infer mport MPORT = ram[UInt<1>("h00")], clock @[Decoupled.scala 230:8]
      MPORT <= io.enq.bits @[Decoupled.scala 230:24]
      skip @[Decoupled.scala 229:17]
    when do_deq : @[Decoupled.scala 233:17]
      skip @[Decoupled.scala 233:17]
    node _T = neq(do_enq, do_deq) @[Decoupled.scala 236:16]
    when _T : @[Decoupled.scala 236:28]
      maybe_full <= do_enq @[Decoupled.scala 237:16]
      skip @[Decoupled.scala 236:28]
    node _io_deq_valid_T = eq(empty, UInt<1>("h00")) @[Decoupled.scala 240:19]
    io.deq.valid <= _io_deq_valid_T @[Decoupled.scala 240:16]
    node _io_enq_ready_T = eq(full, UInt<1>("h00")) @[Decoupled.scala 241:19]
    io.enq.ready <= _io_enq_ready_T @[Decoupled.scala 241:16]
    infer mport io_deq_bits_MPORT = ram[UInt<1>("h00")], clock @[Decoupled.scala 242:21]
    io.deq.bits <= io_deq_bits_MPORT @[Decoupled.scala 242:15]
    node _ptr_diff_T = sub(value, value_1) @[Decoupled.scala 257:32]
    node ptr_diff = tail(_ptr_diff_T, 1) @[Decoupled.scala 257:32]
    node _io_count_T = and(maybe_full, ptr_match) @[Decoupled.scala 259:32]
    node _io_count_T_1 = mux(_io_count_T, UInt<1>("h01"), UInt<1>("h00")) @[Decoupled.scala 259:20]
    node _io_count_T_2 = or(_io_count_T_1, ptr_diff) @[Decoupled.scala 259:62]
    io.count <= _io_count_T_2 @[Decoupled.scala 259:14]
    
  module Queue_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip enq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}, deq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}, count : UInt<1>}
    
    cmem ram : UInt<32>[1] @[Decoupled.scala 218:16]
    wire value : UInt
    value <= UInt<1>("h00")
    wire value_1 : UInt
    value_1 <= UInt<1>("h00")
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
      infer mport MPORT = ram[UInt<1>("h00")], clock @[Decoupled.scala 230:8]
      MPORT <= io.enq.bits @[Decoupled.scala 230:24]
      skip @[Decoupled.scala 229:17]
    when do_deq : @[Decoupled.scala 233:17]
      skip @[Decoupled.scala 233:17]
    node _T = neq(do_enq, do_deq) @[Decoupled.scala 236:16]
    when _T : @[Decoupled.scala 236:28]
      maybe_full <= do_enq @[Decoupled.scala 237:16]
      skip @[Decoupled.scala 236:28]
    node _io_deq_valid_T = eq(empty, UInt<1>("h00")) @[Decoupled.scala 240:19]
    io.deq.valid <= _io_deq_valid_T @[Decoupled.scala 240:16]
    node _io_enq_ready_T = eq(full, UInt<1>("h00")) @[Decoupled.scala 241:19]
    io.enq.ready <= _io_enq_ready_T @[Decoupled.scala 241:16]
    infer mport io_deq_bits_MPORT = ram[UInt<1>("h00")], clock @[Decoupled.scala 242:21]
    io.deq.bits <= io_deq_bits_MPORT @[Decoupled.scala 242:15]
    node _ptr_diff_T = sub(value, value_1) @[Decoupled.scala 257:32]
    node ptr_diff = tail(_ptr_diff_T, 1) @[Decoupled.scala 257:32]
    node _io_count_T = and(maybe_full, ptr_match) @[Decoupled.scala 259:32]
    node _io_count_T_1 = mux(_io_count_T, UInt<1>("h01"), UInt<1>("h00")) @[Decoupled.scala 259:20]
    node _io_count_T_2 = or(_io_count_T_1, ptr_diff) @[Decoupled.scala 259:62]
    io.count <= _io_count_T_2 @[Decoupled.scala 259:14]
    
  module Queue_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip enq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}, deq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}, count : UInt<1>}
    
    cmem ram : UInt<32>[1] @[Decoupled.scala 218:16]
    wire value : UInt
    value <= UInt<1>("h00")
    wire value_1 : UInt
    value_1 <= UInt<1>("h00")
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
      infer mport MPORT = ram[UInt<1>("h00")], clock @[Decoupled.scala 230:8]
      MPORT <= io.enq.bits @[Decoupled.scala 230:24]
      skip @[Decoupled.scala 229:17]
    when do_deq : @[Decoupled.scala 233:17]
      skip @[Decoupled.scala 233:17]
    node _T = neq(do_enq, do_deq) @[Decoupled.scala 236:16]
    when _T : @[Decoupled.scala 236:28]
      maybe_full <= do_enq @[Decoupled.scala 237:16]
      skip @[Decoupled.scala 236:28]
    node _io_deq_valid_T = eq(empty, UInt<1>("h00")) @[Decoupled.scala 240:19]
    io.deq.valid <= _io_deq_valid_T @[Decoupled.scala 240:16]
    node _io_enq_ready_T = eq(full, UInt<1>("h00")) @[Decoupled.scala 241:19]
    io.enq.ready <= _io_enq_ready_T @[Decoupled.scala 241:16]
    infer mport io_deq_bits_MPORT = ram[UInt<1>("h00")], clock @[Decoupled.scala 242:21]
    io.deq.bits <= io_deq_bits_MPORT @[Decoupled.scala 242:15]
    node _ptr_diff_T = sub(value, value_1) @[Decoupled.scala 257:32]
    node ptr_diff = tail(_ptr_diff_T, 1) @[Decoupled.scala 257:32]
    node _io_count_T = and(maybe_full, ptr_match) @[Decoupled.scala 259:32]
    node _io_count_T_1 = mux(_io_count_T, UInt<1>("h01"), UInt<1>("h00")) @[Decoupled.scala 259:20]
    node _io_count_T_2 = or(_io_count_T_1, ptr_diff) @[Decoupled.scala 259:62]
    io.count <= _io_count_T_2 @[Decoupled.scala 259:14]
    
  module Queue_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip enq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}, deq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}, count : UInt<1>}
    
    cmem ram : UInt<32>[1] @[Decoupled.scala 218:16]
    wire value : UInt
    value <= UInt<1>("h00")
    wire value_1 : UInt
    value_1 <= UInt<1>("h00")
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
      infer mport MPORT = ram[UInt<1>("h00")], clock @[Decoupled.scala 230:8]
      MPORT <= io.enq.bits @[Decoupled.scala 230:24]
      skip @[Decoupled.scala 229:17]
    when do_deq : @[Decoupled.scala 233:17]
      skip @[Decoupled.scala 233:17]
    node _T = neq(do_enq, do_deq) @[Decoupled.scala 236:16]
    when _T : @[Decoupled.scala 236:28]
      maybe_full <= do_enq @[Decoupled.scala 237:16]
      skip @[Decoupled.scala 236:28]
    node _io_deq_valid_T = eq(empty, UInt<1>("h00")) @[Decoupled.scala 240:19]
    io.deq.valid <= _io_deq_valid_T @[Decoupled.scala 240:16]
    node _io_enq_ready_T = eq(full, UInt<1>("h00")) @[Decoupled.scala 241:19]
    io.enq.ready <= _io_enq_ready_T @[Decoupled.scala 241:16]
    infer mport io_deq_bits_MPORT = ram[UInt<1>("h00")], clock @[Decoupled.scala 242:21]
    io.deq.bits <= io_deq_bits_MPORT @[Decoupled.scala 242:15]
    node _ptr_diff_T = sub(value, value_1) @[Decoupled.scala 257:32]
    node ptr_diff = tail(_ptr_diff_T, 1) @[Decoupled.scala 257:32]
    node _io_count_T = and(maybe_full, ptr_match) @[Decoupled.scala 259:32]
    node _io_count_T_1 = mux(_io_count_T, UInt<1>("h01"), UInt<1>("h00")) @[Decoupled.scala 259:20]
    node _io_count_T_2 = or(_io_count_T_1, ptr_diff) @[Decoupled.scala 259:62]
    io.count <= _io_count_T_2 @[Decoupled.scala 259:14]
    
  module Arbiter : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt}[4], out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt}, chosen : UInt<2>}
    
    io.chosen <= UInt<2>("h03") @[Arbiter.scala 123:13]
    io.out.bits <= io.in[3].bits @[Arbiter.scala 124:15]
    when io.in[2].valid : @[Arbiter.scala 126:27]
      io.chosen <= UInt<2>("h02") @[Arbiter.scala 127:17]
      io.out.bits <= io.in[2].bits @[Arbiter.scala 128:19]
      skip @[Arbiter.scala 126:27]
    when io.in[1].valid : @[Arbiter.scala 126:27]
      io.chosen <= UInt<1>("h01") @[Arbiter.scala 127:17]
      io.out.bits <= io.in[1].bits @[Arbiter.scala 128:19]
      skip @[Arbiter.scala 126:27]
    when io.in[0].valid : @[Arbiter.scala 126:27]
      io.chosen <= UInt<1>("h00") @[Arbiter.scala 127:17]
      io.out.bits <= io.in[0].bits @[Arbiter.scala 128:19]
      skip @[Arbiter.scala 126:27]
    node _grant_T = or(io.in[0].valid, io.in[1].valid) @[Arbiter.scala 31:68]
    node _grant_T_1 = or(_grant_T, io.in[2].valid) @[Arbiter.scala 31:68]
    node grant_1 = eq(io.in[0].valid, UInt<1>("h00")) @[Arbiter.scala 31:78]
    node grant_2 = eq(_grant_T, UInt<1>("h00")) @[Arbiter.scala 31:78]
    node grant_3 = eq(_grant_T_1, UInt<1>("h00")) @[Arbiter.scala 31:78]
    node _io_in_0_ready_T = and(UInt<1>("h01"), io.out.ready) @[Arbiter.scala 134:19]
    io.in[0].ready <= _io_in_0_ready_T @[Arbiter.scala 134:14]
    node _io_in_1_ready_T = and(grant_1, io.out.ready) @[Arbiter.scala 134:19]
    io.in[1].ready <= _io_in_1_ready_T @[Arbiter.scala 134:14]
    node _io_in_2_ready_T = and(grant_2, io.out.ready) @[Arbiter.scala 134:19]
    io.in[2].ready <= _io_in_2_ready_T @[Arbiter.scala 134:14]
    node _io_in_3_ready_T = and(grant_3, io.out.ready) @[Arbiter.scala 134:19]
    io.in[3].ready <= _io_in_3_ready_T @[Arbiter.scala 134:14]
    node _io_out_valid_T = eq(grant_3, UInt<1>("h00")) @[Arbiter.scala 135:19]
    node _io_out_valid_T_1 = or(_io_out_valid_T, io.in[3].valid) @[Arbiter.scala 135:31]
    io.out.valid <= _io_out_valid_T_1 @[Arbiter.scala 135:16]
    
  module Task1_Lab8 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {memory_out : UInt<32>[4], flip requestor : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}[4], flip Readaddr : UInt<5>, flip Writeaddr : UInt<5>, flip write : UInt<1>, out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<4>}}
    
    inst queue1 of Queue @[Decoupled.scala 296:21]
    queue1.clock <= clock
    queue1.reset <= reset
    queue1.io.enq.valid <= io.requestor[0].valid @[Decoupled.scala 297:22]
    queue1.io.enq.bits <= io.requestor[0].bits @[Decoupled.scala 298:21]
    io.requestor[0].ready <= queue1.io.enq.ready @[Decoupled.scala 299:17]
    inst queue2 of Queue_1 @[Decoupled.scala 296:21]
    queue2.clock <= clock
    queue2.reset <= reset
    queue2.io.enq.valid <= io.requestor[1].valid @[Decoupled.scala 297:22]
    queue2.io.enq.bits <= io.requestor[1].bits @[Decoupled.scala 298:21]
    io.requestor[1].ready <= queue2.io.enq.ready @[Decoupled.scala 299:17]
    inst queue3 of Queue_2 @[Decoupled.scala 296:21]
    queue3.clock <= clock
    queue3.reset <= reset
    queue3.io.enq.valid <= io.requestor[2].valid @[Decoupled.scala 297:22]
    queue3.io.enq.bits <= io.requestor[2].bits @[Decoupled.scala 298:21]
    io.requestor[2].ready <= queue3.io.enq.ready @[Decoupled.scala 299:17]
    inst queue4 of Queue_3 @[Decoupled.scala 296:21]
    queue4.clock <= clock
    queue4.reset <= reset
    queue4.io.enq.valid <= io.requestor[3].valid @[Decoupled.scala 297:22]
    queue4.io.enq.bits <= io.requestor[3].bits @[Decoupled.scala 298:21]
    io.requestor[3].ready <= queue4.io.enq.ready @[Decoupled.scala 299:17]
    inst arb_priority of Arbiter @[Task1_Lab8.scala 24:31]
    arb_priority.clock <= clock
    arb_priority.reset <= reset
    arb_priority.io.in[0].bits <= queue1.io.deq.bits @[Task1_Lab8.scala 25:12]
    arb_priority.io.in[0].valid <= queue1.io.deq.valid @[Task1_Lab8.scala 25:12]
    queue1.io.deq.ready <= arb_priority.io.in[0].ready @[Task1_Lab8.scala 25:12]
    arb_priority.io.in[1].bits <= queue2.io.deq.bits @[Task1_Lab8.scala 26:12]
    arb_priority.io.in[1].valid <= queue2.io.deq.valid @[Task1_Lab8.scala 26:12]
    queue2.io.deq.ready <= arb_priority.io.in[1].ready @[Task1_Lab8.scala 26:12]
    arb_priority.io.in[2].bits <= queue3.io.deq.bits @[Task1_Lab8.scala 27:12]
    arb_priority.io.in[2].valid <= queue3.io.deq.valid @[Task1_Lab8.scala 27:12]
    queue3.io.deq.ready <= arb_priority.io.in[2].ready @[Task1_Lab8.scala 27:12]
    arb_priority.io.in[3].bits <= queue4.io.deq.bits @[Task1_Lab8.scala 28:12]
    arb_priority.io.in[3].valid <= queue4.io.deq.valid @[Task1_Lab8.scala 28:12]
    queue4.io.deq.ready <= arb_priority.io.in[3].ready @[Task1_Lab8.scala 28:12]
    io.out.bits <= arb_priority.io.out.bits @[Task1_Lab8.scala 29:12]
    io.out.valid <= arb_priority.io.out.valid @[Task1_Lab8.scala 29:12]
    arb_priority.io.out.ready <= io.out.ready @[Task1_Lab8.scala 29:12]
    cmem memory1 : UInt<32>[1024] @[Task1_Lab8.scala 32:23]
    cmem memory2 : UInt<32>[1024] @[Task1_Lab8.scala 33:23]
    cmem memory3 : UInt<32>[1024] @[Task1_Lab8.scala 34:23]
    cmem memory4 : UInt<32>[1024] @[Task1_Lab8.scala 35:23]
    when io.write : @[Task1_Lab8.scala 37:19]
      node _T = bits(arb_priority.io.out.bits, 0, 0) @[Task1_Lab8.scala 38:60]
      write mport MPORT = memory1[io.Writeaddr], clock
      MPORT <= _T
      node _T_1 = bits(arb_priority.io.out.bits, 1, 1) @[Task1_Lab8.scala 39:60]
      write mport MPORT_1 = memory2[io.Writeaddr], clock
      MPORT_1 <= _T_1
      node _T_2 = bits(arb_priority.io.out.bits, 2, 2) @[Task1_Lab8.scala 40:60]
      write mport MPORT_2 = memory3[io.Writeaddr], clock
      MPORT_2 <= _T_2
      node _T_3 = bits(arb_priority.io.out.bits, 3, 3) @[Task1_Lab8.scala 41:60]
      write mport MPORT_3 = memory4[io.Writeaddr], clock
      MPORT_3 <= _T_3
      skip @[Task1_Lab8.scala 37:19]
    read mport io_memory_out_0_MPORT = memory1[io.Readaddr], clock @[Task1_Lab8.scala 43:35]
    io.memory_out[0] <= io_memory_out_0_MPORT @[Task1_Lab8.scala 43:21]
    read mport io_memory_out_1_MPORT = memory2[io.Readaddr], clock @[Task1_Lab8.scala 44:35]
    io.memory_out[1] <= io_memory_out_1_MPORT @[Task1_Lab8.scala 44:21]
    read mport io_memory_out_2_MPORT = memory3[io.Readaddr], clock @[Task1_Lab8.scala 45:35]
    io.memory_out[2] <= io_memory_out_2_MPORT @[Task1_Lab8.scala 45:21]
    read mport io_memory_out_3_MPORT = memory4[io.Readaddr], clock @[Task1_Lab8.scala 46:35]
    io.memory_out[3] <= io_memory_out_3_MPORT @[Task1_Lab8.scala 46:21]
    
