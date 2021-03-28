;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Task3_Lab3 : 
  module Task3_Lab3 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<2>, out : {valid : UInt<1>, bits : UInt<4>}}
    
    io.out.valid <= UInt<1>("h01") @[Task3_Lab3.scala 17:17]
    node _T = eq(io.in, UInt<1>("h00")) @[Task3_Lab3.scala 18:18]
    when _T : @[Task3_Lab3.scala 18:32]
      io.out.bits <= UInt<1>("h01") @[Task3_Lab3.scala 19:21]
      node _io_out_valid_T = eq(io.out.bits, UInt<1>("h01")) @[Task3_Lab3.scala 20:36]
      node _io_out_valid_T_1 = and(_io_out_valid_T, UInt<1>("h01")) @[Task3_Lab3.scala 20:44]
      io.out.valid <= _io_out_valid_T_1 @[Task3_Lab3.scala 20:21]
      skip @[Task3_Lab3.scala 18:32]
    else : @[Task3_Lab3.scala 21:37]
      node _T_1 = eq(io.in, UInt<1>("h01")) @[Task3_Lab3.scala 21:23]
      when _T_1 : @[Task3_Lab3.scala 21:37]
        io.out.bits <= UInt<2>("h02") @[Task3_Lab3.scala 22:21]
        node _io_out_valid_T_2 = eq(io.out.bits, UInt<2>("h02")) @[Task3_Lab3.scala 23:36]
        node _io_out_valid_T_3 = and(_io_out_valid_T_2, UInt<1>("h00")) @[Task3_Lab3.scala 23:43]
        io.out.valid <= _io_out_valid_T_3 @[Task3_Lab3.scala 23:21]
        skip @[Task3_Lab3.scala 21:37]
      else : @[Task3_Lab3.scala 24:38]
        node _T_2 = eq(io.in, UInt<2>("h02")) @[Task3_Lab3.scala 24:24]
        when _T_2 : @[Task3_Lab3.scala 24:38]
          io.out.bits <= UInt<3>("h04") @[Task3_Lab3.scala 25:21]
          node _io_out_valid_T_4 = eq(io.out.bits, UInt<3>("h04")) @[Task3_Lab3.scala 26:36]
          node _io_out_valid_T_5 = and(_io_out_valid_T_4, UInt<1>("h00")) @[Task3_Lab3.scala 26:44]
          io.out.valid <= _io_out_valid_T_5 @[Task3_Lab3.scala 26:21]
          skip @[Task3_Lab3.scala 24:38]
        else : @[Task3_Lab3.scala 27:17]
          io.out.bits <= UInt<4>("h08") @[Task3_Lab3.scala 28:21]
          node _io_out_valid_T_6 = eq(io.out.bits, UInt<4>("h08")) @[Task3_Lab3.scala 29:36]
          node _io_out_valid_T_7 = and(_io_out_valid_T_6, UInt<1>("h00")) @[Task3_Lab3.scala 29:44]
          io.out.valid <= _io_out_valid_T_7 @[Task3_Lab3.scala 29:21]
          skip @[Task3_Lab3.scala 27:17]
    
