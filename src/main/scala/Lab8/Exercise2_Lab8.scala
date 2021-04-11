package Lab8
import chisel3._
import chisel3.util._

class Mem_Input (width : Int = 8) extends Bundle {
    val enable = Input ( Bool () )
    val write = Input ( Bool () )
    val addr = Input ( UInt (10.W))
    val mask = Input ( Vec (4 , Bool()))
    val dataIn = Input ( Vec (4 , UInt (width.W)))
    val dataOut = Output ( Vec (4 , UInt ( width.W)))
    val rdAddr = Input ( UInt (10. W ) )
    val wrAddr = Input ( UInt (10. W ) )
}

class Exercise2_Lab8(width : Int = 8) extends Module {
    val io = IO ( new Mem_Input (width))
    val mem = SyncReadMem (1024,Vec (4 ,UInt (width.W)))
    val wrDataReg = RegNext ( io . dataIn(0) )
    val wrDataReg1 = RegNext (io. dataIn(1))
    val doForwardReg = RegNext ( io . wrAddr === io . rdAddr && io .enable )
    val doForwardReg1 = RegNext ( io . wrAddr =/= io . rdAddr && io .enable )
    val memread =mem.read(io.addr, io. enable)
    io.dataOut(0):=0.U
    io.dataOut(1):=0.U
    io.dataOut(2):=0.U
    io.dataOut(3):=0.U
    when(io.write){
    mem.write ( io.addr , io.dataIn , io.mask )
    }

    when(doForwardReg === 1.U){

    io.dataOut(0):=wrDataReg
    }.otherwise{
        when(doForwardReg1 === 1.U){
    io.dataOut(0):=wrDataReg1
        }.otherwise{
            io.dataOut:=memread
        }
}
}