circuit Task1_Lab8 :
  module Queue :
    input clock : Clock
    input reset : UInt<1>
    output io_enq_ready : UInt<1>
    input io_enq_valid : UInt<1>
    input io_enq_bits : UInt<32>
    input io_deq_ready : UInt<1>
    output io_deq_valid : UInt<1>
    output io_deq_bits : UInt<32>
    output io_count : UInt<1>

    mem ram : @[Decoupled.scala 218:16]
      data-type => UInt<32>
      depth => 1
      read-latency => 0
      write-latency => 1
      reader => io_deq_bits_MPORT
      writer => MPORT
      read-under-write => undefined
    reg maybe_full : UInt<1>, clock with :
      reset => (UInt<1>("h0"), maybe_full) @[Decoupled.scala 221:27]
    node value = UInt<1>("h0")
    node value_1 = UInt<1>("h0")
    node ptr_match = eq(value, value_1) @[Decoupled.scala 223:33]
    node _empty_T = eq(maybe_full, UInt<1>("h0")) @[Decoupled.scala 224:28]
    node empty = and(ptr_match, _empty_T) @[Decoupled.scala 224:25]
    node full = and(ptr_match, maybe_full) @[Decoupled.scala 225:24]
    node _do_enq_T = and(io_enq_ready, io_enq_valid) @[Decoupled.scala 40:37]
    node _do_deq_T = and(io_deq_ready, io_deq_valid) @[Decoupled.scala 40:37]
    node do_enq = _do_enq_T
    node _GEN_0 = validif(do_enq, UInt<1>("h0")) @[Decoupled.scala 229:17 Decoupled.scala 230:8]
    node _GEN_1 = validif(do_enq, clock) @[Decoupled.scala 229:17 Decoupled.scala 230:8]
    node _GEN_2 = mux(do_enq, UInt<1>("h1"), UInt<1>("h0")) @[Decoupled.scala 229:17 Decoupled.scala 230:8 Decoupled.scala 218:16]
    node _GEN_3 = validif(do_enq, UInt<1>("h1")) @[Decoupled.scala 229:17 Decoupled.scala 230:24]
    node _GEN_4 = validif(do_enq, io_enq_bits) @[Decoupled.scala 229:17 Decoupled.scala 230:24]
    node do_deq = _do_deq_T
    node _T = neq(do_enq, do_deq) @[Decoupled.scala 236:16]
    node _GEN_5 = mux(_T, do_enq, maybe_full) @[Decoupled.scala 236:28 Decoupled.scala 237:16 Decoupled.scala 221:27]
    node _io_deq_valid_T = eq(empty, UInt<1>("h0")) @[Decoupled.scala 240:19]
    node _io_enq_ready_T = eq(full, UInt<1>("h0")) @[Decoupled.scala 241:19]
    node _ptr_diff_T = sub(value, value_1) @[Decoupled.scala 257:32]
    node ptr_diff = tail(_ptr_diff_T, 1) @[Decoupled.scala 257:32]
    node _io_count_T = and(maybe_full, ptr_match) @[Decoupled.scala 259:32]
    node _io_count_T_1 = mux(_io_count_T, UInt<1>("h1"), UInt<1>("h0")) @[Decoupled.scala 259:20]
    node _io_count_T_2 = or(_io_count_T_1, ptr_diff) @[Decoupled.scala 259:62]
    io_enq_ready <= _io_enq_ready_T @[Decoupled.scala 241:16]
    io_deq_valid <= _io_deq_valid_T @[Decoupled.scala 240:16]
    io_deq_bits <= ram.io_deq_bits_MPORT.data @[Decoupled.scala 242:15]
    io_count <= _io_count_T_2 @[Decoupled.scala 259:14]
    ram.io_deq_bits_MPORT.addr <= UInt<1>("h0") @[Decoupled.scala 242:21]
    ram.io_deq_bits_MPORT.en <= UInt<1>("h1") @[Decoupled.scala 242:21]
    ram.io_deq_bits_MPORT.clk <= clock @[Decoupled.scala 242:21]
    ram.MPORT.addr <= _GEN_0
    ram.MPORT.en <= _GEN_2
    ram.MPORT.clk <= _GEN_1
    ram.MPORT.data <= _GEN_4
    ram.MPORT.mask <= _GEN_3
    maybe_full <= mux(reset, UInt<1>("h0"), _GEN_5) @[Decoupled.scala 221:27 Decoupled.scala 221:27]

  module Arbiter :
    input clock : Clock
    input reset : UInt<1>
    output io_in_0_ready : UInt<1>
    input io_in_0_valid : UInt<1>
    input io_in_0_bits : UInt<32>
    output io_in_1_ready : UInt<1>
    input io_in_1_valid : UInt<1>
    input io_in_1_bits : UInt<32>
    output io_in_2_ready : UInt<1>
    input io_in_2_valid : UInt<1>
    input io_in_2_bits : UInt<32>
    output io_in_3_ready : UInt<1>
    input io_in_3_valid : UInt<1>
    input io_in_3_bits : UInt<32>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : UInt<32>
    output io_chosen : UInt<2>

    node _GEN_0 = mux(io_in_2_valid, UInt<2>("h2"), UInt<2>("h3")) @[Arbiter.scala 126:27 Arbiter.scala 127:17 Arbiter.scala 123:13]
    node _GEN_1 = mux(io_in_2_valid, io_in_2_bits, io_in_3_bits) @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
    node _GEN_2 = mux(io_in_1_valid, UInt<1>("h1"), _GEN_0) @[Arbiter.scala 126:27 Arbiter.scala 127:17]
    node _GEN_3 = mux(io_in_1_valid, io_in_1_bits, _GEN_1) @[Arbiter.scala 126:27 Arbiter.scala 128:19]
    node _GEN_4 = mux(io_in_0_valid, UInt<1>("h0"), _GEN_2) @[Arbiter.scala 126:27 Arbiter.scala 127:17]
    node _GEN_5 = mux(io_in_0_valid, io_in_0_bits, _GEN_3) @[Arbiter.scala 126:27 Arbiter.scala 128:19]
    node _grant_T = or(io_in_0_valid, io_in_1_valid) @[Arbiter.scala 31:68]
    node _grant_T_1 = or(_grant_T, io_in_2_valid) @[Arbiter.scala 31:68]
    node grant_1 = eq(io_in_0_valid, UInt<1>("h0")) @[Arbiter.scala 31:78]
    node grant_2 = eq(_grant_T, UInt<1>("h0")) @[Arbiter.scala 31:78]
    node grant_3 = eq(_grant_T_1, UInt<1>("h0")) @[Arbiter.scala 31:78]
    node _io_in_0_ready_T = and(UInt<1>("h1"), io_out_ready) @[Arbiter.scala 134:19]
    node _io_in_1_ready_T = and(grant_1, io_out_ready) @[Arbiter.scala 134:19]
    node _io_in_2_ready_T = and(grant_2, io_out_ready) @[Arbiter.scala 134:19]
    node _io_in_3_ready_T = and(grant_3, io_out_ready) @[Arbiter.scala 134:19]
    node _io_out_valid_T = eq(grant_3, UInt<1>("h0")) @[Arbiter.scala 135:19]
    node _io_out_valid_T_1 = or(_io_out_valid_T, io_in_3_valid) @[Arbiter.scala 135:31]
    io_in_0_ready <= _io_in_0_ready_T @[Arbiter.scala 134:14]
    io_in_1_ready <= _io_in_1_ready_T @[Arbiter.scala 134:14]
    io_in_2_ready <= _io_in_2_ready_T @[Arbiter.scala 134:14]
    io_in_3_ready <= _io_in_3_ready_T @[Arbiter.scala 134:14]
    io_out_valid <= _io_out_valid_T_1 @[Arbiter.scala 135:16]
    io_out_bits <= _GEN_5
    io_chosen <= _GEN_4

  module Task1_Lab8 :
    input clock : Clock
    input reset : UInt<1>
    output io_memory_out_0 : UInt<32>
    output io_memory_out_1 : UInt<32>
    output io_memory_out_2 : UInt<32>
    output io_memory_out_3 : UInt<32>
    output io_requestor_0_ready : UInt<1>
    input io_requestor_0_valid : UInt<1>
    input io_requestor_0_bits : UInt<32>
    output io_requestor_1_ready : UInt<1>
    input io_requestor_1_valid : UInt<1>
    input io_requestor_1_bits : UInt<32>
    output io_requestor_2_ready : UInt<1>
    input io_requestor_2_valid : UInt<1>
    input io_requestor_2_bits : UInt<32>
    output io_requestor_3_ready : UInt<1>
    input io_requestor_3_valid : UInt<1>
    input io_requestor_3_bits : UInt<32>
    input io_Readaddr : UInt<5>
    input io_Writeaddr : UInt<5>
    input io_write : UInt<1>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : UInt<4>

    inst queue1 of Queue @[Decoupled.scala 296:21]
    inst queue2 of Queue @[Decoupled.scala 296:21]
    inst queue3 of Queue @[Decoupled.scala 296:21]
    inst queue4 of Queue @[Decoupled.scala 296:21]
    inst arb_priority of Arbiter @[Task1_Lab8.scala 24:31]
    mem memory1 : @[Task1_Lab8.scala 33:23]
      data-type => UInt<32>
      depth => 1024
      read-latency => 0
      write-latency => 1
      reader => io_memory_out_0_MPORT
      writer => MPORT
      read-under-write => undefined
    mem memory2 : @[Task1_Lab8.scala 34:23]
      data-type => UInt<32>
      depth => 1024
      read-latency => 0
      write-latency => 1
      reader => io_memory_out_1_MPORT
      writer => MPORT_1
      read-under-write => undefined
    mem memory3 : @[Task1_Lab8.scala 35:23]
      data-type => UInt<32>
      depth => 1024
      read-latency => 0
      write-latency => 1
      reader => io_memory_out_2_MPORT
      writer => MPORT_2
      read-under-write => undefined
    mem memory4 : @[Task1_Lab8.scala 36:23]
      data-type => UInt<32>
      depth => 1024
      read-latency => 0
      write-latency => 1
      reader => io_memory_out_3_MPORT
      writer => MPORT_3
      read-under-write => undefined
    node _T = bits(arb_priority.io_out_bits, 0, 0) @[Task1_Lab8.scala 39:60]
    node _T_1 = bits(arb_priority.io_out_bits, 1, 1) @[Task1_Lab8.scala 40:60]
    node _T_2 = bits(arb_priority.io_out_bits, 2, 2) @[Task1_Lab8.scala 41:60]
    node _T_3 = bits(arb_priority.io_out_bits, 3, 3) @[Task1_Lab8.scala 42:60]
    node _GEN_0 = validif(io_write, io_Writeaddr) @[Task1_Lab8.scala 38:19]
    node _GEN_1 = validif(io_write, clock) @[Task1_Lab8.scala 38:19]
    node _GEN_2 = mux(io_write, UInt<1>("h1"), UInt<1>("h0")) @[Task1_Lab8.scala 38:19 Task1_Lab8.scala 33:23]
    node _GEN_3 = validif(io_write, UInt<1>("h1")) @[Task1_Lab8.scala 38:19]
    node _GEN_4 = validif(io_write, _T) @[Task1_Lab8.scala 38:19]
    node _GEN_5 = validif(io_write, _T_1) @[Task1_Lab8.scala 38:19]
    node _GEN_6 = validif(io_write, _T_2) @[Task1_Lab8.scala 38:19]
    node _GEN_7 = validif(io_write, _T_3) @[Task1_Lab8.scala 38:19]
    io_memory_out_0 <= memory1.io_memory_out_0_MPORT.data @[Task1_Lab8.scala 44:21]
    io_memory_out_1 <= memory2.io_memory_out_1_MPORT.data @[Task1_Lab8.scala 45:21]
    io_memory_out_2 <= memory3.io_memory_out_2_MPORT.data @[Task1_Lab8.scala 46:21]
    io_memory_out_3 <= memory4.io_memory_out_3_MPORT.data @[Task1_Lab8.scala 47:21]
    io_requestor_0_ready <= queue1.io_enq_ready @[Decoupled.scala 299:17]
    io_requestor_1_ready <= queue2.io_enq_ready @[Decoupled.scala 299:17]
    io_requestor_2_ready <= queue3.io_enq_ready @[Decoupled.scala 299:17]
    io_requestor_3_ready <= queue4.io_enq_ready @[Decoupled.scala 299:17]
    io_out_valid <= arb_priority.io_out_valid @[Task1_Lab8.scala 30:12]
    io_out_bits <= bits(arb_priority.io_out_bits, 3, 0) @[Task1_Lab8.scala 30:12]
    queue1.clock <= clock
    queue1.reset <= reset
    queue1.io_enq_valid <= io_requestor_0_valid @[Decoupled.scala 297:22]
    queue1.io_enq_bits <= io_requestor_0_bits @[Decoupled.scala 298:21]
    queue1.io_deq_ready <= arb_priority.io_in_0_ready @[Task1_Lab8.scala 27:27]
    queue2.clock <= clock
    queue2.reset <= reset
    queue2.io_enq_valid <= io_requestor_1_valid @[Decoupled.scala 297:22]
    queue2.io_enq_bits <= io_requestor_1_bits @[Decoupled.scala 298:21]
    queue2.io_deq_ready <= arb_priority.io_in_1_ready @[Task1_Lab8.scala 26:27]
    queue3.clock <= clock
    queue3.reset <= reset
    queue3.io_enq_valid <= io_requestor_2_valid @[Decoupled.scala 297:22]
    queue3.io_enq_bits <= io_requestor_2_bits @[Decoupled.scala 298:21]
    queue3.io_deq_ready <= arb_priority.io_in_2_ready @[Task1_Lab8.scala 28:27]
    queue4.clock <= clock
    queue4.reset <= reset
    queue4.io_enq_valid <= io_requestor_3_valid @[Decoupled.scala 297:22]
    queue4.io_enq_bits <= io_requestor_3_bits @[Decoupled.scala 298:21]
    queue4.io_deq_ready <= arb_priority.io_in_3_ready @[Task1_Lab8.scala 29:27]
    arb_priority.clock <= clock
    arb_priority.reset <= reset
    arb_priority.io_in_0_valid <= queue1.io_deq_valid @[Task1_Lab8.scala 27:27]
    arb_priority.io_in_0_bits <= queue1.io_deq_bits @[Task1_Lab8.scala 27:27]
    arb_priority.io_in_1_valid <= queue2.io_deq_valid @[Task1_Lab8.scala 26:27]
    arb_priority.io_in_1_bits <= queue2.io_deq_bits @[Task1_Lab8.scala 26:27]
    arb_priority.io_in_2_valid <= queue3.io_deq_valid @[Task1_Lab8.scala 28:27]
    arb_priority.io_in_2_bits <= queue3.io_deq_bits @[Task1_Lab8.scala 28:27]
    arb_priority.io_in_3_valid <= queue4.io_deq_valid @[Task1_Lab8.scala 29:27]
    arb_priority.io_in_3_bits <= queue4.io_deq_bits @[Task1_Lab8.scala 29:27]
    arb_priority.io_out_ready <= io_out_ready @[Task1_Lab8.scala 30:12]
    memory1.io_memory_out_0_MPORT.addr <= io_Readaddr @[Task1_Lab8.scala 44:35]
    memory1.io_memory_out_0_MPORT.en <= UInt<1>("h1") @[Task1_Lab8.scala 44:35]
    memory1.io_memory_out_0_MPORT.clk <= clock @[Task1_Lab8.scala 44:35]
    memory1.MPORT.addr <= _GEN_0
    memory1.MPORT.en <= _GEN_2
    memory1.MPORT.clk <= _GEN_1
    memory1.MPORT.data <= _GEN_4
    memory1.MPORT.mask <= _GEN_3
    memory2.io_memory_out_1_MPORT.addr <= io_Readaddr @[Task1_Lab8.scala 45:35]
    memory2.io_memory_out_1_MPORT.en <= UInt<1>("h1") @[Task1_Lab8.scala 45:35]
    memory2.io_memory_out_1_MPORT.clk <= clock @[Task1_Lab8.scala 45:35]
    memory2.MPORT_1.addr <= _GEN_0
    memory2.MPORT_1.en <= _GEN_2
    memory2.MPORT_1.clk <= _GEN_1
    memory2.MPORT_1.data <= _GEN_5
    memory2.MPORT_1.mask <= _GEN_3
    memory3.io_memory_out_2_MPORT.addr <= io_Readaddr @[Task1_Lab8.scala 46:35]
    memory3.io_memory_out_2_MPORT.en <= UInt<1>("h1") @[Task1_Lab8.scala 46:35]
    memory3.io_memory_out_2_MPORT.clk <= clock @[Task1_Lab8.scala 46:35]
    memory3.MPORT_2.addr <= _GEN_0
    memory3.MPORT_2.en <= _GEN_2
    memory3.MPORT_2.clk <= _GEN_1
    memory3.MPORT_2.data <= _GEN_6
    memory3.MPORT_2.mask <= _GEN_3
    memory4.io_memory_out_3_MPORT.addr <= io_Readaddr @[Task1_Lab8.scala 47:35]
    memory4.io_memory_out_3_MPORT.en <= UInt<1>("h1") @[Task1_Lab8.scala 47:35]
    memory4.io_memory_out_3_MPORT.clk <= clock @[Task1_Lab8.scala 47:35]
    memory4.MPORT_3.addr <= _GEN_0
    memory4.MPORT_3.en <= _GEN_2
    memory4.MPORT_3.clk <= _GEN_1
    memory4.MPORT_3.data <= _GEN_7
    memory4.MPORT_3.mask <= _GEN_3
