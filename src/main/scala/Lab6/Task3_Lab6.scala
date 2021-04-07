package Lab6
import chisel3._
import chisel3.util._


class shift_register_2(n:Int = 1) extends Bundle {
    val load_in = Vec(n,Input (UInt(n.W)))
    val load = Input(Bool())
    val out= Vec(n,Output(UInt(n.W)))
}

class Task3_Lab6(n:Int) extends Module{
    val io = IO (new shift_register_2)
    val state = RegInit(0.U(n.W))
    val load = RegInit(0.U(n.W))
    io.out(0):=0.U
    when(io.load === 0.U){
        load:=load+1.U
        state:=io.load_in(load)
        io.out(0):=state(0)
    }
        
    
}