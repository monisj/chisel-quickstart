package Lab8
import chisel3._
import chisel3.util._

class Mem_Input (width : Int = 8) extends Bundle {
    val enable = Input ( Bool () )
    val write = Input ( Bool () )
    val addr = Input ( UInt (10.W))
    val mask = Input ( Vec (2 , Bool()))
    val dataIn = Input ( Vec (2 , UInt (width.W)))
    val dataOut = Output ( Vec (2 , UInt ( width.W)))
    
}

class Exercise2_Lab8(width : Int = 16) extends Module {
    val io = IO ( new Mem_Input (width))
    val mem = SyncReadMem (1024,Vec (2 ,UInt (width.W)))
    val wrDataReg = RegNext ( io . dataIn)
    val doForwardReg = RegNext ( io.enable === true.B && io.write === true.B )
    val memread =mem.read(io.addr, io. enable)
    io.dataOut(0):=0.U
    io.dataOut(1):=0.U

    when(io.write){
    mem.write ( io.addr , io.dataIn , io.mask )
    }

    when(doForwardReg === 1.U){
        for (data <- 0 until 2){ //Passing for two bank memory
            io.dataOut(data):=Mux(doForwardReg,Mux(io.mask(data) , wrDataReg(data),0.U),0.U)
        }
    }.otherwise{
            io.dataOut:=memread
        
    }
}