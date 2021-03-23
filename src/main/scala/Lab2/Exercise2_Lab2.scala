package Lab2
import chisel3 . _
import chisel3 . util . _
class Exercise2_Lab2 extends Module {
    val io = IO ( new Bundle {
        val in0 = Input (UInt(4.W))
        val in1 = Input (UInt(4.W))
        val in2 = Input (UInt(4.W))
        val in3 = Input (UInt(4.W))
        val in4 = Input (UInt(4.W))
        val in5 = Input (UInt(4.W))
        val in6 = Input (UInt(4.W))
        val in7 = Input (UInt(4.W))
        val sel_mux = Input (UInt(1.W ))
        val sel = Input(UInt(2.W)) //Two branch Mux select
        val out = Output (UInt(4.W))
    })
    val Mux_1=MuxLookup(io.sel,false.B,Array(
    (0.U) -> io.in0 ,
    (1.U) -> io.in1 ,
    (2.U) -> io.in2 ,
    (3.U) -> io.in3 ,
    ))

    val Mux_2=MuxLookup(io.sel,false.B,Array(
    (0.U) -> io.in4 ,
    (1.U) -> io.in5 ,
    (2.U) -> io.in6 ,
    (3.U) -> io.in7 ,
    ))


    io.out := MuxLookup ( io.sel_mux , false.B , Array (
    (0.U ) ->Mux_1 ,
    (1.U ) ->Mux_2)
)
}