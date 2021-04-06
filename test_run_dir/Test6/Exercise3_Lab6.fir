;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Exercise3_Lab6 : 
  module Exercise3_Lab6 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<4>, clock_High : UInt<1>}
    
    reg counter : UInt<4>, clock with : (reset => (reset, UInt<4>("h0f"))) @[Exercise3_Lab6.scala 10:27]
    node done = eq(counter, UInt<1>("h00")) @[Exercise3_Lab6.scala 11:24]
    wire next : UInt
    next <= UInt<1>("h00")
    io.clock_High <= UInt<1>("h00") @[Exercise3_Lab6.scala 13:18]
    node _T = eq(done, UInt<1>("h00")) @[Exercise3_Lab6.scala 14:11]
    when _T : @[Exercise3_Lab6.scala 14:17]
      node _next_T = sub(counter, UInt<1>("h01")) @[Exercise3_Lab6.scala 15:23]
      node _next_T_1 = tail(_next_T, 1) @[Exercise3_Lab6.scala 15:23]
      next <= _next_T_1 @[Exercise3_Lab6.scala 15:13]
      io.clock_High <= UInt<1>("h00") @[Exercise3_Lab6.scala 16:23]
      skip @[Exercise3_Lab6.scala 14:17]
    else : @[Exercise3_Lab6.scala 17:21]
      when done : @[Exercise3_Lab6.scala 17:21]
        io.clock_High <= UInt<1>("h01") @[Exercise3_Lab6.scala 18:23]
        skip @[Exercise3_Lab6.scala 17:21]
      else : @[Exercise3_Lab6.scala 19:32]
        node _T_1 = eq(counter, UInt<1>("h00")) @[Exercise3_Lab6.scala 19:24]
        when _T_1 : @[Exercise3_Lab6.scala 19:32]
          counter <= next @[Exercise3_Lab6.scala 20:16]
          when done : @[Exercise3_Lab6.scala 21:19]
            io.clock_High <= UInt<1>("h01") @[Exercise3_Lab6.scala 22:23]
            node _next_T_2 = add(counter, UInt<1>("h01")) @[Exercise3_Lab6.scala 23:25]
            node _next_T_3 = tail(_next_T_2, 1) @[Exercise3_Lab6.scala 23:25]
            next <= _next_T_3 @[Exercise3_Lab6.scala 23:14]
            skip @[Exercise3_Lab6.scala 21:19]
          else : @[Exercise3_Lab6.scala 24:20]
            node _next_T_4 = add(counter, UInt<1>("h01")) @[Exercise3_Lab6.scala 25:26]
            node _next_T_5 = tail(_next_T_4, 1) @[Exercise3_Lab6.scala 25:26]
            next <= _next_T_5 @[Exercise3_Lab6.scala 25:17]
            skip @[Exercise3_Lab6.scala 24:20]
          skip @[Exercise3_Lab6.scala 19:32]
    counter <= next @[Exercise3_Lab6.scala 29:12]
    
