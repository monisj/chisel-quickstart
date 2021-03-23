;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Exercise3_Lab2 : 
  module Exercise3_Lab2 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in0 : UInt<1>, flip in1 : UInt<1>, flip in2 : UInt<1>, flip in3 : UInt<1>, out1 : UInt<2>}
    
    node select_lo = cat(io.in2, io.in3) @[Cat.scala 30:58]
    node select_hi = cat(io.in0, io.in1) @[Cat.scala 30:58]
    node select = cat(select_hi, select_lo) @[Cat.scala 30:58]
    node _io_out1_T = bits(select, 0, 0) @[Mux.scala 29:36]
    node _io_out1_T_1 = bits(select, 1, 1) @[Mux.scala 29:36]
    node _io_out1_T_2 = bits(select, 2, 2) @[Mux.scala 29:36]
    node _io_out1_T_3 = bits(select, 3, 3) @[Mux.scala 29:36]
    node _io_out1_T_4 = mux(_io_out1_T, UInt<1>("h00"), UInt<1>("h00")) @[Mux.scala 27:72]
    node _io_out1_T_5 = mux(_io_out1_T_1, UInt<1>("h01"), UInt<1>("h00")) @[Mux.scala 27:72]
    node _io_out1_T_6 = mux(_io_out1_T_2, UInt<2>("h02"), UInt<1>("h00")) @[Mux.scala 27:72]
    node _io_out1_T_7 = mux(_io_out1_T_3, UInt<2>("h03"), UInt<1>("h00")) @[Mux.scala 27:72]
    node _io_out1_T_8 = or(_io_out1_T_4, _io_out1_T_5) @[Mux.scala 27:72]
    node _io_out1_T_9 = or(_io_out1_T_8, _io_out1_T_6) @[Mux.scala 27:72]
    node _io_out1_T_10 = or(_io_out1_T_9, _io_out1_T_7) @[Mux.scala 27:72]
    wire _io_out1_WIRE : UInt<2> @[Mux.scala 27:72]
    _io_out1_WIRE <= _io_out1_T_10 @[Mux.scala 27:72]
    io.out1 <= _io_out1_WIRE @[Exercise3_Lab2.scala 15:17]
    
