;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Exercise2_Lab8 : 
  module Exercise2_Lab8 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip enable : UInt<1>, flip write : UInt<1>, flip addr : UInt<10>, flip mask : UInt<1>[2], flip dataIn : UInt<16>[2], dataOut : UInt<16>[2]}
    
    smem mem : UInt<16>[2][1024], undefined @[Exercise2_Lab8.scala 17:27]
    reg wrDataReg : UInt<16>[2], clock @[Exercise2_Lab8.scala 18:29]
    wrDataReg[0] <= io.dataIn[0] @[Exercise2_Lab8.scala 18:29]
    wrDataReg[1] <= io.dataIn[1] @[Exercise2_Lab8.scala 18:29]
    node _doForwardReg_T = eq(io.enable, UInt<1>("h01")) @[Exercise2_Lab8.scala 19:44]
    node _doForwardReg_T_1 = eq(io.write, UInt<1>("h01")) @[Exercise2_Lab8.scala 19:67]
    node _doForwardReg_T_2 = and(_doForwardReg_T, _doForwardReg_T_1) @[Exercise2_Lab8.scala 19:55]
    reg doForwardReg : UInt<1>, clock @[Exercise2_Lab8.scala 19:32]
    doForwardReg <= _doForwardReg_T_2 @[Exercise2_Lab8.scala 19:32]
    wire _memread_WIRE : UInt @[Exercise2_Lab8.scala 20:26]
    _memread_WIRE is invalid @[Exercise2_Lab8.scala 20:26]
    when io.enable : @[Exercise2_Lab8.scala 20:26]
      _memread_WIRE <= io.addr @[Exercise2_Lab8.scala 20:26]
      node _memread_T = or(_memread_WIRE, UInt<10>("h00")) @[Exercise2_Lab8.scala 20:26]
      node _memread_T_1 = bits(_memread_T, 9, 0) @[Exercise2_Lab8.scala 20:26]
      read mport memread = mem[_memread_T_1], clock @[Exercise2_Lab8.scala 20:26]
      skip @[Exercise2_Lab8.scala 20:26]
    io.dataOut[0] <= UInt<1>("h00") @[Exercise2_Lab8.scala 21:18]
    io.dataOut[1] <= UInt<1>("h00") @[Exercise2_Lab8.scala 22:18]
    when io.write : @[Exercise2_Lab8.scala 24:19]
      write mport MPORT = mem[io.addr], clock
      when io.mask[0] :
        MPORT[0] <= io.dataIn[0]
        skip
      when io.mask[1] :
        MPORT[1] <= io.dataIn[1]
        skip
      skip @[Exercise2_Lab8.scala 24:19]
    node _T = eq(doForwardReg, UInt<1>("h01")) @[Exercise2_Lab8.scala 28:23]
    when _T : @[Exercise2_Lab8.scala 28:31]
      node _io_dataOut_0_T = mux(io.mask[0], wrDataReg[0], UInt<1>("h00")) @[Exercise2_Lab8.scala 30:51]
      node _io_dataOut_0_T_1 = mux(doForwardReg, _io_dataOut_0_T, UInt<1>("h00")) @[Exercise2_Lab8.scala 30:34]
      io.dataOut[0] <= _io_dataOut_0_T_1 @[Exercise2_Lab8.scala 30:29]
      node _io_dataOut_1_T = mux(io.mask[1], wrDataReg[1], UInt<1>("h00")) @[Exercise2_Lab8.scala 30:51]
      node _io_dataOut_1_T_1 = mux(doForwardReg, _io_dataOut_1_T, UInt<1>("h00")) @[Exercise2_Lab8.scala 30:34]
      io.dataOut[1] <= _io_dataOut_1_T_1 @[Exercise2_Lab8.scala 30:29]
      skip @[Exercise2_Lab8.scala 28:31]
    else : @[Exercise2_Lab8.scala 32:16]
      io.dataOut[0] <= memread[0] @[Exercise2_Lab8.scala 33:23]
      io.dataOut[1] <= memread[1] @[Exercise2_Lab8.scala 33:23]
      skip @[Exercise2_Lab8.scala 32:16]
    
