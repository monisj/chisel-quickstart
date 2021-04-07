package Lab6
import chisel3._
import chisel3.util._


class shift_register_2(n:Int) extends Bundle {
    val in = Vec(n,Input (UInt(n.W)))
    val load = Input(Bool())
    val out= Vec(n,Output(UInt(n.W)))
}

//val loadReg = RegInit(0.U(4.W))
//when (load) {
//    loadReg := d                          Example Code of Parallel load Shift
//}.otherwise{
//    loadReg := Cat(0.U, loadReg(3, 1))
//}
//val serOut = loadReg(0)


class Task3_Lab6(n:Int) extends Module{
    val io = IO (new shift_register_2(n))
    val state = RegInit(0.U(n.W))
    val load = RegInit(0.U(n.W))
    for (i <- 0 until n){
        io.out(i):=0.U
    }
    when(io.load === 0.U){
        load:=load+1.U
        state:=io.in(load)
        
    }
}