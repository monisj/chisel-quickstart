;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Exercise2_Lab8 : 
  module Exercise2_Lab8 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip enable : UInt<1>, flip write : UInt<1>, flip addr : UInt<10>, flip mask : UInt<1>[4], flip dataIn : UInt<8>[4], dataOut : UInt<8>[4], flip rdAddr : UInt<10>, flip wrAddr : UInt<10>}
    
    smem mem : UInt<8>[4][1024], undefined @[Exercise2_Lab8.scala 18:27]
    reg wrDataReg : UInt, clock @[Exercise2_Lab8.scala 19:29]
    wrDataReg <= io.dataIn[0] @[Exercise2_Lab8.scala 19:29]
    reg wrDataReg1 : UInt, clock @[Exercise2_Lab8.scala 20:30]
    wrDataReg1 <= io.dataIn[1] @[Exercise2_Lab8.scala 20:30]
    node _doForwardReg_T = eq(io.wrAddr, io.rdAddr) @[Exercise2_Lab8.scala 21:46]
    node _doForwardReg_T_1 = and(_doForwardReg_T, io.enable) @[Exercise2_Lab8.scala 21:62]
    reg doForwardReg : UInt<1>, clock @[Exercise2_Lab8.scala 21:32]
    doForwardReg <= _doForwardReg_T_1 @[Exercise2_Lab8.scala 21:32]
    node _doForwardReg1_T = neq(io.wrAddr, io.rdAddr) @[Exercise2_Lab8.scala 22:47]
    node _doForwardReg1_T_1 = and(_doForwardReg1_T, io.enable) @[Exercise2_Lab8.scala 22:63]
    reg doForwardReg1 : UInt<1>, clock @[Exercise2_Lab8.scala 22:33]
    doForwardReg1 <= _doForwardReg1_T_1 @[Exercise2_Lab8.scala 22:33]
    wire _memread_WIRE : UInt @[Exercise2_Lab8.scala 23:26]
    _memread_WIRE is invalid @[Exercise2_Lab8.scala 23:26]
    when io.enable : @[Exercise2_Lab8.scala 23:26]
      _memread_WIRE <= io.addr @[Exercise2_Lab8.scala 23:26]
      node _memread_T = or(_memread_WIRE, UInt<10>("h00")) @[Exercise2_Lab8.scala 23:26]
      node _memread_T_1 = bits(_memread_T, 9, 0) @[Exercise2_Lab8.scala 23:26]
      read mport memread = mem[_memread_T_1], clock @[Exercise2_Lab8.scala 23:26]
      skip @[Exercise2_Lab8.scala 23:26]
    io.dataOut[0] <= UInt<1>("h00") @[Exercise2_Lab8.scala 24:18]
    io.dataOut[1] <= UInt<1>("h00") @[Exercise2_Lab8.scala 25:18]
    io.dataOut[2] <= UInt<1>("h00") @[Exercise2_Lab8.scala 26:18]
    io.dataOut[3] <= UInt<1>("h00") @[Exercise2_Lab8.scala 27:18]
    when io.write : @[Exercise2_Lab8.scala 28:19]
      write mport MPORT = mem[io.addr], clock
      when io.mask[0] :
        MPORT[0] <= io.dataIn[0]
        skip
      when io.mask[1] :
        MPORT[1] <= io.dataIn[1]
        skip
      when io.mask[2] :
        MPORT[2] <= io.dataIn[2]
        skip
      when io.mask[3] :
        MPORT[3] <= io.dataIn[3]
        skip
      skip @[Exercise2_Lab8.scala 28:19]
    node _T = eq(doForwardReg, UInt<1>("h01")) @[Exercise2_Lab8.scala 32:23]
    when _T : @[Exercise2_Lab8.scala 32:31]
      io.dataOut[0] <= wrDataReg @[Exercise2_Lab8.scala 34:18]
      skip @[Exercise2_Lab8.scala 32:31]
    else : @[Exercise2_Lab8.scala 35:16]
      node _T_1 = eq(doForwardReg1, UInt<1>("h01")) @[Exercise2_Lab8.scala 36:28]
      when _T_1 : @[Exercise2_Lab8.scala 36:36]
        io.dataOut[0] <= wrDataReg1 @[Exercise2_Lab8.scala 37:18]
        skip @[Exercise2_Lab8.scala 36:36]
      else : @[Exercise2_Lab8.scala 38:20]
        io.dataOut[0] <= memread[0] @[Exercise2_Lab8.scala 39:23]
        io.dataOut[1] <= memread[1] @[Exercise2_Lab8.scala 39:23]
        io.dataOut[2] <= memread[2] @[Exercise2_Lab8.scala 39:23]
        io.dataOut[3] <= memread[3] @[Exercise2_Lab8.scala 39:23]
        skip @[Exercise2_Lab8.scala 38:20]
      skip @[Exercise2_Lab8.scala 35:16]
    
