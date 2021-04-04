package Lab5
import chisel3._
import chisel3.util._


class Multiplexer [T<:Data](gen:T) extends Bundle{
    val out = Output ( gen )
    val in_1 = Input ( gen )
    val in_2 = Input ( gen )
    val sel_in = Input ( Bool () )   
}

class Exercise2_Lab5 [T<:Data](size : T) extends Module{
    val io = IO(new Multiplexer(size))
    io.out := Mux( io.sel_in , io.in_2 , io.in_1 )
}