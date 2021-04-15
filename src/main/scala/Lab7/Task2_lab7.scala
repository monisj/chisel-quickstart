package Lab7

import chisel3._
import chisel3.util._
import chisel3.experimental.ChiselEnum

class Manchester_FSM (n : Int = 1) extends Bundle {
    val in = Input ( UInt (n. W ) )
        val start = Input ( Bool () )
        val out = Output ( UInt (8. W ) )
        val flag = Output ( UInt (n. W ) )
}

class Task2_lab7 (width : Int = 8) extends Module {
    val io = IO (new Manchester_FSM)
    val state1 :: state2 :: Nil = Enum(2)
    val state1_Reg = RegInit(0.U(width.W))
    val state_Reg = RegInit(state1) //Seperate Use of Registers to define States 
    io.flag := 0.U
    io.out := state_Reg

    when(state_Reg === state1){
        when(io.start === true.B){
            state_Reg:=state2        
        }.otherwise{
            io.out:=state1_Reg
            io.flag:=false.B
        }
    }.elsewhen(state_Reg === state2){
        when(io.start === false.B){
            state1_Reg:=(state1_Reg << 1.U) | io.in
            io.out:=state1_Reg
            io.flag:=true.B
        }
    }
}