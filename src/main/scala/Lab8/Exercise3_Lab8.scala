package Lab8

import chisel3._
import chisel3.util._
import chisel3.experimental.ChiselEnum
import chisel3.util.experimental.loadMemoryFromFile

class INST_IO extends Bundle{
    val addr = Input(UInt(32.W))
    val inst = Output(UInt(32.W))
}

class Exercise3_Lab8 extends Module{
    val io = IO(new INST_IO)
    val i_mem = Mem(32, UInt(32.W))
    loadMemoryFromFile(i_mem, "/home/monis/Desktop/abc.txt")
    io.inst := i_mem(io.addr)
}