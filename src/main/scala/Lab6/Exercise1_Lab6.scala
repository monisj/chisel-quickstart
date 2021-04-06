import chisel3._
import chisel3.util._


class shift_register extends Bundle {
val in = Input ( Bool () )
val out = Output ( UInt (4. W ) )
}

class Exercise1_Lab6[T<:Data](gen:T) extends Module{
    val io = IO (new shift_register)
    val state = RegInit ( init . U (4. W ) )
    // register initialization
    // serial data in at LSB
    val nextState = ( state << 1) | io . in
    state := nextState
}