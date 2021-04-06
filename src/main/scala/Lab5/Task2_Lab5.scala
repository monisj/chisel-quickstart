package Lab5
import chisel3._
import chisel3.util._

class Transaction[T<:Data](gen:T) extends Bundle{
    val address = UInt(10.W)
    val data_packet = gen
    override def cloneType = (new Transaction(gen)).asInstanceOf[this.type]
}

class Task2_Lab5[T<:Data](gen:T, gen1:T) extends Module{
    val io = IO(new Bundle{
        val in = Input(new Transaction(gen))
        val out = Output(new Transaction(gen1))
    })
    io.out <> io.in
}