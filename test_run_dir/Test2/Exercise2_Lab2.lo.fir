circuit Exercise2_Lab2 :
  module Exercise2_Lab2 :
    input clock : Clock
    input reset : UInt<1>
    input io_in0 : UInt<4>
    input io_in1 : UInt<4>
    input io_in2 : UInt<4>
    input io_in3 : UInt<4>
    input io_in4 : UInt<4>
    input io_in5 : UInt<4>
    input io_in6 : UInt<4>
    input io_in7 : UInt<4>
    input io_sel_mux : UInt<1>
    input io_sel : UInt<2>
    output io_out : UInt<4>

    node _Mux_1_T = eq(UInt<1>("h1"), io_sel) @[Mux.scala 80:60]
    node _Mux_1_T_1 = mux(_Mux_1_T, io_in1, io_in0) @[Mux.scala 80:57]
    node _Mux_1_T_2 = eq(UInt<2>("h2"), io_sel) @[Mux.scala 80:60]
    node _Mux_1_T_3 = mux(_Mux_1_T_2, io_in2, _Mux_1_T_1) @[Mux.scala 80:57]
    node _Mux_1_T_4 = eq(UInt<2>("h3"), io_sel) @[Mux.scala 80:60]
    node Mux_1 = mux(_Mux_1_T_4, io_in3, _Mux_1_T_3) @[Mux.scala 80:57]
    node _Mux_2_T = eq(UInt<1>("h1"), io_sel) @[Mux.scala 80:60]
    node _Mux_2_T_1 = mux(_Mux_2_T, io_in5, io_in4) @[Mux.scala 80:57]
    node _Mux_2_T_2 = eq(UInt<2>("h2"), io_sel) @[Mux.scala 80:60]
    node _Mux_2_T_3 = mux(_Mux_2_T_2, io_in6, _Mux_2_T_1) @[Mux.scala 80:57]
    node _Mux_2_T_4 = eq(UInt<2>("h3"), io_sel) @[Mux.scala 80:60]
    node Mux_2 = mux(_Mux_2_T_4, io_in7, _Mux_2_T_3) @[Mux.scala 80:57]
    node _io_out_T = eq(UInt<1>("h1"), io_sel_mux) @[Mux.scala 80:60]
    node _io_out_T_1 = mux(_io_out_T, Mux_2, Mux_1) @[Mux.scala 80:57]
    io_out <= _io_out_T_1 @[Exercise2_Lab2.scala 33:12]
