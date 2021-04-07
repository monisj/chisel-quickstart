package Lab6
import chisel3._
import chisel3.util._


class counter_with_xor ( val max : Int) extends Bundle {
    val in =Input(UInt(max.W))
    val out = Output(Bool())
}

class Task2_Lab6 (val max: Int) extends Module{
    val io=IO(new counter_with_xor(max))
    val counter = RegInit(0.U(4.W))
    io.out:=0.B
    when (counter === io.in ){
        counter:=0.U
        io.out:=1.B
    }.otherwise{
        counter:=counter+1.U
        io.out:=0.B
    }
}
