package Lab4
import chisel3._
import chisel3.util._

trait Config {
// word length configuration parameter
val WLEN= 32
// ALU operation control signal width
val ALUOP_SIG_LEN = 4
}

import ALUOP . _
class ALUIO extends Bundle with Config {
        val in_A= Input ( UInt ( WLEN . W ) )
        val in_B= Input ( UInt ( WLEN . W ) )
        val alu_Op= Input ( UInt ( ALUOP_SIG_LEN . W ) )
        val out= Output ( UInt ( WLEN . W ) )
        val sum= Output ( UInt ( WLEN . W ) )
}

class ALU_EX extends Module with Config {
    val io = IO ( new ALUIO )
        val sum= io . in_A + Mux ( io . alu_Op (0) , - io . in_B , io . in_B )
        val cmp= Mux ( io . in_A ( WLEN -1) === io . in_B ( WLEN -1) , sum ( WLEN -1) ,
        Mux ( io . alu_Op (1) , io . in_B ( WLEN -1) , io . in_A ( WLEN -1) ) )
        
        val shamt =io . in_B (4 ,0).asUInt
        val shin = Mux ( io . alu_Op (3) , io . in_A , Reverse ( io . in_A ) )
        val shiftr = ( Cat ( io . alu_Op (0) && shin ( WLEN -1) , shin ) . asSInt >> shamt ) (WLEN -1 , 0)
        val shiftl = Reverse ( shiftr )
        val out =
        Mux ( io.alu_Op === ALU_ADD || io . alu_Op === ALU_SUB , sum ,
        Mux ( io. alu_Op === ALU_SLT || io . alu_Op === ALU_SLTU , cmp ,
        Mux ( io . alu_Op === ALU_SRA || io . alu_Op === ALU_SRL , shiftr ,
        Mux ( io . alu_Op === ALU_SLL , shiftl ,
        Mux ( io . alu_Op === ALU_AND , ( io . in_A & io . in_B ) ,
        Mux ( io . alu_Op === ALU_OR , ( io . in_A | io . in_B ) ,
        Mux ( io . alu_Op === ALU_XOR , ( io . in_A ^ io . in_B ) ,
        Mux ( io . alu_Op === ALU_COPY_A , io . in_A ,
        Mux ( io . alu_Op === ALU_COPY_A , io . in_B , 0. U ) ) ) ) ) ) ) ) )
    io . out := out
io . sum := sum
}
