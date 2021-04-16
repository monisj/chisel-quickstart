circuit Exercise2_Lab8 :
  module Exercise2_Lab8 :
    input clock : Clock
    input reset : UInt<1>
    input io_enable : UInt<1>
    input io_write : UInt<1>
    input io_addr : UInt<10>
    input io_mask_0 : UInt<1>
    input io_mask_1 : UInt<1>
    input io_dataIn_0 : UInt<16>
    input io_dataIn_1 : UInt<16>
    output io_dataOut_0 : UInt<16>
    output io_dataOut_1 : UInt<16>

    mem mem_0 : @[Exercise2_Lab8.scala 17:27]
      data-type => UInt<16>
      depth => 1024
      read-latency => 1
      write-latency => 1
      reader => memread
      writer => MPORT
      read-under-write => undefined
    mem mem_1 : @[Exercise2_Lab8.scala 17:27]
      data-type => UInt<16>
      depth => 1024
      read-latency => 1
      write-latency => 1
      reader => memread
      writer => MPORT
      read-under-write => undefined
    reg wrDataReg_0 : UInt<16>, clock with :
      reset => (UInt<1>("h0"), wrDataReg_0) @[Exercise2_Lab8.scala 18:29]
    reg wrDataReg_1 : UInt<16>, clock with :
      reset => (UInt<1>("h0"), wrDataReg_1) @[Exercise2_Lab8.scala 18:29]
    node _doForwardReg_T = eq(io_enable, UInt<1>("h1")) @[Exercise2_Lab8.scala 19:44]
    node _doForwardReg_T_1 = eq(io_write, UInt<1>("h1")) @[Exercise2_Lab8.scala 19:67]
    node _doForwardReg_T_2 = and(_doForwardReg_T, _doForwardReg_T_1) @[Exercise2_Lab8.scala 19:55]
    reg doForwardReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), doForwardReg) @[Exercise2_Lab8.scala 19:32]
    node _GEN_0 = validif(io_enable, io_addr) @[Exercise2_Lab8.scala 20:26 Exercise2_Lab8.scala 20:26]
    node _memread_WIRE = _GEN_0 @[Exercise2_Lab8.scala 20:26]
    node _memread_T = or(_memread_WIRE, UInt<10>("h0")) @[Exercise2_Lab8.scala 20:26]
    node _memread_T_1 = bits(_memread_T, 9, 0) @[Exercise2_Lab8.scala 20:26]
    node _GEN_1 = mux(io_enable, UInt<1>("h1"), UInt<1>("h0")) @[Exercise2_Lab8.scala 20:26 Exercise2_Lab8.scala 20:26 Exercise2_Lab8.scala 17:27]
    node _GEN_2 = validif(io_enable, _memread_T_1) @[Exercise2_Lab8.scala 20:26 Exercise2_Lab8.scala 20:26]
    node _GEN_3 = validif(io_enable, clock) @[Exercise2_Lab8.scala 20:26 Exercise2_Lab8.scala 20:26]
    node _GEN_4 = validif(io_mask_0, io_dataIn_0)
    node _GEN_5 = mux(io_mask_0, UInt<1>("h1"), UInt<1>("h0"))
    node _GEN_6 = validif(io_mask_1, io_dataIn_1)
    node _GEN_7 = mux(io_mask_1, UInt<1>("h1"), UInt<1>("h0"))
    node _GEN_8 = validif(io_write, io_addr) @[Exercise2_Lab8.scala 24:19]
    node _GEN_9 = validif(io_write, clock) @[Exercise2_Lab8.scala 24:19]
    node _GEN_10 = mux(io_write, UInt<1>("h1"), UInt<1>("h0")) @[Exercise2_Lab8.scala 24:19 Exercise2_Lab8.scala 17:27]
    node _GEN_11 = validif(io_write, _GEN_5) @[Exercise2_Lab8.scala 24:19]
    node _GEN_12 = validif(io_write, _GEN_7) @[Exercise2_Lab8.scala 24:19]
    node _GEN_13 = validif(io_write, _GEN_4) @[Exercise2_Lab8.scala 24:19]
    node _GEN_14 = validif(io_write, _GEN_6) @[Exercise2_Lab8.scala 24:19]
    node _T = eq(doForwardReg, UInt<1>("h1")) @[Exercise2_Lab8.scala 28:23]
    node _io_dataOut_0_T = mux(io_mask_0, wrDataReg_0, UInt<1>("h0")) @[Exercise2_Lab8.scala 30:51]
    node _io_dataOut_0_T_1 = mux(doForwardReg, _io_dataOut_0_T, UInt<1>("h0")) @[Exercise2_Lab8.scala 30:34]
    node _io_dataOut_1_T = mux(io_mask_1, wrDataReg_1, UInt<1>("h0")) @[Exercise2_Lab8.scala 30:51]
    node _io_dataOut_1_T_1 = mux(doForwardReg, _io_dataOut_1_T, UInt<1>("h0")) @[Exercise2_Lab8.scala 30:34]
    node _GEN_15 = mux(_T, _io_dataOut_0_T_1, mem_0.memread.data) @[Exercise2_Lab8.scala 28:31 Exercise2_Lab8.scala 30:29 Exercise2_Lab8.scala 33:23]
    node _GEN_16 = mux(_T, _io_dataOut_1_T_1, mem_1.memread.data) @[Exercise2_Lab8.scala 28:31 Exercise2_Lab8.scala 30:29 Exercise2_Lab8.scala 33:23]
    io_dataOut_0 <= _GEN_15
    io_dataOut_1 <= _GEN_16
    mem_0.memread.addr <= _GEN_2
    mem_1.memread.addr <= _GEN_2
    mem_0.memread.en <= _GEN_1
    mem_1.memread.en <= _GEN_1
    mem_0.memread.clk <= _GEN_3
    mem_1.memread.clk <= _GEN_3
    mem_0.MPORT.addr <= _GEN_8
    mem_1.MPORT.addr <= _GEN_8
    mem_0.MPORT.en <= _GEN_10
    mem_1.MPORT.en <= _GEN_10
    mem_0.MPORT.clk <= _GEN_9
    mem_1.MPORT.clk <= _GEN_9
    mem_0.MPORT.data <= _GEN_13
    mem_1.MPORT.data <= _GEN_14
    mem_0.MPORT.mask <= _GEN_11
    mem_1.MPORT.mask <= _GEN_12
    wrDataReg_0 <= io_dataIn_0 @[Exercise2_Lab8.scala 18:29]
    wrDataReg_1 <= io_dataIn_1 @[Exercise2_Lab8.scala 18:29]
    doForwardReg <= _doForwardReg_T_2 @[Exercise2_Lab8.scala 19:32]
