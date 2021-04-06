package Lab6
import chisel3._
import chisel3.util._

class Exercise3_Lab6 ( val max : Int ) extends Module {
    val io = IO ( new Bundle {
    val in = Input (UInt(4.W))
    val clock_High = Output (Bool())
    })
    val counter = RegInit (max. U (4.W ) )
    val done = counter === 0. U
    val next = WireInit(0.U)
    io.clock_High:=0.B
    when (!done){
        next:=counter - 1.U
         io.clock_High:=0.B
    }.elsewhen(done){
        io.clock_High := 1.B
    }.elsewhen(counter === 0.U){
      //  when(done){
        //io.clock_High := 1.B
        //next := counter + 1.U
        //}.otherwise{
         //   next:=counter+1.U
        //}
}
    counter:=next}