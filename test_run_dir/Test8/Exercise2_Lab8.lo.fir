circuit Exercise2_Lab8 :
  module Exercise2_Lab8 :
    input clock : Clock
    input reset : UInt<1>
    input io_enable : UInt<1>
    input io_write : UInt<1>
    input io_addr : UInt<10>
    input io_mask_0 : UInt<1>
    input io_mask_1 : UInt<1>
    input io_mask_2 : UInt<1>
    input io_mask_3 : UInt<1>
    input io_dataIn_0 : UInt<8>
    input io_dataIn_1 : UInt<8>
    input io_dataIn_2 : UInt<8>
    input io_dataIn_3 : UInt<8>
    output io_dataOut_0 : UInt<8>
    output io_dataOut_1 : UInt<8>
    output io_dataOut_2 : UInt<8>
    output io_dataOut_3 : UInt<8>
    input io_rdAddr : UInt<10>
    input io_wrAddr : UInt<10>

    mem mem_0 : @[Exercise2_Lab8.scala 18:27]
      data-type => UInt<8>
      depth => 1024
      read-latency => 1
      write-latency => 1
      reader => memread
      writer => MPORT
      read-under-write => undefined
    mem mem_1 : @[Exercise2_Lab8.scala 18:27]
      data-type => UInt<8>
      depth => 1024
      read-latency => 1
      write-latency => 1
      reader => memread
      writer => MPORT
      read-under-write => undefined
    mem mem_2 : @[Exercise2_Lab8.scala 18:27]
      data-type => UInt<8>
      depth => 1024
      read-latency => 1
      write-latency => 1
      reader => memread
      writer => MPORT
      read-under-write => undefined
    mem mem_3 : @[Exercise2_Lab8.scala 18:27]
      data-type => UInt<8>
      depth => 1024
      read-latency => 1
      write-latency => 1
      reader => memread
      writer => MPORT
      read-under-write => undefined
    reg wrDataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), wrDataReg) @[Exercise2_Lab8.scala 19:29]
    reg wrDataReg1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), wrDataReg1) @[Exercise2_Lab8.scala 20:30]
    node _doForwardReg_T = eq(io_wrAddr, io_rdAddr) @[Exercise2_Lab8.scala 21:46]
    node _doForwardReg_T_1 = and(_doForwardReg_T, io_enable) @[Exercise2_Lab8.scala 21:62]
    reg doForwardReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), doForwardReg) @[Exercise2_Lab8.scala 21:32]
    node _doForwardReg1_T = neq(io_wrAddr, io_rdAddr) @[Exercise2_Lab8.scala 22:47]
    node _doForwardReg1_T_1 = and(_doForwardReg1_T, io_enable) @[Exercise2_Lab8.scala 22:63]
    reg doForwardReg1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), doForwardReg1) @[Exercise2_Lab8.scala 22:33]
    node _GEN_0 = validif(io_enable, io_addr) @[Exercise2_Lab8.scala 23:26 Exercise2_Lab8.scala 23:26]
    node _memread_WIRE = _GEN_0 @[Exercise2_Lab8.scala 23:26]
    node _memread_T = or(_memread_WIRE, UInt<10>("h0")) @[Exercise2_Lab8.scala 23:26]
    node _memread_T_1 = bits(_memread_T, 9, 0) @[Exercise2_Lab8.scala 23:26]
    node _GEN_1 = mux(io_enable, UInt<1>("h1"), UInt<1>("h0")) @[Exercise2_Lab8.scala 23:26 Exercise2_Lab8.scala 23:26 Exercise2_Lab8.scala 18:27]
    node _GEN_2 = validif(io_enable, _memread_T_1) @[Exercise2_Lab8.scala 23:26 Exercise2_Lab8.scala 23:26]
    node _GEN_3 = validif(io_enable, clock) @[Exercise2_Lab8.scala 23:26 Exercise2_Lab8.scala 23:26]
    node _GEN_4 = validif(io_mask_0, io_dataIn_0)
    node _GEN_5 = mux(io_mask_0, UInt<1>("h1"), UInt<1>("h0"))
    node _GEN_6 = validif(io_mask_1, io_dataIn_1)
    node _GEN_7 = mux(io_mask_1, UInt<1>("h1"), UInt<1>("h0"))
    node _GEN_8 = validif(io_mask_2, io_dataIn_2)
    node _GEN_9 = mux(io_mask_2, UInt<1>("h1"), UInt<1>("h0"))
    node _GEN_10 = validif(io_mask_3, io_dataIn_3)
    node _GEN_11 = mux(io_mask_3, UInt<1>("h1"), UInt<1>("h0"))
    node _GEN_12 = validif(io_write, io_addr) @[Exercise2_Lab8.scala 28:19]
    node _GEN_13 = validif(io_write, clock) @[Exercise2_Lab8.scala 28:19]
    node _GEN_14 = mux(io_write, UInt<1>("h1"), UInt<1>("h0")) @[Exercise2_Lab8.scala 28:19 Exercise2_Lab8.scala 18:27]
    node _GEN_15 = validif(io_write, _GEN_5) @[Exercise2_Lab8.scala 28:19]
    node _GEN_16 = validif(io_write, _GEN_7) @[Exercise2_Lab8.scala 28:19]
    node _GEN_17 = validif(io_write, _GEN_9) @[Exercise2_Lab8.scala 28:19]
    node _GEN_18 = validif(io_write, _GEN_11) @[Exercise2_Lab8.scala 28:19]
    node _GEN_19 = validif(io_write, _GEN_4) @[Exercise2_Lab8.scala 28:19]
    node _GEN_20 = validif(io_write, _GEN_6) @[Exercise2_Lab8.scala 28:19]
    node _GEN_21 = validif(io_write, _GEN_8) @[Exercise2_Lab8.scala 28:19]
    node _GEN_22 = validif(io_write, _GEN_10) @[Exercise2_Lab8.scala 28:19]
    node _T = eq(doForwardReg, UInt<1>("h1")) @[Exercise2_Lab8.scala 32:23]
    node _T_1 = eq(doForwardReg1, UInt<1>("h1")) @[Exercise2_Lab8.scala 36:28]
    node _GEN_23 = mux(_T_1, wrDataReg1, mem_0.memread.data) @[Exercise2_Lab8.scala 36:36 Exercise2_Lab8.scala 37:18 Exercise2_Lab8.scala 39:23]
    node _GEN_24 = mux(_T_1, UInt<1>("h0"), mem_1.memread.data) @[Exercise2_Lab8.scala 36:36 Exercise2_Lab8.scala 25:18 Exercise2_Lab8.scala 39:23]
    node _GEN_25 = mux(_T_1, UInt<1>("h0"), mem_2.memread.data) @[Exercise2_Lab8.scala 36:36 Exercise2_Lab8.scala 26:18 Exercise2_Lab8.scala 39:23]
    node _GEN_26 = mux(_T_1, UInt<1>("h0"), mem_3.memread.data) @[Exercise2_Lab8.scala 36:36 Exercise2_Lab8.scala 27:18 Exercise2_Lab8.scala 39:23]
    node _GEN_27 = mux(_T, wrDataReg, _GEN_23) @[Exercise2_Lab8.scala 32:31 Exercise2_Lab8.scala 34:18]
    node _GEN_28 = mux(_T, UInt<1>("h0"), _GEN_24) @[Exercise2_Lab8.scala 32:31 Exercise2_Lab8.scala 25:18]
    node _GEN_29 = mux(_T, UInt<1>("h0"), _GEN_25) @[Exercise2_Lab8.scala 32:31 Exercise2_Lab8.scala 26:18]
    node _GEN_30 = mux(_T, UInt<1>("h0"), _GEN_26) @[Exercise2_Lab8.scala 32:31 Exercise2_Lab8.scala 27:18]
    io_dataOut_0 <= _GEN_27
    io_dataOut_1 <= _GEN_28
    io_dataOut_2 <= _GEN_29
    io_dataOut_3 <= _GEN_30
    mem_0.memread.addr <= _GEN_2
    mem_1.memread.addr <= _GEN_2
    mem_2.memread.addr <= _GEN_2
    mem_3.memread.addr <= _GEN_2
    mem_0.memread.en <= _GEN_1
    mem_1.memread.en <= _GEN_1
    mem_2.memread.en <= _GEN_1
    mem_3.memread.en <= _GEN_1
    mem_0.memread.clk <= _GEN_3
    mem_1.memread.clk <= _GEN_3
    mem_2.memread.clk <= _GEN_3
    mem_3.memread.clk <= _GEN_3
    mem_0.MPORT.addr <= _GEN_12
    mem_1.MPORT.addr <= _GEN_12
    mem_2.MPORT.addr <= _GEN_12
    mem_3.MPORT.addr <= _GEN_12
    mem_0.MPORT.en <= _GEN_14
    mem_1.MPORT.en <= _GEN_14
    mem_2.MPORT.en <= _GEN_14
    mem_3.MPORT.en <= _GEN_14
    mem_0.MPORT.clk <= _GEN_13
    mem_1.MPORT.clk <= _GEN_13
    mem_2.MPORT.clk <= _GEN_13
    mem_3.MPORT.clk <= _GEN_13
    mem_0.MPORT.data <= _GEN_19
    mem_1.MPORT.data <= _GEN_20
    mem_2.MPORT.data <= _GEN_21
    mem_3.MPORT.data <= _GEN_22
    mem_0.MPORT.mask <= _GEN_15
    mem_1.MPORT.mask <= _GEN_16
    mem_2.MPORT.mask <= _GEN_17
    mem_3.MPORT.mask <= _GEN_18
    wrDataReg <= io_dataIn_0 @[Exercise2_Lab8.scala 19:29]
    wrDataReg1 <= io_dataIn_1 @[Exercise2_Lab8.scala 20:30]
    doForwardReg <= _doForwardReg_T_1 @[Exercise2_Lab8.scala 21:32]
    doForwardReg1 <= _doForwardReg1_T_1 @[Exercise2_Lab8.scala 22:33]
