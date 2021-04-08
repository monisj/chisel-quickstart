package Lab7
import chisel3._
import chisel3.util._

class Arbiter_2 (val n: Int) extends Bundle {
    val in = Flipped(Vec(n,Decoupled(UInt(n. W )) ) )
    val out = Decoupled(UInt(n.W))
}

class Exercise1_Lab7 (val n : Int) extends Module {
    val io = IO(new Arbiter_2(n))
    io.out.bits:=0.U
    io.out.valid:=false.B
    val arb_priority = Module (new Arbiter(UInt(),n))
    io.in(0) <> arb_priority.io.in(0) 
    io.in(1) <> arb_priority.io.in(1) 
    io.in(2) <> arb_priority.io.in(2) 
    io.out <> arb_priority.io.out
}