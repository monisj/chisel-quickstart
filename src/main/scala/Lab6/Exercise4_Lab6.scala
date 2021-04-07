package Lab6
import chisel3._
import chisel3.util._

class Exercise4_Lab6 extends Module {
    val io = IO ( new Bundle {
    val in = Flipped ( Decoupled ( UInt (8. W ) ) ) // valid = Input , ready =Output , bits = Input
    val out = Decoupled ( UInt (8. W ) )
    })

    val queue = Queue ( io . in , 5)
    val queue_1 =Queue (queue,5)  // 5 - element queue

io.out <> queue_1
}