package Lab8
import chisel3._
import chisel3.util._

class Mem_IO (width : Int = 8) extends Bundle {
    val enable = Input ( Bool () )
    val write = Input ( Bool () )
    val addr = Input ( UInt (10.W))
    val mask = Input ( Vec (4 , Bool()))
    val dataIn = Input ( Vec (4 , UInt (width.W)))
    val dataOut = Output ( Vec (4 , UInt ( width.W)))
}

class Exercise1_Lab8(width : Int = 8) extends Module {
    val io = IO ( new Mem_IO (width))
    val mem = SyncReadMem (1024,Vec (4 ,UInt (width.W)))
    
    mem.write ( io.addr , io.dataIn , io.mask )
    io.dataOut := mem.read ( io.addr , io.enable )
}