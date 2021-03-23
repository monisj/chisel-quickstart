;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Exercise2_Lab2 : 
  module Exercise2_Lab2 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in0 : UInt<4>, flip in1 : UInt<4>, flip in2 : UInt<4>, flip in3 : UInt<4>, flip in4 : UInt<4>, flip in5 : UInt<4>, flip in6 : UInt<4>, flip in7 : UInt<4>, flip sel_mux : UInt<1>, flip sel : UInt<2>, out : UInt<4>}
    
    node _Mux_1_T = eq(UInt<1>("h01"), io.sel) @[Mux.scala 80:60]
    node _Mux_1_T_1 = mux(_Mux_1_T, io.in1, io.in0) @[Mux.scala 80:57]
    node _Mux_1_T_2 = eq(UInt<2>("h02"), io.sel) @[Mux.scala 80:60]
    node _Mux_1_T_3 = mux(_Mux_1_T_2, io.in2, _Mux_1_T_1) @[Mux.scala 80:57]
    node _Mux_1_T_4 = eq(UInt<2>("h03"), io.sel) @[Mux.scala 80:60]
    node Mux_1 = mux(_Mux_1_T_4, io.in3, _Mux_1_T_3) @[Mux.scala 80:57]
    node _Mux_2_T = eq(UInt<1>("h01"), io.sel) @[Mux.scala 80:60]
    node _Mux_2_T_1 = mux(_Mux_2_T, io.in5, io.in4) @[Mux.scala 80:57]
    node _Mux_2_T_2 = eq(UInt<2>("h02"), io.sel) @[Mux.scala 80:60]
    node _Mux_2_T_3 = mux(_Mux_2_T_2, io.in6, _Mux_2_T_1) @[Mux.scala 80:57]
    node _Mux_2_T_4 = eq(UInt<2>("h03"), io.sel) @[Mux.scala 80:60]
    node Mux_2 = mux(_Mux_2_T_4, io.in7, _Mux_2_T_3) @[Mux.scala 80:57]
    node _io_out_T = eq(UInt<1>("h01"), io.sel_mux) @[Mux.scala 80:60]
    node _io_out_T_1 = mux(_io_out_T, Mux_2, Mux_1) @[Mux.scala 80:57]
    io.out <= _io_out_T_1 @[Exercise2_Lab2.scala 33:12]
    
