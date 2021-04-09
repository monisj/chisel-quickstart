;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Task1_Lab7 : 
  module Task1_Lab7 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<1>, out : UInt<1>}
    
    reg state : UInt<2>, clock with : (reset => (reset, UInt<2>("h00"))) @[Task1_Lab7.scala 15:25]
    node _io_out_T = eq(state, UInt<2>("h00")) @[Task1_Lab7.scala 17:19]
    node _io_out_T_1 = and(_io_out_T, io.in) @[Task1_Lab7.scala 17:25]
    io.out <= _io_out_T_1 @[Task1_Lab7.scala 17:11]
    node _T = eq(UInt<2>("h00"), state) @[Conditional.scala 37:30]
    when _T : @[Conditional.scala 40:58]
      when io.in : @[Task1_Lab7.scala 20:30]
        state <= UInt<2>("h01") @[Task1_Lab7.scala 21:23]
        skip @[Task1_Lab7.scala 20:30]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_1 = eq(UInt<2>("h01"), state) @[Conditional.scala 37:30]
      when _T_1 : @[Conditional.scala 39:67]
        node _T_2 = eq(io.in, UInt<1>("h00")) @[Task1_Lab7.scala 25:20]
        when _T_2 : @[Task1_Lab7.scala 25:31]
          state <= UInt<2>("h02") @[Task1_Lab7.scala 26:23]
          skip @[Task1_Lab7.scala 25:31]
        else : @[Task1_Lab7.scala 27:26]
          state <= UInt<2>("h00") @[Task1_Lab7.scala 28:23]
          skip @[Task1_Lab7.scala 27:26]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_3 = eq(UInt<2>("h02"), state) @[Conditional.scala 37:30]
        when _T_3 : @[Conditional.scala 39:67]
          node _T_4 = eq(io.in, UInt<1>("h00")) @[Task1_Lab7.scala 32:19]
          when _T_4 : @[Task1_Lab7.scala 32:31]
            state <= UInt<2>("h00") @[Task1_Lab7.scala 33:23]
            skip @[Task1_Lab7.scala 32:31]
          skip @[Conditional.scala 39:67]
    
