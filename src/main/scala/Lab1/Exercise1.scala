package Lab1
import chisel3 . _

class Exercise1 ( counterBits : UInt ) extends Module {
    val io = IO ( new Bundle {
        //val in = Input(UInt(1.W))
        val result = Output(Bool()) 
    })
    val max = (1.S << counterBits ) - 1.S
    val count = RegInit (0.S(16.W))
    
    when( count === max ) {
        count := 0.S
    }.otherwise {
        count := count + 1.S 
    }   
    io.result := count(15.U)
    println (s"counter created with max value $max")
    }