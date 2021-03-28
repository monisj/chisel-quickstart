package Lab2
import chisel3._

class Exercise1_Lab2 extends Module {
       val io=IO(new Bundle{ 
        val in_A= Input(UInt(32.W))
        val in_B= Input(UInt(32.W))
        val select=Input(Bool())
        val out=Output(UInt(32.W))
})
    val sel_A = 1.B
    val sel_B = 1.B
    io.out:=0.U
    when(io.select===1.B){
        io.out:=io.in_A
    }.elsewhen(~io.select === 1.B){
        io.out:=io.in_B
    }
}