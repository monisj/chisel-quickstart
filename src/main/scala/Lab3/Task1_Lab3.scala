package Lab3
import chisel3._
import chisel3.util._

class LM_IO_Interface_BranchControl extends Bundle {
    val fnct3 = Input ( UInt (3. W ) )
    val branch = Input ( Bool () )
    val arg_x = Input ( UInt (32. W ) )
    val arg_y = Input ( UInt (32. W ) )
    val br_taken = Output ( Bool () )
}

class Task1_Lab3 extends Module {
    val io = IO (new LM_IO_Interface_BranchControl )
    io.br_taken:=0.B
    when(io.branch === 1.B){
    when((io.arg_x === io.arg_y) && io.fnct3 === "b000".U){
            io.br_taken:=1.B
    }.elsewhen((io.arg_x =/= io.arg_y) && io.fnct3 === "b001".U){
        io.br_taken:=1.B
    }.elsewhen((io.arg_x < io.arg_y) && (io.fnct3 === "b100".U | io.fnct3 === "b110".U)){
        io.br_taken:=1.B
    }.elsewhen((io.arg_x >= io.arg_y) && (io.fnct3 === "b101".U | io.fnct3 === "b111".U)){
        io.br_taken:=1.B
    }.otherwise{
        io.br_taken:=0.B
    }
    }.otherwise{
        io.br_taken:=0.B
    }
}

