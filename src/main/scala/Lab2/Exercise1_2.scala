package Lab2
import chisel3._

class Exercise1_2 extends Module {
       val io=IO(new Bundle{ 
        val in_A= Input(UInt(32.W))
        val in_B= Input(UInt(32.W))
        val select=Input(Bool())
        val out=Output(UInt(32.W))
})
    io.out:= io.in_A & io.select | io.in_B & (~ io.select )
}