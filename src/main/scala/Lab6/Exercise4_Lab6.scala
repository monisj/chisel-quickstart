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

//def enq(dat: T): T = {
  //    target.valid := true.B  Explination
    //  target.bits := dat
      //dat
    //}



    queue.nodeq()
    queue_1.nodeq()

     when (queue_1.valid && io.in.ready) {
        io.out.enq(queue_1.deq())
}
}