package Lab5
import chisel3._
import chisel3.util._

class Transaction_In [T <: Data ](gen1: T) extends Bundle{
    val in = Input(gen1)
    val sel = Input (Bool())
    val address = Input(UInt(10.W))
    val out = Output(UInt(32.W))
}
class Task2_Lab5 [ T <: Data ]( gen1 : T ) extends Module {
    val io = IO (new Transaction_In(gen1))
    io.out := Mux(io.sel,io.in,io.address)
}