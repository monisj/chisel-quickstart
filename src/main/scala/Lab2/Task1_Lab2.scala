package Lab2
import chisel3 . _
class LM_IO_Interface extends Bundle {
    val s0 = Input(Bool())
    val s1 = Input(Bool())
    val s2 = Input(Bool())
    val out = Output(UInt(32.W))
}




class Task1_Lab2 extends Module {
    val io = IO ( new LM_IO_Interface )
    io.out:=0.U

    when(io.s0===0.B && io.s1 ===0.B && io.s2 === 0.B){
        io.out:=0.U
    }.elsewhen(io.s0 === 1.B && io.s1===0.B && io.s2 === 0.B){
        io.out:=8.U
    }.elsewhen(io.s2 === 0.B && io.s1 === 1.B && io.s0 === 0.B ){
        io.out:=16.U
    }.elsewhen(io.s2 === 0.B && (io.s0 & io.s1) === 1.B){
        io.out:=24.U
    }.elsewhen(io.s2 === 1.B){
        io.out:=32.U
    }
}