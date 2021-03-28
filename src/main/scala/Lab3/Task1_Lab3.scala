package Lab3
import chisel3._
import chisel3.util._

class LM_IO_Interface_BranchControl extends Bundle {
    val fnct3= Input (UInt(3.W))
    val fnct7 = Input (UInt(7.W))
    val Aluop=Input(UInt(3.W))
    val branch= Input ( Bool () )
    val arg_x= Input ( SInt (32. W ) )
    val arg_y= Input ( SInt (32. W ) )
    val br_taken = Output ( Bool () )
}
class Task1_Lab3 extends Module {
    val io = IO ( new LM_IO_Interface_BranchControl )
    val alu = Module(new Exercise2_Lab3())
    val alucontrol = Module (new ALU_control())

    //Putting inputs into alucontrol
    alucontrol.io.Aluop:=io.Aluop
    alucontrol.io.Func7:=io.fnct7
    alucontrol.io.Func3:=io.fnct3

    //Now to calculate the branch for ALU
    alu.io.A:=io.arg_x
    alu.io.B:=io.arg_y
    alu.io.Aluop:=alucontrol.io.control

    when (io.branch & alu.io.AluBranch === 1.B){
        io.br_taken:=1.B
    }.otherwise{
        io.br_taken:=0.B
    }

}