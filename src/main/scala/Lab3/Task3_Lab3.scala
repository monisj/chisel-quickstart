package Lab3
import chisel3 . _
import chisel3.util._
import chisel3.util.Valid



class LM_IO_Interface_decoder_with_valid extends Bundle {
val in = Input (UInt(2.W))
val out = Valid(Output(UInt(4.W)))
}



class Task3_Lab3 extends Module {
val io = IO ( new LM_IO_Interface_decoder_with_valid )
    io.out.valid:=false.B
    when ( io.in === "b00".U ) {
        io.out.bits := "b0001".U
        io.out.valid:= io.out.bits === 1.U && false.B
    }.elsewhen (io.in === "b01".U ) {
        io.out.bits := "b0010".U
        io.out.valid:= io.out.bits ===2.U && true.B
    }.elsewhen ( io.in === "b10".U ) {
        io.out.bits := "b0100".U
        io.out.valid:= io.out.bits === 4.U && true.B
    }.otherwise {
        io.out.bits := "b1000".U
        io.out.valid:= io.out.bits === 8.U && true.B
    }
}