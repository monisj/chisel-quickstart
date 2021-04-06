package Lab6
import chisel3._
import chisel3.util._


class shift_register(n:Int) extends Bundle {
val in = Vec(n,Input (UInt(4.W)))
val out = Output ( UInt (4. W ) )    
}

//val loadReg = RegInit(0.U(4.W))
//when (load) {
//    loadReg := d                          Example Code of Parallel load Shift
//}.otherwise{
//    loadReg := Cat(0.U, loadReg(3, 1))
//}
//val serOut = loadReg(0)


class Exercise1_Lab6(n:Int) extends Module{
    val io = IO (new shift_register(n))
    val register = Reg(Vec(32,UInt(32.W)))
    for (i <- 0 until n){
        register(i):=io.in(i)
    }
    //val state = 0.U
    for (i <- 0 until n){
        io.out:=register(i)
    }
    //io.out:=state
    
}