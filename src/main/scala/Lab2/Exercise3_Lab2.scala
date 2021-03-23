package Lab2
import chisel3._
import chisel3.util._

class Exercise3_Lab2 extends Module {
    val io = IO ( new Bundle {
        val in0 = Input (Bool())
        val in1 = Input (Bool())
        val in2 = Input (Bool())
        val in3 = Input (Bool())
        val out1 = Output (UInt(2.W))
        //val en_out= Output(UInt(4.W))
    })  
        val select = Cat(io.in0,io.in1,io.in2,io.in3)
        io.out1 := Mux1H ( select , Seq ( "b00".U,"b01".U,"b10".U,"b11".U ))
}