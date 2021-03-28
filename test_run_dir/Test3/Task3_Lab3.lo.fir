circuit Task3_Lab3 :
  module Task3_Lab3 :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<2>
    output io_out_valid : UInt<1>
    output io_out_bits : UInt<4>

    node _T = eq(io_in, UInt<1>("h0")) @[Task3_Lab3.scala 18:18]
    node _io_out_valid_T = eq(io_out_bits, UInt<1>("h1")) @[Task3_Lab3.scala 20:36]
    node _io_out_valid_T_1 = and(_io_out_valid_T, UInt<1>("h1")) @[Task3_Lab3.scala 20:44]
    node _T_1 = eq(io_in, UInt<1>("h1")) @[Task3_Lab3.scala 21:23]
    node _io_out_valid_T_2 = eq(io_out_bits, UInt<2>("h2")) @[Task3_Lab3.scala 23:36]
    node _io_out_valid_T_3 = and(_io_out_valid_T_2, UInt<1>("h0")) @[Task3_Lab3.scala 23:43]
    node _T_2 = eq(io_in, UInt<2>("h2")) @[Task3_Lab3.scala 24:24]
    node _io_out_valid_T_4 = eq(io_out_bits, UInt<3>("h4")) @[Task3_Lab3.scala 26:36]
    node _io_out_valid_T_5 = and(_io_out_valid_T_4, UInt<1>("h0")) @[Task3_Lab3.scala 26:44]
    node _io_out_valid_T_6 = eq(io_out_bits, UInt<4>("h8")) @[Task3_Lab3.scala 29:36]
    node _io_out_valid_T_7 = and(_io_out_valid_T_6, UInt<1>("h0")) @[Task3_Lab3.scala 29:44]
    node _GEN_0 = mux(_T_2, UInt<3>("h4"), UInt<4>("h8")) @[Task3_Lab3.scala 24:38 Task3_Lab3.scala 25:21 Task3_Lab3.scala 28:21]
    node _GEN_1 = mux(_T_2, _io_out_valid_T_5, _io_out_valid_T_7) @[Task3_Lab3.scala 24:38 Task3_Lab3.scala 26:21 Task3_Lab3.scala 29:21]
    node _GEN_2 = mux(_T_1, UInt<2>("h2"), _GEN_0) @[Task3_Lab3.scala 21:37 Task3_Lab3.scala 22:21]
    node _GEN_3 = mux(_T_1, _io_out_valid_T_3, _GEN_1) @[Task3_Lab3.scala 21:37 Task3_Lab3.scala 23:21]
    node _GEN_4 = mux(_T, UInt<1>("h1"), _GEN_2) @[Task3_Lab3.scala 18:32 Task3_Lab3.scala 19:21]
    node _GEN_5 = mux(_T, _io_out_valid_T_1, _GEN_3) @[Task3_Lab3.scala 18:32 Task3_Lab3.scala 20:21]
    io_out_valid <= _GEN_5
    io_out_bits <= _GEN_4
