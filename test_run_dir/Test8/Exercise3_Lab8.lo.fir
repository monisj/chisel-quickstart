circuit Exercise3_Lab8 :
  module Exercise3_Lab8 :
    input clock : Clock
    input reset : UInt<1>
    input io_addr : UInt<32>
    output io_inst : UInt<32>

    mem i_mem : @[Exercise3_Lab8.scala 15:20]
      data-type => UInt<32>
      depth => 32
      read-latency => 0
      write-latency => 1
      reader => io_inst_MPORT
      read-under-write => undefined
    node _io_inst_T = bits(io_addr, 4, 0) @[Exercise3_Lab8.scala 17:21]
    io_inst <= i_mem.io_inst_MPORT.data @[Exercise3_Lab8.scala 17:13]
    i_mem.io_inst_MPORT.addr <= _io_inst_T @[Exercise3_Lab8.scala 17:21]
    i_mem.io_inst_MPORT.en <= UInt<1>("h1") @[Exercise3_Lab8.scala 17:21]
    i_mem.io_inst_MPORT.clk <= clock @[Exercise3_Lab8.scala 17:21]
