package Lab5

import chisel3._
import chisel3.util._


class Task1_Lab5 ( Width : Int ) extends Module {
    require ( Width >= 0)
    val io = IO(new Bundle{
        val in_0 = Input(UInt(Width.W))
        val in_1 = Input(UInt(Width.W))
        val sum_out = Output(UInt(Width.W))
    })
    io.sum_out := io.in_0 + io.in_1
}