package Lab1
import chisel3 . _

class Task2 ( size : Int , maxValue : Int ) extends Module {
    val io = IO ( new Bundle {
        val result = Output ( Bool () )
    })
    
    def genCounter ( n : Int , max : Int ) = {
        val count = RegInit (0.U(n.W) )
        val count_result = RegInit (0.U(n.W) )
        when ( count === max.asUInt ) {
            io.result :=1.B
            when (count_result === count){
                count_result := count_result-1.U
            }.elsewhen(count_result === 0.U){
                io.result:=1.B
                count := 0.U
            }.otherwise{
                count_result := count_result-1.U
                io.result:=0.B
            }
            //val count_down = counterdown(max.asUInt,count)
            //count:=0.U
        }.elsewhen ( count === 0.U){
            count := count + 1. U
            count_result := count+1.U
            io.result :=1.B
        }.otherwise {
            count := count + 1. U
            count_result := count+1.U
            io.result :=0.B
        }
        count
    }
val counter1 = genCounter ( size , maxValue )
//io . result := counter1 ( size -1)
}
//println (( new chisel3 . stage . ChiselStage ) . emitVerilog ( new Counter (8 , 255. U ) ) )