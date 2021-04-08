package Lab6
import chisel3._
import chisel3.util._

class Exercise4_Lab6 extends Module {
    val io = IO ( new Bundle {
    val in = Flipped ( Decoupled ( UInt (8. W ) ) ) // valid = Input , ready =Output , bits = Input
    val out = Decoupled ( UInt (8. W ) )
    })

    io.out.bits:=0.U
    io.out.valid:=true.B
    //io.out.ready:=true.B
    val queue = Queue ( io . in , 5)
    val queue_1 =Queue (queue,5) 


    queue.nodeq()
    queue_1.nodeq()

     when (queue.valid && queue_1.valid && io.in.ready) {
        io.out.enq(queue_1.deq())
}
}