package Lab6
import chisel3._
import chisel3.util._

class Exercise3_Lab6 ( val max : Int ) extends Module {
    val io = IO ( new Bundle {
    val in = Input (UInt(4.W))
    val clock_High = Output (Bool())
    })
    val counter = RegInit (max. U (4.W))
    val counter_2 = RegInit(max.U(4.W))
    io.clock_High:=0.B
    when (counter === max.U){
        io.clock_High:=1.B
        counter:=counter-1.U
        counter_2:=counter_2-1.U
    }.elsewhen(counter === 0.U){
        when(counter_2 === 0.U){
            io.clock_High:=1.B
            counter_2 := counter_2 +1.U
        }.elsewhen(counter_2 === max.U){
            io.clock_High:=1.B
            counter:=max.U
        }.otherwise{
            io.clock_High:=0.B
            counter_2:=counter_2+1.U
        }
    }.otherwise{
        io.clock_High:=0.B
        counter_2:=counter_2-1.U
        counter:=counter-1.U
    }
}