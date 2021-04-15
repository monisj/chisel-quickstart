;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Task2_lab7 : 
  module Task2_lab7 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<1>, flip start : UInt<1>, out : UInt<8>, flag : UInt<1>}
    
    reg state1_Reg : UInt<8>, clock with : (reset => (reset, UInt<8>("h00"))) @[Task2_lab7.scala 17:29]
    reg state_Reg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[Task2_lab7.scala 18:28]
    io.flag <= UInt<1>("h00") @[Task2_lab7.scala 19:13]
    io.out <= state_Reg @[Task2_lab7.scala 20:12]
    node _T = eq(state_Reg, UInt<1>("h00")) @[Task2_lab7.scala 22:20]
    when _T : @[Task2_lab7.scala 22:31]
      node _T_1 = eq(io.start, UInt<1>("h01")) @[Task2_lab7.scala 23:23]
      when _T_1 : @[Task2_lab7.scala 23:34]
        state_Reg <= UInt<1>("h01") @[Task2_lab7.scala 24:22]
        skip @[Task2_lab7.scala 23:34]
      else : @[Task2_lab7.scala 25:20]
        io.out <= state1_Reg @[Task2_lab7.scala 26:19]
        io.flag <= UInt<1>("h00") @[Task2_lab7.scala 27:20]
        skip @[Task2_lab7.scala 25:20]
      skip @[Task2_lab7.scala 22:31]
    else : @[Task2_lab7.scala 29:37]
      node _T_2 = eq(state_Reg, UInt<1>("h01")) @[Task2_lab7.scala 29:26]
      when _T_2 : @[Task2_lab7.scala 29:37]
        node _T_3 = eq(io.start, UInt<1>("h00")) @[Task2_lab7.scala 30:23]
        when _T_3 : @[Task2_lab7.scala 30:35]
          state_Reg <= UInt<1>("h00") @[Task2_lab7.scala 31:23]
          skip @[Task2_lab7.scala 30:35]
        else : @[Task2_lab7.scala 32:20]
          node _state1_Reg_T = dshl(state1_Reg, UInt<1>("h01")) @[Task2_lab7.scala 33:37]
          node _state1_Reg_T_1 = or(_state1_Reg_T, io.in) @[Task2_lab7.scala 33:45]
          state1_Reg <= _state1_Reg_T_1 @[Task2_lab7.scala 33:23]
          io.out <= state1_Reg @[Task2_lab7.scala 34:19]
          io.flag <= UInt<1>("h01") @[Task2_lab7.scala 35:20]
          skip @[Task2_lab7.scala 32:20]
        skip @[Task2_lab7.scala 29:37]
    
